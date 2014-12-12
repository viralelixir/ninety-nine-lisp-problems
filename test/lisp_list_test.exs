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

  test "drop every n'th element from a crazy list" do
    assert LispList.drop(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'], 3)
        == ['a', 'b', 'd', 'e', 'g', 'h', 'k']
  end

  test "split a list into two parts" do
    assert LispList.split(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'], 3)
        == [['a', 'b', 'c'], ['d', 'e', 'f', 'g', 'h', 'i', 'k']]
  end

  test "extract a slice from a list" do
    assert LispList.slice(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'], 3, 7)
        == ['c', 'd', 'e', 'f', 'g']
  end

  test "rotate a list n places to the left" do
    assert LispList.rotate(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'], 3)
        == ['d', 'e', 'f', 'g', 'h', 'a', 'b', 'c']
  end

  test "rotate a list -n places to the left" do
    assert LispList.rotate(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'], -2)
        == ['g', 'h', 'a', 'b', 'c', 'd', 'e', 'f']
  end

  test "remove the k'th element from a list" do
    assert LispList.remove(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'], 5)
        == ['a', 'b', 'c', 'd', 'f', 'g', 'h']
  end

  test "insert an element at a given position into a list" do
    assert LispList.insert(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'], 5, 'alpha')
        == ['a', 'b', 'c', 'd', 'alpha', 'e', 'f', 'g', 'h']
  end

  test "create a list containing all integers within a given range" do
    assert LispList.range(4, 9) == [4, 5, 6, 7, 8, 9]
  end

  test "extract a given number of randomly selected elements from a list" do
    list = LispList.rnd_select(['a', 'b', 'c', 'd', 'e', 'f'], 3)
    assert Enum.count(list) == 3
  end

  test "extract a given number of randomly selected elements from a list" do
    list = LispList.rnd_select(['a', 'b', 'c', 'd', 'e'], 1)
    assert Enum.count(list) == 1
  end

  test "Lotto: draw n different random numbers from the set 1..m" do
    list = LispList.lotto_select(49, 6)
    assert Enum.count(list) == 6
  end

  test "generate a random permutation of the elements of a list" do
    list1 = [1, 2, 3, 4, 5]
    list2 = LispList.rnd_permu(list1)
    assert Enum.count(list1) == Enum.count(list2)
    assert list1 |> Enum.all? &Enum.member?(list2, &1)
    assert list2 |> Enum.all? &Enum.member?(list1, &1)
  end
end
