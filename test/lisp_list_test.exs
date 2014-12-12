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

  test "flatten an empty list" do
    assert LispList.flatten([]) == List.flatten([])
  end

  test "flatten a nested empty list" do
    assert LispList.flatten([[]]) == List.flatten([[]])
  end

  test "flatten a nested empty list with multiple nested levels" do
    assert LispList.flatten([[[]]]) == List.flatten([[[]]])
  end

  test "flatten a linear list" do
    assert LispList.flatten([1,2,3]) == List.flatten([1,2,3])
  end

  test "flatten a nested list" do
    assert LispList.flatten([[1], 2, 3]) == List.flatten([[1], 2, 3])
  end

  test "flatten another list" do
    assert LispList.flatten([1,[2,[3]]]) == List.flatten([1,[2,[3]]])
  end

  test "remove consecutive duplicates of empty list" do
    assert LispList.unique([]) == []
  end

  test "remove consecutive duplicates of crazy list" do
    assert LispList.unique([1,2,2,2,3,2,2,1,1,2]) == [1,2,3,2,1,2]
  end

  test "pack consecutive duplicates of empty list" do
    assert LispList.pack([]) == []
  end

  test "pack consecutive duplicates of list elements into sublists" do
    assert LispList.pack(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'])
        == [['a', 'a', 'a', 'a'], ['b'], ['c', 'c'], ['a', 'a'], ['d'], ['e', 'e', 'e', 'e']]
  end

  test "run-length encoding of an empty list" do
    assert LispList.run_length([]) == []
  end

  test "run-length encoding of a crazy list" do
    assert LispList.run_length(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'])
        == [{'a', 4}, {'b', 1}, {'c', 2}, {'a', 2}, {'d', 1}, {'e', 4}]
  end

  test "modified run-length encoding of a list with one element" do
    assert LispList.modified_run_length([]) == []
  end

  test "modified run-length encoding of a crazy list" do
    assert LispList.modified_run_length(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'])
        == [{'a', 4}, 'b', {'c', 2}, {'a', 2}, 'd', {'e', 4}]
  end

  test "decode modified run-length encoding of a crazy list" do
    assert LispList.decode_run_length([{'a', 4}, 'b', {'c', 2}, {'a', 2}, 'd', {'e', 4}])
        == ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
  end

  test "duplicate elements of a crazy list" do
    assert LispList.duplicate(['a', 'b', 'c', 'c', 'd']) 
        == ['a', 'a', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'd']
  end

  test "replicate elements of a crazy list" do
    assert LispList.replicate(['a', 'b', 'c', 'c', 'd'], 3) 
        == ['a', 'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c', 'c', 'c', 'c', 'd', 'd', 'd']
  end

  test "rdrop every n'th element from a crazy list" do
    assert LispList.drop(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'], 3)
        == ['a', 'b', 'd', 'e', 'g', 'h', 'k']
  end
end
