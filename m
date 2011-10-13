From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2011 06:42:57 +0000
Subject: [patch] Input: CMA3000 - signedness bug in cma3000_thread_irq()
Message-Id: <20111013064257.GA11651@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Shubhrajyoti <Shubhrajyoti@ti.com>, Sergio Aguirre <saaguirre@ti.com>, Jonathan Cameron <jic23@cam.ac.uk>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

The ->read() function returns an int; negative error codes on error
or a byte of data on success.  intr_status needs to be signed here
for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/misc/cma3000_d0x.c b/drivers/input/misc/cma3000_d0x.c
index 80793f1..2a42b53 100644
--- a/drivers/input/misc/cma3000_d0x.c
+++ b/drivers/input/misc/cma3000_d0x.c
@@ -116,7 +116,8 @@ static irqreturn_t cma3000_thread_irq(int irq, void *dev_id)
 {
 	struct cma3000_accl_data *data = dev_id;
 	int datax, datay, dataz;
-	u8 ctrl, mode, range, intr_status;
+	u8 ctrl, mode, range;
+	int intr_status;
 
 	intr_status = CMA3000_READ(data, CMA3000_INTSTATUS, "interrupt status");
 	if (intr_status < 0)
