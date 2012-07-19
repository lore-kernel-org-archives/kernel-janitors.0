From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 19 Jul 2012 00:07:49 +0000
Subject: [sfc:for-davem 19/22] drivers/net/ethernet/sfc/ptp.c:1007:25: sparse: Using plain integer as NULL po
Message-Id: <20120719000749.GB5548@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Stuart,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bwh/sfc-next for-davem
head:   2482aab313c3657557f1dad4c1b20c0934b84919
commit: 13012ca3419166c44abafd9a6b42dbeb6aa6aa1a [19/22] sfc: Add support for IEEE-1588 PTP

All sparse warnings:

+ drivers/net/ethernet/sfc/ptp.c:1007:25: sparse: Using plain integer as NULL pointer

vim +1007 drivers/net/ethernet/sfc/ptp.c
  1004	
  1005	fail1:
  1006		kfree(efx->ptp_data);
> 1007		efx->ptp_data = 0;
  1008	
  1009		return rc;
  1010	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
