From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Feb 2011 12:49:53 +0000
Subject: [patch 2/2] staging: ath6kl: buffer overflow in SEND_FRAME ioctl
Message-Id: <20110220124953.GB1898@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should check that optTxFrmCmd.optIEDataLen isn't too large before we
copy it into the data buffer.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/ath6kl/os/linux/ioctl.c b/drivers/staging/ath6kl/os/linux/ioctl.c
index 17ba543..9a9a324 100644
--- a/drivers/staging/ath6kl/os/linux/ioctl.c
+++ b/drivers/staging/ath6kl/os/linux/ioctl.c
@@ -3153,6 +3153,11 @@ int ar6000_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
                 break;
             }
 
+            if (optTxFrmCmd.optIEDataLen > MAX_OPT_DATA_LEN) {
+                ret = -EINVAL;
+                break;
+            }
+
             if (copy_from_user(data, userdata+sizeof(WMI_OPT_TX_FRAME_CMD) - 1,
                                    optTxFrmCmd.optIEDataLen)) {
                 ret = -EFAULT;
