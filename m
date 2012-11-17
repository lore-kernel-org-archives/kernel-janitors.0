From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Nov 2012 15:06:11 +0000
Subject: [patch] USB: usbtest: prevent a divide by zero bug
Message-Id: <20121117150610.GA19951@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If param->length is zero, then this could lead to a divide by zero bug
later in the function when we do: size %= max;

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index f10bd97..7667b12 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -423,6 +423,9 @@ alloc_sglist(int nents, int max, int vary)
 	unsigned		i;
 	unsigned		size = max;
 
+	if (max = 0)
+		return NULL;
+
 	sg = kmalloc_array(nents, sizeof *sg, GFP_KERNEL);
 	if (!sg)
 		return NULL;
