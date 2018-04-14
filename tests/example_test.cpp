// © 2018 Joseph Cameron - All Rights Reserved
// Created on 2018-04-10.

#include <catch.hpp>

#include <some/thing.h>

TEST_CASE( "Some::thing test", "[Some::thing]" )
{
    some::thing a;

    SECTION("Some::Thing tells a secret")
    {
        std::string secret = a.GetASecret();

        REQUIRE( secret == "This is a secret" );
    }
}
