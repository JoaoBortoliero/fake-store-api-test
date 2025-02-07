package steps;

import base.Base;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

import models.Product;
import org.apache.http.HttpStatus;
import page.ProductPage;
import utils.Utilities;

import java.util.HashMap;
import java.util.List;

import static io.restassured.RestAssured.given;

public class ProductSteps {

    private final Base base;

    private RequestSpecification requestSpecification;
    private Response productResponse;

    private HashMap<String, String> product;
    private int limit;
    private String sort;

    public ProductSteps() {
        base = new Base();
    }

    @Before
    public void setUp() {
        base.setUp();
    }

    @Given("obtenho todos os produtos")
    public void obtenhoTodosOsProdutos() {
        requestSpecification = given();
    }

    @Given("obtenho produto com identificador {int}")
    public void obtenhoProdutoComIdentificador(int id) {
        requestSpecification = given().pathParam("productId", id);
    }

    @Given("obtenho produtos com limite de {int}")
    public void obtenhoProdutosComLimiteDeLimit(int limit) {
        requestSpecification = given().pathParam("limit", limit);
        this.limit = limit;
    }

    @Given("obtenho produtos ordenados de forma {string}")
    public void obtenhoProdutosOrdenadosDeForma(String sort) {
        requestSpecification = given().pathParam("sort", sort);
        this.sort = sort;
    }

    @Given("obtenho todas as categorias")
    public void obtenhoTodasAsCategorias() {
        requestSpecification = given();
    }

    @Given("obtenho produtos da categoria {string}")
    public void obtenhoProdutosDaCategoria(String category) {
        requestSpecification = given().pathParam("category", category);
    }

    @Given("crio produto {string}, {double}, {string}, {string} e {string}")
    public void crioProduto(String title, double price, String description, String image, String category) {
        product = new HashMap<>();
        product.put("title", title);
        product.put("price", String.valueOf(price));
        product.put("description", description);
        product.put("image", image);
        product.put("category", category);
        requestSpecification = given().body(product);
    }

    @Given("atualizo produto {int}, {string}, {double}, {string}, {string} e {string}")
    public void atualizoProduto(int id, String title, double price, String description, String image, String category) {
        product = new HashMap<>();
        product.put("title", title);
        product.put("price", String.valueOf(price));
        product.put("description", description);
        product.put("image", image);
        product.put("category", category);
        requestSpecification = given().body(product).pathParam("productId", id);
    }

    @Given("deleto produto com identificador {int}")
    public void deletoProdutoComIdentificador(int productId) {
        requestSpecification = given().pathParam("productId", productId);
    }

    @When("realizo requisicao de produto {string}")
    public void realizoRequisicaoDeProduto(String operation) {
        try {
            switch (operation) {
                case "get all", "get single", "limit results", "sort results", "all categories", "specific category" ->
                        productResponse = requestSpecification.when().get(ProductPage.getProductEndpoint(operation));
                case "create" ->
                        productResponse = requestSpecification.when().post(ProductPage.getProductEndpoint(operation));
                case "update" ->
                        productResponse = requestSpecification.when().put(ProductPage.getProductEndpoint(operation));
                case "delete" ->
                        productResponse = requestSpecification.when().delete(ProductPage.getProductEndpoint(operation));
            }
        } catch (Exception e) {
            throw new RuntimeException("Error executing PRODUCT request: " + e.getMessage());
        }
    }

    @Then("informa sucesso na operacao de produto {string}")
    public void informaSucessoNaOperacaoDeProduto(String operation) {
        try {
            switch (operation) {
                case "get all", "limit results", "sort results", "specific categories" -> {
                    List<Product> products = productResponse.then()
                        .statusCode(HttpStatus.SC_OK)
                        .body(is(notNullValue()))
                        .extract()
                        .body().jsonPath().getList("", Product.class);

                    assertThat(Utilities.isNotNullList(products), is(true));

                    switch (operation){
                        case "limit results" -> assertThat(products.getLast().getId(), is(this.limit));
                        case "sort results" -> assertThat(ProductPage.isProductSorted(products, sort), is(true));
                    }
                }
                case "get single", "create", "update", "delete" -> {
                    Product product = productResponse.then()
                        .statusCode(HttpStatus.SC_OK)
                        .body(is(notNullValue()))
                        .extract()
                        .body().jsonPath().getObject("", Product.class);

                    assertThat(ProductPage.isNotNullProduct(product), is(true));
                }
                case "all categories" -> {
                    List<String> categories = productResponse.then()
                            .statusCode(HttpStatus.SC_OK)
                            .body(is(notNullValue()))
                            .extract()
                            .body().jsonPath().get("");

                    assertThat(categories, is(notNullValue()));
                    System.out.println("Categories: " + categories);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error validating PRODUCT response: " + e.getMessage());
        }
    }



}
