From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:21:44 +0000
Subject: [bug report] bnxt_en: Report health status update after reset is done
Message-Id: <20191126122144.qzyppfh4pjr7gib7@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vasundhara Volam,

This is a semi-automatic email about new static checker warnings.

The patch e4e38237d7e3: "bnxt_en: Report health status update after
reset is done" from Nov 18, 2019, leads to the following Smatch
complaint:

    drivers/net/ethernet/broadcom/bnxt/bnxt.c:10804 bnxt_fw_reset_task()
     error: we previously assumed 'bp->fw_health' could be null (see line 10755)

drivers/net/ethernet/broadcom/bnxt/bnxt.c
 10754			if (test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state) &&
 10755			    bp->fw_health) {
                            ^^^^^^^^^^^^^
It looks like ->fw_health can be NULL.

 10756				u32 val;
 10757	
 10758				val = bnxt_fw_health_readl(bp,
 10759							   BNXT_FW_RESET_INPROG_REG);
 10760				if (val)
 10761					netdev_warn(bp->dev, "FW reset inprog %x after min wait time.\n",
 10762						    val);
 10763			}
 10764			clear_bit(BNXT_STATE_FW_FATAL_COND, &bp->state);
 10765			if (pci_enable_device(bp->pdev)) {
 10766				netdev_err(bp->dev, "Cannot re-enable PCI device\n");
 10767				goto fw_reset_abort;
 10768			}
 10769			pci_set_master(bp->pdev);
 10770			bp->fw_reset_state = BNXT_FW_RESET_STATE_POLL_FW;
 10771			/* fall through */
 10772		case BNXT_FW_RESET_STATE_POLL_FW:
 10773			bp->hwrm_cmd_timeout = SHORT_HWRM_CMD_TIMEOUT;
 10774			rc = __bnxt_hwrm_ver_get(bp, true);
 10775			if (rc) {
 10776				if (time_after(jiffies, bp->fw_reset_timestamp +
 10777					       (bp->fw_reset_max_dsecs * HZ / 10))) {
 10778					netdev_err(bp->dev, "Firmware reset aborted\n");
 10779					goto fw_reset_abort;
 10780				}
 10781				bnxt_queue_fw_reset_work(bp, HZ / 5);
 10782				return;
 10783			}
 10784			bp->hwrm_cmd_timeout = DFLT_HWRM_CMD_TIMEOUT;
 10785			bp->fw_reset_state = BNXT_FW_RESET_STATE_OPENING;
 10786			/* fall through */
 10787		case BNXT_FW_RESET_STATE_OPENING:
 10788			while (!rtnl_trylock()) {
 10789				bnxt_queue_fw_reset_work(bp, HZ / 10);
 10790				return;
 10791			}
 10792			rc = bnxt_open(bp->dev);
 10793			if (rc) {
 10794				netdev_err(bp->dev, "bnxt_open_nic() failed\n");
 10795				clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
 10796				dev_close(bp->dev);
 10797			}
 10798	
 10799			bp->fw_reset_state = 0;
 10800			/* Make sure fw_reset_state is 0 before clearing the flag */
 10801			smp_mb__before_atomic();
 10802			clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
 10803			bnxt_ulp_start(bp, rc);
 10804			bnxt_dl_health_status_update(bp, true);
                                                     ^^
But this patch adds a new unchecked dereference inside the function.

 10805			rtnl_unlock();
 10806			break;

regards,
dan carpenter
