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


    def flatten(list) when is_list(list) do
        flatten0(list, [])
    end


    defp flatten0([], acc) do
        acc
    end


    defp flatten0([head | tail], acc) when is_list(head) do
        flatten0(tail, acc ++ flatten(head))
    end


    defp flatten0([head | tail], acc) do
        flatten0(tail, acc ++ [head])
    end


    def unique(list) when is_list(list) do
        unique0(list, [])
    end


    defp unique0([], acc) do
        LispList.reverse(acc)
    end


    defp unique0([head | tail], acc = [head | _]) do
        unique0(tail, acc)
    end


    defp unique0([head | tail], acc) do
        unique0(tail, [head | acc])
    end


    def pack(list) when is_list(list) do
        pack0(list, [])
    end


    defp pack0([], acc) do
        LispList.reverse(acc)
    end


    defp pack0([head | tail], [h = [head | _] | t]) do
        pack0(tail, [[head | h] | t])
    end


    defp pack0([head | tail], acc) do
        pack0(tail, [[head] | acc])
    end


    def run_length(list) when is_list(list) do
        run_length0(list, [])
    end


    defp run_length0([], acc) do
        LispList.reverse(acc)
    end


    defp run_length0([head | tail], [{head, count} | t]) do
        run_length0(tail, [{head, count + 1} | t])
    end


    defp run_length0([head | tail], acc) do
        run_length0(tail, [{head, 1} | acc])
    end


    def modified_run_length(list) when is_list(list) do
        modified_run_length0(list, [])
    end


    defp modified_run_length0([], acc) do
        LispList.reverse(acc)
    end


    defp modified_run_length0([head | tail], [{head, count} | t]) do
        modified_run_length0(tail, [{head, count + 1} | t])
    end


    defp modified_run_length0([head | tail], [{ahead, 1} | atail]) do
        modified_run_length0(tail, [{head, 1}, ahead | atail])
    end


    defp modified_run_length0([head | tail], acc) do
        modified_run_length0(tail, [{head, 1} | acc])
    end


    def decode_run_length(list) when is_list(list) do
        decode_run_length0(list, [])
    end


    defp decode_run_length0([], acc) do
        acc
    end


    defp decode_run_length0([{head, count} | tail], acc) do
        decode_run_length0(tail, acc ++ create_list(head, count))
    end


    defp decode_run_length0([head | tail], acc) do
        decode_run_length0(tail, acc ++ [head])
    end


    defp create_list(elem, count) do
        create_list0(elem, count, [])
    end


    defp create_list0(_, 0, acc) do
        acc
    end


    defp create_list0(elem, count, acc) do
        create_list0(elem, count - 1, [elem | acc])
    end


    def duplicate(list) do
        duplicate0(list, [])
    end


    defp duplicate0([], acc) do
        acc
    end


    defp duplicate0([head | tail], acc) do
        duplicate0(tail, acc ++ [head, head])
    end


    def replicate(list, count) do
        replicate0(list, [], count)
    end


    defp replicate0([], acc, count) do
        acc
    end


    defp replicate0([head | tail], acc, count) do
        replicate0(tail, acc ++ create_list(head, count), count)
    end


    def drop(list, count) do
        drop0(list, count, [], count)
    end


    defp drop0([], _, acc, _) do
        acc
    end


    defp drop0([_ | tail], count, acc, 1) do
        drop0(tail, count, acc, count)
    end


    defp drop0([head | tail], count, acc, k) do
        drop0(tail, count, acc ++ [head], k - 1)
    end

end
