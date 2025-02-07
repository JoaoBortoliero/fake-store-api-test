package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import models.Cart;
import models.Product;
import org.apache.http.HttpStatus;
import page.CartPage;
import page.ProductPage;
import utils.Utilities;

import java.util.List;

import static io.restassured.RestAssured.given;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

public class CartSteps {
    RequestSpecification requestSpecification;
    Response cartResponse;


    @Given("obtenho todos os carrinhos")
    public void obtenhoTodosOsCarrinhos() {
        requestSpecification = given();
    }

    @Given("obtenho carrinho com identificador {int}")
    public void obtenhoCarrinhoComIdentificador(int id) {
        requestSpecification = given().pathParam("cartId", id);
    }

    @When("realizo requisicao de carrinho {string}")
    public void realizoRequisicaoDeCarrinho(String operation) {
        try {
            switch (operation) {
                case "get all", "get single" ->
                        cartResponse = requestSpecification.when().get(CartPage.getCartEndpoint(operation));
                case "create" ->
                        cartResponse = requestSpecification.when().post(ProductPage.getProductEndpoint(operation));
                case "update" ->
                        cartResponse = requestSpecification.when().put(ProductPage.getProductEndpoint(operation));
                case "delete" ->
                        cartResponse = requestSpecification.when().delete(ProductPage.getProductEndpoint(operation));
            }
        } catch (Exception e) {
            throw new RuntimeException("Error executing CART request: " + e.getMessage());
        }
    }

    @Then("informa sucesso na operacao de carrinho {string}")
    public void informaSucessoNaOperacaoDeCarrinho(String operation) {
        try {
            switch (operation) {
                case "get all" -> {
                    List<Cart> carts = cartResponse.then()
                            .statusCode(HttpStatus.SC_OK)
                            .body(is(notNullValue()))
                            .extract()
                            .body().jsonPath().getList("", Cart.class);

                    assertThat(Utilities.isNotNullList(carts), is(true));
                }
                case "get single" -> {
                    Cart cart = cartResponse.then()
                            .statusCode(HttpStatus.SC_OK)
                            .body(is(notNullValue()))
                            .extract()
                            .body().jsonPath().getObject("", Cart.class);

                    assertThat(cart, is(notNullValue()));
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error validating CART response: " + e.getMessage());
        }
    }


}
