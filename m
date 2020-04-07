From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 13:55:59 +0000
Subject: [bug report] bus: mhi: core: Add support for data transfer
Message-Id: <20200407135559.GA109574@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Manivannan Sadhasivam,

The patch 189ff97cca53: "bus: mhi: core: Add support for data
transfer" from Feb 20, 2020, leads to the following static checker
warning:

	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
	error: double locked 'mhi_chan->lock' (orig line 1110)

drivers/bus/mhi/core/main.c
  1142          }
  1143  
  1144          /* Toggle wake to exit out of M2 */
  1145          mhi_cntrl->wake_toggle(mhi_cntrl);
  1146  
  1147          if (mhi_chan->dir = DMA_TO_DEVICE)
  1148                  atomic_inc(&mhi_cntrl->pending_pkts);
  1149  
  1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
  1151                  unsigned long flags;
  1152  
  1153                  read_lock_irqsave(&mhi_chan->lock, flags);
                                          ^^^^^^^^^^^^^^^
The caller is already holding this lock.

  1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
  1155                  read_unlock_irqrestore(&mhi_chan->lock, flags);
  1156          }
  1157  
  1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
  1159  
  1160          return 0;
  1161  }
  1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);

regards,
dan carpenter
