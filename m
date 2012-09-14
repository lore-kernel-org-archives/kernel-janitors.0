From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 14 Sep 2012 21:10:04 +0000
Subject: Re: [memcg:since-3.5 93/137] include/linux/rbtree_augmented.h:123: warning: '__rb_erase_color' decla
Message-Id: <20120914141004.fedddde2.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914025922.GD31454@yliu-dev.sh.intel.com>
In-Reply-To: <20120914025922.GD31454@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 14 Sep 2012 10:59:22 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Michel,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.5
> head:   d64f22e5761b1e367ba5d1e04d2fe5e0283aecbc
> commit: 20710551fa2659c765f88380f3b40a0e714000b1 [93/137] rbtree: move augmented rbtree functionality to rbtree_augmented.h
> config: avr32-atngw100_defconfig
> 
> All error/warnings:
> 
> include/linux/rbtree_augmented.h:123: warning: '__rb_erase_color' declared inline after being called
> include/linux/rbtree_augmented.h:123: warning: previous declaration of '__rb_erase_color' was here
> 

Yes, that is a bit screwed up.

What is more screwed up is that the insanely huge rb_erase_augmented()
is inlined.

Looky:

--- a/lib/rbtree_test.c~a
+++ a/lib/rbtree_test.c
@@ -90,6 +90,7 @@ static void insert_augmented(struct test
 static void erase_augmented(struct test_node *node, struct rb_root *root)
 {
 	rb_erase_augmented(&node->rb, root, &augment_callbacks);
+	rb_erase_augmented(&node->rb, root, &augment_callbacks);
 }
 
 static void init(void)

akpm:/usr/src/25> size lib/rbtree_test.o
   text    data     bss     dec     hex filename
   3599     117    5224    8940    22ec lib/rbtree_test.o	(before)
   4176     117    5384    9677    25cd lib/rbtree_test.o	(after)

that's crazy!

<wonders why bss got larger>
