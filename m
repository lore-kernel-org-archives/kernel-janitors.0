From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Oct 2019 11:31:58 +0000
Subject: [bug report] net: aquantia: add basic ptp_clock callbacks
Message-Id: <20191028113158.GA32279@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Egor Pomozov,

The patch 910479a9f793: "net: aquantia: add basic ptp_clock
callbacks" from Oct 22, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/aquantia/atlantic/aq_ptp.c:1208 aq_ptp_init()
	warn: 'clock' is an error pointer or valid

drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
  1203          spin_lock_init(&aq_ptp->ptp_ring_lock);
  1204  
  1205          aq_ptp->ptp_info = aq_ptp_clock;
  1206          aq_ptp_gpio_init(&aq_ptp->ptp_info, &mbox.info);
  1207          clock = ptp_clock_register(&aq_ptp->ptp_info, &aq_nic->ndev->dev);
  1208          if (!clock || IS_ERR(clock)) {
  1209                  netdev_err(aq_nic->ndev, "ptp_clock_register failed\n");
  1210                  err = PTR_ERR(clock);
  1211                  goto err_exit;

This is a false positive in Smatch but the code is still problematic.

The issue is that ptp_clock_register() returns error pointers if there
is an error and it returns NULL if the clock is disabled in the config.
If "clock" is NULL then this code returns PTR_ERR(NULL) which is
success but so that's a bug.

The question is, is it really realistic for people to run this hardware
without a ptp clock?  If so then we should allow it instead of erroring
out here when clock is NULL.  If not then we should enforce that in the
Kconfig instead of waiting until runtime.

  1212          }
  1213          aq_ptp->ptp_clock = clock;
  1214          aq_ptp_tx_timeout_init(&aq_ptp->ptp_tx_timeout);
  1215  
  1216          atomic_set(&aq_ptp->offset_egress, 0);
  1217          atomic_set(&aq_ptp->offset_ingress, 0);
  1218  

regards,
dan carpenter
