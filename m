From: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>
Date: Tue, 28 Jun 2016 04:40:58 +0000
Subject: RE: qed: Add support for coalescing config read/update.
Message-Id: <BY1PR11MB04225C11633C6816F0C335BC90220@BY1PR11MB0422.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160627195058.GA4081@mwanda>
In-Reply-To: <20160627195058.GA4081@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan carpenter,
     Thanks for your mail. Will submit the fix.

Thanks,
Sudarsana

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
Sent: 28 June 2016 01:21
To: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>; Yuval Mintz <Yuval.Mintz@qlogic.com>
Cc: kernel-janitors@vger.kernel.org
Subject: re: qed: Add support for coalescing config read/update.

Hello Sudarsana Reddy Kalluru,

The patch 722003ac40c2: "qed: Add support for coalescing config read/update." from Jun 21, 2016, leads to the following static checker warning:

	drivers/net/ethernet/qlogic/qed/qed_int.c:2450 qed_init_cau_sb_entry()
	warn: always true condition '(cdev->rx_coalesce_usecs <= 255) => (0-255 <= 255)'

drivers/net/ethernet/qlogic/qed/qed_int.c
  2446  
  2447          /* Coalesce = (timeset << timer-res), timeset is 7bit wide */
  2448          if (cdev->rx_coalesce_usecs <= 0x7F)
  2449                  timer_res = 0;
  2450          else if (cdev->rx_coalesce_usecs <= 0xFF)
  2451                  timer_res = 1;
  2452          else
  2453                  timer_res = 2;

timer_res can't be two because ->rx_coalesce_usecs is a u8.

  2454          SET_FIELD(p_sb_entry->params, CAU_SB_ENTRY_TIMER_RES0, timer_res);
  2455  
  2456          if (cdev->tx_coalesce_usecs <= 0x7F)
  2457                  timer_res = 0;
  2458          else if (cdev->tx_coalesce_usecs <= 0xFF)
  2459                  timer_res = 1;
  2460          else
  2461                  timer_res = 2;

Same.

  2462          SET_FIELD(p_sb_entry->params, CAU_SB_ENTRY_TIMER_RES1, timer_res);
  2463  
  2464          SET_FIELD(p_sb_entry->data, CAU_SB_ENTRY_STATE0, cau_state);
  2465          SET_FIELD(p_sb_entry->data, CAU_SB_ENTRY_STATE1, cau_state);
  2466  }

There are a couple others as well.

drivers/net/ethernet/qlogic/qed/qed_int.c:2511 qed_int_cau_conf_sb() warn: always true condition '(p_hwfn->cdev->rx_coalesce_usecs <= 255) => (0-255 <= 255)'
drivers/net/ethernet/qlogic/qed/qed_int.c:2522 qed_int_cau_conf_sb() warn: always true condition '(p_hwfn->cdev->tx_coalesce_usecs <= 255) => (0-255 <= 255)'

regards,
dan carpenter
