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


    defp replicate0([], acc, _) do
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


    def split(list, count) when is_list(list) do
        split0(list, count, [[], []])
    end


    defp split0([], _, acc) do
        acc
    end


    defp split0([head | tail], 0, [t1, t2]) do
        split0(tail, 0, [t1, t2 ++ [head]])
    end


    defp split0([head | tail], count, [t1, t2]) do
        split0(tail, count - 1, [t1 ++ [head], t2])
    end


    def slice(list, left, right) when is_list(list) when left <= right do
        slice0(list, left, right, [])
    end


    defp slice0(_, _, 0, acc) do
        acc
    end


    defp slice0([head | tail], 1, right, acc) do
        slice0(tail, 1, right - 1, acc ++ [head])
    end


    defp slice0([_ | tail], left, right, acc) do
        slice0(tail, left - 1, right - 1, acc)
    end


    def rotate(list, count) do
        c = rem(LispList.count(list) + count, LispList.count(list))
        [t1, t2] = LispList.split(list, c)
        t2 ++ t1
    end


    def remove(list, k) when k >= 0 do
        remove0(list, k, [])
    end


    defp remove0([], _, acc) do
        acc
    end


    defp remove0([_ | tail], 1, acc) do
        remove0(tail, 0, acc)
    end


    defp remove0([head | tail], k, acc) do
        remove0(tail, k - 1, acc ++ [head])
    end


    def insert(list, k, elem) when k >= 0 do
        insert0(list, k, elem, [])
    end


    defp insert0([], _, _, acc) do
        acc
    end


    defp insert0([head | tail], 1, elem, acc) do
        insert0(tail, 0, elem, acc ++ [elem, head])
    end


    defp insert0([head | tail], k, elem, acc) do
        insert0(tail, k - 1, elem, acc ++ [head])
    end


    def range(left, right) when left <= right do
        range0(left, right, [])
    end


    defp range0(right, right, acc) do
        acc ++ [right]
    end


    defp range0(left, right, acc) do
        range0(left + 1, right, acc ++ [left])
    end


    def rnd_select(list, count) when is_list(list) do
        :random.seed(:erlang.now)
        rnd_select0(list, count, [])
    end


    defp rnd_select0(_, 0, acc) do
        acc
    end


    defp rnd_select0(list, count, acc) do
        k = :random.uniform(LispList.count(list))
        rnd_select0(remove(list, k), count - 1, acc ++ [get0(list, k)])
    end


    defp get0([head | _], 1) do
        head
    end


    defp get0([_ | tail], k) when k > 1 do
        get0(tail, k - 1)
    end


    def lotto_select(range, count) when count <= range do
        rnd_select(range(1, range), count)
    end


    def rnd_permu(list) when is_list(list) do
        rnd_select(list, LispList.count(list))
    end


    def combinations(k, list) when is_list(list) and k <= length(list) do
        combinations0(k, list, k, [[]])
    end


    defp combinations0(_, _, 0, acc) do
        acc
    end


    defp combinations0(k, list, j, acc) when k <= length(list) and j <= k do
        l = for elem <- list, subset <- acc do Enum.sort(union([elem], subset)) end
            |> Enum.filter(&Enum.count(&1) == k - j + 1)
            |> Enum.uniq
        combinations0(k, list, j - 1, l)
    end


    defp union(list1, list2) when is_list(list1) and is_list(list2) do
        Set.to_list(
            Set.union(
                Enum.into(list1, HashSet.new),
                Enum.into(list2, HashSet.new)
            )
        )
    end


    def isPrime?(n) when n > 0 do
        isPrime0?(n, n - 1)
    end


    defp isPrime0?(1, _) do
        true
    end


    defp isPrime0?(_, 1) do
        true
    end


    defp isPrime0?(n, k) do
        rem(n, k) != 0 && isPrime0?(n, k - 1)
    end


    def gcd(a, 0) do
        a
    end


    def gcd(a, b) do
        gcd(b, rem(a, b))
    end


    def coprime(a, b) do
        case gcd(a, b) do
            1 -> true
            _ -> false
        end
    end


    def totient_phi(1) do
        1
    end


    def totient_phi(m) when m >= 0 do
        1..m |> Enum.filter(&coprime(&1, m)) |> Enum.count
    end


    def prime_factors(n) do
        prime_factors0(n, 2, [])
    end


    def prime_factors0(n, f, acc) when f * f > n do
        acc ++ [n]
    end


    def prime_factors0(n, f, acc) when rem(n, f) == 0 do
        prime_factors0(div(n, f), f, acc ++ [f])
    end


    def prime_factors0(n, f, acc) do
        prime_factors0(n, f + 1, acc)
    end


    def list_primes(left..right) when left > 0 do
        list_primes0(left, right, [])
    end


    defp list_primes0(right, right, acc) do
        acc
    end


    defp list_primes0(left, right, acc) do
        acc = case isPrime?(left) do
            true -> acc ++ [left]
            false -> acc
        end
        list_primes0(left + 1, right, acc)
    end
end
