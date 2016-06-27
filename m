From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jun 2016 19:50:58 +0000
Subject: re: qed: Add support for coalescing config read/update.
Message-Id: <20160627195058.GA4081@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sudarsana Reddy Kalluru,

The patch 722003ac40c2: "qed: Add support for coalescing config
read/update." from Jun 21, 2016, leads to the following static
checker warning:

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
