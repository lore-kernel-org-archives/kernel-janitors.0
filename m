From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 11:56:51 +0000
Subject: [bug report] reimplement IDR and IDA using the radix tree
Message-Id: <20161208115651.GA14667@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Matthew Wilcox,

This is a semi-automatic email about new static checker warnings.

The patch 755edccbffa1: "reimplement IDR and IDA using the radix 
tree" from Dec 7, 2016, leads to the following Smatch complaint:

lib/radix-tree.c:2380 ida_get_new_above()
	 warn: variable dereferenced before check 'node' (see line 2355)

lib/radix-tree.c
  2354			bit = 0;
  2355		offset = get_slot_offset(node, slot);
                                         ^^^^
Dereferenced inside the function.

  2356	
  2357		bitmap = *slot;
  2358		if (bitmap) {
  2359			bit = find_next_zero_bit(bitmap->bitmap, IDA_BITMAP_BITS, bit);
  2360			index += bit;
  2361			if (index > INT_MAX)
  2362				return -ENOSPC;
  2363			if (bit = IDA_BITMAP_BITS) {
  2364				index /= IDA_BITMAP_BITS;
  2365				goto restart;
  2366			}
  2367			__set_bit(bit, bitmap->bitmap);
  2368			if (bitmap_full(bitmap->bitmap, IDA_BITMAP_BITS))
  2369				node_tag_clear(root, node, IDR_FREE, offset);
  2370			bitmap = xchg(&ida->free_bitmap, NULL);
  2371			kfree(bitmap);
  2372		} else {
  2373			index += bit;
  2374			bitmap = xchg(&ida->free_bitmap, NULL);
  2375			if (!bitmap)
  2376				return -EAGAIN;
  2377			memset(bitmap, 0, sizeof(*bitmap));
  2378			__set_bit(bit, bitmap->bitmap);
  2379			rcu_assign_pointer(*slot, bitmap);
  2380			if (node)
                            ^^^^
Check too late.

  2381				node->count++;
  2382		}

regards,
dan carpenter
