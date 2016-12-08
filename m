From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 12:02:55 +0000
Subject: [bug report] reimplement IDR and IDA using the radix tree
Message-Id: <20161208120255.GA32427@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161208115651.GA14667@elgon.mountain>
In-Reply-To: <20161208115651.GA14667@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Matthew Wilcox,

This is a semi-automatic email about new static checker warnings.

The patch 755edccbffa1: "reimplement IDR and IDA using the radix 
tree" from Dec 7, 2016, leads to the following Smatch complaint:

lib/radix-tree.c:2413 ida_remove()
	 warn: variable dereferenced before check 'node' (see line 2409)

lib/radix-tree.c
  2408		__clear_bit(offset, bitmap->bitmap);
  2409		node_tag_set(&ida->ida_rt, node, IDR_FREE, get_slot_offset(node, slot));
                                                                           ^^^^
Dereference.

  2410		if (bitmap_empty(bitmap->bitmap, IDA_BITMAP_BITS)) {
  2411			*slot = NULL;
  2412			kfree(bitmap);
  2413			if (node) {
                            ^^^^
Check.

  2414				node->count--;
  2415				__radix_tree_delete_node(&ida->ida_rt, node);

regards,
dan carpenter
