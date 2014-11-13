From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Nov 2014 10:35:25 +0000
Subject: [patch 1/2 -next] mfd: dln2: add a limit check for invalid "echo"
Message-Id: <20141113103525.GA17038@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Octavian Purdila <octavian.purdila@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We check the other variables and traditionally we don't trust data from
USB devices so adding a check here is normal.  This silences a static
checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I am unsure if this fix is correct and I don't have the hardware.
Please review this one carefully.  The "goto out;" seems to use the
invalid data and I don't understand why.

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 9765a17..3101e5e 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -280,6 +280,11 @@ static void dln2_rx(struct urb *urb)
 		goto out;
 	}
 
+	if (echo >= DLN2_MAX_RX_SLOTS) {
+		dev_warn(dev, "invalid echo %d\n", echo);
+		goto out;
+	}
+
 	data = urb->transfer_buffer + sizeof(struct dln2_header);
 	len = urb->actual_length - sizeof(struct dln2_header);
 
