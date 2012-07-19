From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 19 Jul 2012 00:06:22 +0000
Subject: [sfc:for-davem 18/22] sparse: undefined identifier 'MCDI_EVENT_CODE_PTP_PPS'
Message-Id: <20120719000622.GA5548@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Stuart,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bwh/sfc-next for-davem
head:   2482aab313c3657557f1dad4c1b20c0934b84919
commit: 3d230d2a2c441aec6ba495341623c8086e926bec [18/22] sfc: Allow efx_mcdi_rpc to be called in two parts

All sparse warnings:

+ drivers/net/ethernet/sfc/mcdi.c:583:14: sparse: undefined identifier 'MCDI_EVENT_CODE_PTP_PPS'
+ drivers/net/ethernet/sfc/mcdi.c:584:17: sparse: undefined identifier 'efx_ptp_event'
+ drivers/net/ethernet/sfc/mcdi.c:583:14: sparse: incompatible types for 'case' statement
+ drivers/net/ethernet/sfc/mcdi.c:583:14: sparse: Expected constant expression in case statement
  drivers/net/ethernet/sfc/mcdi.c: In function 'efx_mcdi_process_event':
  drivers/net/ethernet/sfc/mcdi.c:583:7: error: 'MCDI_EVENT_CODE_PTP_PPS' undeclared (first use in this function)
  drivers/net/ethernet/sfc/mcdi.c:583:7: note: each undeclared identifier is reported only once for each function it appears in
  drivers/net/ethernet/sfc/mcdi.c:584:3: error: implicit declaration of function 'efx_ptp_event' [-Werror=implicit-function-declaration]
  cc1: some warnings being treated as errors

vim +583 drivers/net/ethernet/sfc/mcdi.c
   580			break;
   581		case MCDI_EVENT_CODE_PTP_RX:
   582		case MCDI_EVENT_CODE_PTP_FAULT:
 > 583		case MCDI_EVENT_CODE_PTP_PPS:
   584			efx_ptp_event(efx, event);
   585			break;
   586	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
