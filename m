From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 25 Jul 2012 12:42:38 +0000
Subject: tg3_phy_copper_begin: duplicated argument to ||
Message-Id: <20120725124238.GA29871@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Matt,

coccinelle complaints about:

drivers/net/ethernet/broadcom/tg3.c:4053:8-39: duplicated argument to && or ||

I'm not sure if the code intends to retry the operation (or a silly
copy&paste error). If it's the former case, it might be better to add
a comment..
               
 4046                 if (!tg3_readphy(tp, MII_BMCR, &orig_bmcr) &&
 4047                     (bmcr != orig_bmcr)) {
 4048                         tg3_writephy(tp, MII_BMCR, BMCR_LOOPBACK);
 4049                         for (i = 0; i < 1500; i++) {
 4050                                 u32 tmp;
 4051                           
 4052                                 udelay(10);
 4053 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> if (tg3_readphy(tp, MII_BMSR, &tmp) ||
 4054 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>     tg3_readphy(tp, MII_BMSR, &tmp))
 4055                                         continue;
 4056                                 if (!(tmp & BMSR_LSTATUS)) {
 4057                                         udelay(40);
 4058                                         break;
 4059                                 }
 4060                         }
 4061                         tg3_writephy(tp, MII_BMCR, bmcr);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
