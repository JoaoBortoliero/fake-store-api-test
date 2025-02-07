package page;

import models.Cart;

import java.util.List;
import java.util.Objects;

public class CartPage {
    private static final String GET_ALL_CARTS_ENDPOINT = "/carts";
    private static final String GET_SINGLE_CART_ENDPOINT = "/carts/{cartId}";
    private static final String LIMIT_RESULTS_CARTS_ENDPOINT = "/carts?limit={limit}";
    private static final String SORT_RESULTS_CARTS_ENDPOINT = "/carts?sort={sort}";
    private static final String GET_CARTS_DATE_RANGE_ENDPOINT = "/carts?startdate={start}&enddate={end}";
    private static final String GET_USER_CARTS_ENDPOINT = "/carts/category/{category}";
    private static final String ADD_NEW_PRODUCT_ENDPOINT = "/carts/users/{userId}";
    private static final String UPDATE_PRODUCT_ENDPOINT = "/carts/{cartId}";
    private static final String DELETE_CART_ENDPOINT = "/carts/{cartId}";

    public static String getCartEndpoint(String operation) {
        return switch (operation) {
            case "get all" -> GET_ALL_CARTS_ENDPOINT;
            case "get single" -> GET_SINGLE_CART_ENDPOINT;
            case "limit results" -> LIMIT_RESULTS_CARTS_ENDPOINT;
            case "sort results" -> SORT_RESULTS_CARTS_ENDPOINT;
            case "date range" -> GET_CARTS_DATE_RANGE_ENDPOINT;
            case "user carts" -> GET_USER_CARTS_ENDPOINT;
            case "create" -> ADD_NEW_PRODUCT_ENDPOINT;
            case "update" -> UPDATE_PRODUCT_ENDPOINT;
            case "delete" -> DELETE_CART_ENDPOINT;
            default -> throw new IllegalStateException("Carts endpoint not found");
        };
    }

    public boolean isNullCart(Cart cart) {
        return cart.getId() != 0
                && cart.getUserId() != 0
                && Objects.nonNull(cart.getProducts().getFirst())
                && cart.getProducts().getFirst().getProductId() != 0
                && cart.getProducts().getFirst().getQuantity() != 0;
    }

}
