From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 19 Jul 2012 03:12:53 +0000
Subject: [wireless-next:for-davem 87/99] net/ipv4/ip_vti.c:193:17: sparse: incorrect type in assignment (diff
Message-Id: <20120719031253.GA8922@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Saurabh,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git for-davem
head:   ddbe503203855939946430e39bae58de11b70b69
commit: 1181412c1a671ed4e8fb1736f17e6ec617c68059 [87/99] net/ipv4: VTI support new module for ip_vti.

All sparse warnings:

+ net/ipv4/ip_vti.c:193:17: sparse: incorrect type in assignment (different address spaces)
  net/ipv4/ip_vti.c:193:17:    expected struct ip_tunnel [noderef] <asn:4>**tp
  net/ipv4/ip_vti.c:193:17:    got struct ip_tunnel **
+ net/ipv4/ip_vti.c:205:49: sparse: incorrect type in initializer (different address spaces)
  net/ipv4/ip_vti.c:205:49:    expected struct ip_tunnel [noderef] <asn:4>**tp
  net/ipv4/ip_vti.c:205:49:    got struct ip_tunnel **
  net/ipv4/ip_vti.c:223:17: sparse: incorrect type in assignment (different address spaces)
  net/ipv4/ip_vti.c:223:17:    expected struct ip_tunnel [noderef] <asn:4>**tp
  net/ipv4/ip_vti.c:223:17:    got struct ip_tunnel **
+ net/ipv4/ip_vti.c:693:29: sparse: incompatible types in comparison expression (different address spaces)

vim +193 net/ipv4/ip_vti.c
   190		struct ip_tunnel __rcu **tp;
   191		struct ip_tunnel *iter;
   192	
 > 193		for (tp = vti_bucket(ipn, t);
   194		     (iter = rtnl_dereference(*tp)) != NULL;
   195		     tp = &iter->next) {
   196			if (t = iter) {

Which can be fixed by adding some rcu_*() accessors to the RCU
protected pointers.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
