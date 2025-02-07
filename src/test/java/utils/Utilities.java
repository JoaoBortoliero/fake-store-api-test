package utils;

import java.util.List;
import java.util.Objects;

public class Utilities {

    public static <T> boolean isNotNullList(List<T> values) {
        return values.stream().allMatch(Objects::nonNull);
    }
}
