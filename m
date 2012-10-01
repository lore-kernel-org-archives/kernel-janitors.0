From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 01 Oct 2012 08:38:24 +0000
Subject: [cr:crtools-3.6 11/32] include/net/ndisc.h:137:2: error: implicit declaration of function 'hash32_pt
Message-Id: <20121001083824.GA25109@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Pavel,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gorcunov/linux-cr.git crtools-3.6
head:   5bdf2e431ca733b6e46ebbcf2b6a62fd753fa703
commit: 412de726dff943b0b9600836ae363201047ec8b3 [11/32] net: Dont use ifindices in hash fns
config: x86_64-allmodconfig

All error/warnings:

In file included from include/net/ipv6.h:19:0,
                 from include/linux/sunrpc/clnt.h:26,
                 from include/linux/nfs_fs.h:57,
                 from init/do_mounts.c:30:
include/net/ndisc.h: In function 'ndisc_hashfn':
include/net/ndisc.h:137:2: error: implicit declaration of function 'hash32_ptr' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from include/net/ipv6.h:19:0,
                 from include/linux/sunrpc/clnt.h:26,
                 from include/linux/nfs_fs.h:57,
                 from fs/lockd/clntlock.c:13:
include/net/ndisc.h: In function 'ndisc_hashfn':
include/net/ndisc.h:137:2: error: implicit declaration of function 'hash32_ptr' [-Werror=implicit-function-declaration]
In file included from include/linux/sunrpc/svcauth.h:17:0,
                 from include/linux/sunrpc/svc.h:18,
                 from fs/lockd/clntlock.c:15:
include/linux/hash.h: At top level:
include/linux/hash.h:71:19: error: conflicting types for 'hash32_ptr'
In file included from include/net/ipv6.h:19:0,
                 from include/linux/sunrpc/clnt.h:26,
                 from include/linux/nfs_fs.h:57,
                 from fs/lockd/clntlock.c:13:
include/net/ndisc.h:137:21: note: previous implicit declaration of 'hash32_ptr' was here
cc1: some warnings being treated as errors

vim +137 include/net/ndisc.h

30f2a5f3 (David S. Miller 2012-07-11  131) }
30f2a5f3 (David S. Miller 2012-07-11  132) 
2c2aba6c (David S. Miller 2011-12-28  133) static inline u32 ndisc_hashfn(const void *pkey, const struct net_device *dev, __u32 *hash_rnd)
2c2aba6c (David S. Miller 2011-12-28  134) {
2c2aba6c (David S. Miller 2011-12-28  135) 	const u32 *p32 = pkey;
2c2aba6c (David S. Miller 2011-12-28  136) 
412de726 (Pavel Emelyanov 2012-10-01 @137) 	return (((p32[0] ^ hash32_ptr(dev)) * hash_rnd[0]) +
2c2aba6c (David S. Miller 2011-12-28  138) 		(p32[1] * hash_rnd[1]) +
2c2aba6c (David S. Miller 2011-12-28  139) 		(p32[2] * hash_rnd[2]) +
2c2aba6c (David S. Miller 2011-12-28  140) 		(p32[3] * hash_rnd[3]));

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
