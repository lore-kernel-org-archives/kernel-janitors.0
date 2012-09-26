From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 16:59:47 +0000
Subject: [next:akpm 22/413] net/key/af_key.c:1476:9: error: implicit declaration of function 'audit_get_sessi
Message-Id: <20120926165947.GA25467@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kees,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   dad0019944369f58c193c1991c39ffda7ff584d2
commit: e269b4131288512ebfe2adfe69042983cb2e69e5 [22/413] audit.h: replace defines with C stubs
config: sh-titan_defconfig

All error/warnings:

net/key/af_key.c: In function 'pfkey_add':
net/key/af_key.c:1476:9: error: implicit declaration of function 'audit_get_sessionid' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +1476 net/key/af_key.c
  1470			err = xfrm_state_add(x);
  1471		else
  1472			err = xfrm_state_update(x);
  1473	
  1474		xfrm_audit_state_add(x, err ? 0 : 1,
  1475				     audit_get_loginuid(current),
> 1476				     audit_get_sessionid(current), 0);
  1477	
  1478		if (err < 0) {
  1479			x->km.state = XFRM_STATE_DEAD;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
