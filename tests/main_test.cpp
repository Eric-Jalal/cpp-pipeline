#include <gtest/gtest.h>

TEST(MainTest, BasicAssertions) {
    // Expect two strings not to be equal.
    EXPECT_STRNE("hello", "world");
}

