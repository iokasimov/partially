module Main where

import System.IO (BufferMode(..), hSetBuffering, stdout, stderr)
import Hedgehog (Group (..), checkParallel)

import Test.Apart.Structures.Stack
import Test.Apart.Structures.Tree.Binary
import Test.Apart.Structures.Tree.Binary.AVL
import Test.Apart.Structures.Tree.Binary.Splay

main = do
	hSetBuffering stdout LineBuffering
	hSetBuffering stderr LineBuffering

	checkParallel $ Group "Stack structure" [
		( "Same length with origin of foldaway"
		, same_length_with_origin_of_foldaway )]

	checkParallel $ Group "Binary tree structure" [
		( "Any left left is less, any right is greater"
		, any_left_left_is_less_any_right_is_greater )]

	checkParallel $ Group "AVL tree structure" [
		( "Balance factor is well"
		, balance_factor_is_well )]

	checkParallel $ Group "Splay tree structure" [
		( "Found element should be lifted to root"
		, found_element_should_be_lifted_to_root )]
