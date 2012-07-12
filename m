From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 12 Jul 2012 23:46:00 +0000
Subject: [nf-next:mmap-netlink 61/68] net/netlink/af_netlink.c:194:39: sparse: incorrect type in return expre
Message-Id: <20120712234600.GB5608@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Patrick,

There are new sparse warnings show up in

tree:   git://150.214.188.80/nf-next mmap-netlink
head:   c7e7243d0b69e2323dde057c28f1102d00e5a3c6
commit: a20a76bdf79a4b6c25df3ad1a48fd601a0b59400 [61/68] netlink: mmaped netlink: ring setup

All sparse warnings:

+ net/netlink/af_netlink.c:194:39: sparse: incorrect type in return expression (different modifiers)
  net/netlink/af_netlink.c:194:39:    expected struct page [pure] *
  net/netlink/af_netlink.c:194:39:    got struct page *
  net/netlink/af_netlink.c:196:24: sparse: incorrect type in return expression (different modifiers)
  net/netlink/af_netlink.c:196:24:    expected struct page [pure] *
  net/netlink/af_netlink.c:196:24:    got struct page *
+ net/netlink/af_netlink.c:397:38: sparse: incorrect type in assignment (different modifiers)
  net/netlink/af_netlink.c:397:38:    expected struct page *page
  net/netlink/af_netlink.c:397:38:    got struct page [pure] *
  net/netlink/af_netlink.c:819:56: sparse: incorrect type in argument 1 (different address spaces)
  net/netlink/af_netlink.c:819:56:    expected void const *<noident>
  net/netlink/af_netlink.c:819:56:    got struct listeners [noderef] <asn:4>*listeners
  net/netlink/af_netlink.c:632:38: sparse: dereference of noderef expression

vim +194 net/netlink/af_netlink.c
   191	static __pure struct page *pgvec_to_page(const void *addr)
   192	{
   193		if (is_vmalloc_addr(addr))
 > 194			return vmalloc_to_page(addr);
   195		else
   196			return virt_to_page(addr);
   197	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
