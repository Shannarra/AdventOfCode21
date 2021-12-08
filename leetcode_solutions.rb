# frozen_string_literal: true
# -------------------------------------------------
# https://leetcode.com/problems/median-of-two-sorted-arrays/

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
# https://leetcode.com/problems/median-of-two-sorted-arrays/
# def find_median_sorted_arrays(nums1, nums2)
#   concat = (nums1 + nums2).sort!
#   if concat.count % 2 != 0
#     concat[(concat.length / 2)]
# else
#     (concat[(concat.length / 2)] + concat[(concat.length / 2) - 1]).to_f / 2
#   end
# end

# ---------------------------------------------
# https://leetcode.com/problems/regular-expression-matching/

# puts find_median_sorted_arrays([1,3], [2])
# puts find_median_sorted_arrays([1,2], [3,4])
# puts find_median_sorted_arrays([2],[])

# @param {String} s
# @param {String} p
# @return {Boolean}
# def is_match(s, p)
#   s.match(p).to_s.length == s.length
# end

# puts is_match("aa", 'a')                    # f
# puts is_match("aa", 'aa')                   # t
# puts is_match("aa", 'a*')                   # t
# puts is_match("aklhfja", '.*')              # t
# puts is_match("aab", 'c*a*b')               # t
# puts is_match("mississippi","mis*is*p*.")   # f

# puts is_match("aa", "a*")

# --------------------------------------------
# https://leetcode.com/problems/merge-k-sorted-lists/

# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val = 0, _next = nil)
#       @val = val
#       @next = _next
#   end
# end
# # @param {ListNode[]} lists
# # @return {ListNode}
# def merge_k_lists(lists)
#   return [] if lists.length == 0

#   flat = []
#   lists.each {|l| while l; flat << l; l = l.next; end }

#   head = nil
#   tail = nil
#   flat.sort_by{|node| node.val}.each do |it|
#     head = it unless head
#     tail.next = it if tail
#     tail = it
#   end

#   head
# end

# list = merge_k_lists(
#   [
#     ListNode.new(1, ListNode.new(4, ListNode.new(5))),
#     ListNode.new(1, ListNode.new(3, ListNode.new(4))),
#     ListNode.new(2, ListNode.new(6))
#   ]
# )

# while list
#   print "#{list.val} -> "
#   list = list.next
# end

#  puts "#{merge_k_lists([[]])}"

# ------------------------------------------
# https://leetcode.com/problems/reverse-nodes-in-k-group/submissions/

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# # @param {ListNode} head
# # @param {Integer} k
# # @return {ListNode}
# def reverse_k_group(head, k)
#   return [] if head.nil?
#   return head if k <= 1
#
#   # .flatten!
#   flat = []
#   while head
#     flat << head
#     head = head.next
#   end
#
#   last_partition_tail = nil
#   r_tail = [] # reversed tail of list
#   r_flat = [] # reversed .flatten!-d list
#
#   # perform k-partitions and exclude elements outide
#   partitions = flat.each_slice(k).to_a.reject{|it| it.length < k}
#
#   partitions.each do |partition|
#     unless last_partition_tail
#       last_partition_tail = flat.index(partitions[-1][-1])
#       r_tail = flat[(last_partition_tail + 1)..]
#     end
#
#     r_flat << partition.to_a.reverse!
#   end
#
#   r_flat << r_tail
#
#   # add to new LL
#   r_head = nil
#   r_h_tail = nil
#   r_flat.flatten!.each do |it|
#     it.next = nil
#     r_head = it unless r_head
#     r_h_tail.next = it if r_h_tail
#     r_h_tail = it
#   end
#
#   r_head
# end
#
# node = reverse_k_group(ListNode.new(1,ListNode.new(2, ListNode.new(3,ListNode.new(4, ListNode.new(5))))), 2)
#
# while node
#   puts node.val
#   node = node.next
# end

