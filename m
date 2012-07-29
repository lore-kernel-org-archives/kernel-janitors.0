From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 29 Jul 2012 00:48:11 +0000
Subject: [nf-next:nf_tables4 2/2] net/ipv4/netfilter/nf_table_nat_ipv4.c:184:30: sparse: incompatible types i
Message-Id: <20120729004811.GB7049@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Pablo,

There are new sparse warnings show up in

tree:   git://150.214.188.80/nf-next nf_tables4
head:   b33538d5361ec09e5c947765a7615fc67640a9fe
commit: b33538d5361ec09e5c947765a7615fc67640a9fe [2/2] netfilter: nf_tables

All sparse warnings:

+ net/ipv4/netfilter/nf_table_nat_ipv4.c:184:30: sparse: incompatible types in comparison expression (different address spaces)

vim +184 net/ipv4/netfilter/nf_table_nat_ipv4.c
   181		enum nf_nat_manip_type maniptype = HOOK2MANIP(ops->hooknum);
   182		unsigned int ret;
   183	
 > 184		if (ct = NULL || ct = &nf_conntrack_untracked)
   185			return NF_ACCEPT;
   186	
   187		NF_CT_ASSERT(!(ip_hdr(skb)->frag_off & htons(IP_MF | IP_OFFSET)));

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
