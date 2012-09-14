From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Sep 2012 02:59:22 +0000
Subject: [memcg:since-3.5 93/137] include/linux/rbtree_augmented.h:123: warning: '__rb_erase_color' declared
Message-Id: <20120914025922.GD31454@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Michel,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.5
head:   d64f22e5761b1e367ba5d1e04d2fe5e0283aecbc
commit: 20710551fa2659c765f88380f3b40a0e714000b1 [93/137] rbtree: move augmented rbtree functionality to rbtree_augmented.h
config: avr32-atngw100_defconfig

All error/warnings:

include/linux/rbtree_augmented.h:123: warning: '__rb_erase_color' declared inline after being called
include/linux/rbtree_augmented.h:123: warning: previous declaration of '__rb_erase_color' was here

vim +123 include/linux/rbtree_augmented.h
   113		if (parent) {
   114			if (parent->rb_left = old)
   115				parent->rb_left = new;
   116			else
   117				parent->rb_right = new;
   118		} else
   119			root->rb_node = new;
   120	}
   121	
   122	extern void __rb_erase_color(struct rb_node *parent, struct rb_root *root,
 > 123		void (*augment_rotate)(struct rb_node *old, struct rb_node *new));
   124	
   125	static __always_inline void
   126	rb_erase_augmented(struct rb_node *node, struct rb_root *root,
   127			   const struct rb_augment_callbacks *augment)
   128	{
   129		struct rb_node *child = node->rb_right, *tmp = node->rb_left;
   130		struct rb_node *parent, *rebalance;
   131		unsigned long pc;
   132	
   133		if (!tmp) {

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
