From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Nov 2015 14:22:08 +0000
Subject: re: bnxt_en: New Broadcom ethernet driver.
Message-Id: <20151103142208.GA28545@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Michael Chan,

The patch c0c050c58d84: "bnxt_en: New Broadcom ethernet driver." from
Oct 22, 2015, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/bnxt/bnxt.c:5337 bnxt_rx_flow_steer()
	warn: impossible condition '(new_fltr->sw_id < 0) => (0-65535 < 0)'

drivers/net/ethernet/broadcom/bnxt/bnxt.c
  5335          new_fltr->sw_id = bitmap_find_free_region(bp->ntp_fltr_bmap,
  5336                                                    BNXT_NTP_FLTR_MAX_FLTR, 0);
  5337          if (new_fltr->sw_id < 0) {
                   ^^^^^^^^^^^^^^^^^^^^
Unsigned never less than zero.

  5338                  spin_unlock_bh(&bp->ntp_fltr_lock);
  5339                  rc = -ENOMEM;
  5340                  goto err_free;
  5341          }

regards,
dan carpenter
