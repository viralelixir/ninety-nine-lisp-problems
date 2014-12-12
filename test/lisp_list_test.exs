defmodule LispListTest do
  use ExUnit.Case

  test "last box of list with one element" do
    assert LispList.last([1]) == [1]
  end

  test "last box of list with multiple elements" do
    assert LispList.last([1, 2, 3, 4]) == [4]
  end

  test "last but one box of list with two elements" do
    assert LispList.last_but_one([1, 2]) == [1, 2]
  end

  test "last but one box of list with multiple elements" do
    assert LispList.last_but_one([1, 2, 3, 4]) == [3, 4]
  end

  test "second element of a list with one element" do
    assert LispList.kth([1, 2], 2) == 2
  end

  test "7th element of a list with 10 elements" do
    assert LispList.kth([10,9,8,7,6,5,4,3,2,1], 7) == 4
  end

  test "number of elements of empty list" do
    assert LispList.count([]) == 0
  end

  test "number of elements of list with 7 elements" do
    assert LispList.count([1,2,3,4,5,6,7]) == 7
  end

  test "reverse an empty list" do
    assert LispList.reverse([]) == []
  end

  test "reverse a list with 7 elements" do
    assert LispList.reverse([1,2,3,4,5,6,7]) == [7,6,5,4,3,2,1]
  end

  test "empty list is a palindrome" do
    assert LispList.isPalindrome?([])
  end

  test "list with one element is a palindrome" do
    assert LispList.isPalindrome?([1])
  end

  test "list with two equal elements is a palindrome" do
    assert LispList.isPalindrome?([1,1])
  end

  test "[1,2,3,4,5] is no palindrome" do
    assert !LispList.isPalindrome?([1,2,3,4,5])
  end

  test "[1,2,3,4,2,1] is no palindrome" do
    assert !LispList.isPalindrome?([1,2,3,4,2,1])
  end

  test "[1,2,3,2,1] is a palindrome" do
    assert LispList.isPalindrome?([1,2,3,2,1])
  end

end