# -------------------------------------------
# https://leetcode.com/problems/substring-with-concatenation-of-all-words/
#
# def find_substring(s, words)
#   return [] if words.count == 0 || s.length < words.join.length
#   words_hash = {}
#   w_len = words[0].length
#   for i in (0..(s.length - w_len + 1))
#     w = s[i..(i + w_len)]
#     if words.uniq.include?(w)
#       words_hash[i] = w
#     end
#   end
#
#   windows = {}
#   words_hash.each {|k,v| windows[i%w_len].push(v)}
#
#   words_hash
# end
#
# puts "#{find_substring("foobarfoobar", %w{foo bar})}"                           # [0,3,6]
# puts "#{find_substring("barfoothefoobarman", %w{foo bar})}"                     # [0,9] || [9,0]
# puts "#{find_substring("wordgoodgoodgoodbestword", %w{word good best word})}"   # []
# puts "#{find_substring("barfoofoobarthefoobarman", %w{bar foo the})}"           # [6,9,12]
# puts "#{find_substring("wordgoodgoodgoodbestword", %w{ word good best good})}"  # [8]
# rubocop:disable Layout/LineLength
# puts "#{find_substring("pjzkrkevzztxductzzxmxsvwjkxpvukmfjywwetvfnujhweiybwvvsrfequzkhossmootkmyxgjgfordrpapjuunmqnxxdrqrfgkrsjqbszgiqlcfnrpjlcwdrvbumtotzylshdvccdmsqoadfrpsvnwpizlwszrtyclhgilklydbmfhuywotjmktnwrfvizvnmfvvqfiokkdprznnnjycttprkxpuykhmpchiksyucbmtabiqkisgbhxngmhezrrqvayfsxauampdpxtafniiwfvdufhtwajrbkxtjzqjnfocdhekumttuqwovfjrgulhekcpjszyynadxhnttgmnxkduqmmyhzfnjhducesctufqbumxbamalqudeibljgbspeotkgvddcwgxidaiqcvgwykhbysjzlzfbupkqunuqtraxrlptivshhbihtsigtpipguhbhctcvubnhqipncyxfjebdnjyetnlnvmuxhzsdahkrscewabejifmxombiamxvauuitoltyymsarqcuuoezcbqpdaprxmsrickwpgwpsoplhugbikbkotzrtqkscekkgwjycfnvwfgdzogjzjvpcvixnsqsxacfwndzvrwrycwxrcismdhqapoojegggkocyrdtkzmiekhxoppctytvphjynrhtcvxcobxbcjjivtfjiwmduhzjokkbctweqtigwfhzorjlkpuuliaipbtfldinyetoybvugevwvhhhweejogrghllsouipabfafcxnhukcbtmxzshoyyufjhzadhrelweszbfgwpkzlwxkogyogutscvuhcllphshivnoteztpxsaoaacgxyaztuixhunrowzljqfqrahosheukhahhbiaxqzfmmwcjxountkevsvpbzjnilwpoermxrtlfroqoclexxisrdhvfsindffslyekrzwzqkpeocilatftymodgztjgybtyheqgcpwogdcjlnlesefgvimwbxcbzvaibspdjnrpqtyeilkcspknyylbwndvkffmzuriilxagyerjptbgeqgebiaqnvdubrtxibhvakcyotkfonmseszhczapxdlauexehhaireihxsplgdgmxfvaevrbadbwjbdrkfbbjjkgcztkcbwagtcnrtqryuqixtzhaakjlurnumzyovawrcjiwabuwretmdamfkxrgqgcdgbrdbnugzecbgyxxdqmisaqcyjkqrntxqmdrczxbebemcblftxplafnyoxqimkhcykwamvdsxjezkpgdpvopddptdfbprjustquhlazkjfluxrzopqdstulybnqvyknrchbphcarknnhhovweaqawdyxsqsqahkepluypwrzjegqtdoxfgzdkydeoxvrfhxusrujnmjzqrrlxglcmkiykldbiasnhrjbjekystzilrwkzhontwmehrfsrzfaqrbbxncphbzuuxeteshyrveamjsfiaharkcqxefghgceeixkdgkuboupxnwhnfigpkwnqdvzlydpidcljmflbccarbiegsmweklwngvygbqpescpeichmfidgsjmkvkofvkuehsmkkbocgejoiqcnafvuokelwuqsgkyoekaroptuvekfvmtxtqshcwsztkrzwrpabqrrhnlerxjojemcxel",["dhvf","sind","ffsl","yekr","zwzq","kpeo","cila","tfty","modg","ztjg","ybty","heqg","cpwo","gdcj","lnle","sefg","vimw","bxcb"])}"
# rubocop:enable Layout/LineLength
