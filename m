From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 12 Jul 2012 23:51:45 +0000
Subject: [nf-next:mmap-netlink 65/68] net/netfilter/nfnetlink_queue_core.c:407:23: warning: unused variable '
Message-Id: <20120712235145.GD5608@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Florian,

There are new compile warnings show up in

tree:   git://150.214.188.80/nf-next mmap-netlink
head:   c7e7243d0b69e2323dde057c28f1102d00e5a3c6
commit: b55f8ac10d3ef4c4379afabaa1f766de4d81a8a5 [65/68] nfqueue: extend spinlocked section for mmap'd sockets

All warnings:

net/netfilter/nfnetlink_queue_core.c: In function 'nfqnl_enqueue_packet':
net/netfilter/nfnetlink_queue_core.c:407:23: warning: unused variable 'size' [-Wunused-variable]

vim +407 net/netfilter/nfnetlink_queue_core.c
   404		int err = -ENOBUFS;
   405		int failopen = 0;
   406		struct sk_buff *entskb = entry->skb;
 > 407		size_t data_len = 0, size;
   408	
   409		/* rcu_read_lock()ed by nf_hook_slow() */
   410		queue = instance_lookup(queuenum);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
