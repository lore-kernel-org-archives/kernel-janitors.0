From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 30 Jul 2012 03:00:27 +0000
Subject: [nf-next:nf-nat2 7/8] net/netfilter/nf_nat_ftp.c:122:9: sparse: incorrect type in assignment (differ
Message-Id: <20120730030027.GB7389@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Patrick,

There are new sparse warnings show up in

tree:   git://150.214.188.80/nf-next nf-nat2
head:   2c59d9f21ca33d3f974f45ae1f730982a85bd908
commit: 148b7e40adbf42204617d31ea5643f11faba3d33 [7/8] netfilter: nf_nat: support IPv6 in FTP NAT helper

All sparse warnings:

+ net/netfilter/nf_nat_ftp.c:122:9: sparse: incorrect type in assignment (different address spaces)
  net/netfilter/nf_nat_ftp.c:122:9:    expected unsigned int ( *extern [addressable] [toplevel] nf_nat_ftp_hook )( ... )
  net/netfilter/nf_nat_ftp.c:122:9:    got void [noderef] <asn:4>*<noident>
+ net/netfilter/nf_nat_ftp.c:129:9: sparse: cannot dereference this type

vim +122 net/netfilter/nf_nat_ftp.c
   119	
   120	static void __exit nf_nat_ftp_fini(void)
   121	{
 > 122		RCU_INIT_POINTER(nf_nat_ftp_hook, NULL);
   123		synchronize_rcu();
   124	}
   125	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
