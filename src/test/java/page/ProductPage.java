package page;

import lombok.Data;
import models.Product;

import java.util.List;
import java.util.Objects;

public class ProductPage {
    private static final String GET_ALL_PRODUCTS_ENDPOINT = "/products";
    private static final String GET_SINGLE_PRODUCTS_ENDPOINT = "/products/{productId}";
    private static final String LIMIT_RESULTS_PRODUCTS_ENDPOINT = "/products?limit={limit}";
    private static final String SORT_RESULTS_PRODUCTS_ENDPOINT = "/products?sort={sort}";
    private static final String GET_ALL_CATEGORIES_ENDPOINT = "/products/categories";
    private static final String GET_SPECIFIC_CATEGORY_ENDPOINT = "/products/category/{category}";
    private static final String ADD_NEW_PRODUCT_ENDPOINT = "/products";
    private static final String UPDATE_PRODUCT_ENDPOINT = "/products/{productId}";
    private static final String DELETE_PRODUCT_ENDPOINT = "/products/{productId}";

    public static String getProductEndpoint(String operation) throws Exception {
        return switch (operation) {
            case "get all" -> GET_ALL_PRODUCTS_ENDPOINT;
            case "get single" -> GET_SINGLE_PRODUCTS_ENDPOINT;
            case "limit results" -> LIMIT_RESULTS_PRODUCTS_ENDPOINT;
            case "sort results" -> SORT_RESULTS_PRODUCTS_ENDPOINT;
            case "all categories" -> GET_ALL_CATEGORIES_ENDPOINT;
            case "specific category" -> GET_SPECIFIC_CATEGORY_ENDPOINT;
            case "create" -> ADD_NEW_PRODUCT_ENDPOINT;
            case "update" -> UPDATE_PRODUCT_ENDPOINT;
            case "delete" -> DELETE_PRODUCT_ENDPOINT;
            default -> throw new IllegalStateException("Products endpoint not found");
        };
    }

    public static boolean isNotNullProduct(Product product) throws Exception {
        return product.getId() != 0
                && Objects.nonNull(product.getTitle())
                && product.getPrice() != 0
                && Objects.nonNull(product.getCategory())
                && Objects.nonNull(product.getDescription())
                && Objects.nonNull(product.getImage());
    }

    public static boolean isProductSorted(List<Product> products, String sort) throws Exception {
        return switch (sort) {
            case "asc" -> products.stream().allMatch(product -> product.getId() <= products.getLast().getId());
            case "desc" -> products.stream().allMatch(product -> product.getId() >= products.getLast().getId());
            default -> throw new IllegalStateException("Unexpected value: " + sort);
        };
    }



}
