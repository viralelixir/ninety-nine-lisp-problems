defmodule LispList do

    def last([elem]) do
        [elem]
    end


    def last([_|tail]) do
        last(tail)
    end


    def last_but_one(list = [_, _]) do
        list
    end


    def last_but_one([_ | tail]) do
        last_but_one(tail)
    end


    def kth([head], _) do
        head
    end


    def kth([head | _], 1) do
        head
    end


    def kth([_ | tail], k) do
        kth(tail, k - 1)
    end


    def count([]) do
        0
    end


    def count([_ | tail]) do
        1 + count(tail)
    end


    def reverse(list) do
        reverse0(list, [])
    end


    defp reverse0([], acc) do
        acc
    end


    defp reverse0([head | tail], acc) do
        reverse0(tail, [head] ++ acc)
    end


    def isPalindrome?(list) when is_list(list) do
        isPalindrome0(list, LispList.count(list))
    end


    defp isPalindrome0(_, length) when length <= 1 do
        true
    end


    defp isPalindrome0(list = [head | tail], length) do
        head == LispList.kth(list, length) && isPalindrome0(tail, length - 2)
    end
end