From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Jan 2013 07:41:38 +0000
Subject: [patch] USB: c67x00-ll-hpi.c: signedness bug in ll_recv_msg()
Message-Id: <20130118074138.GA31793@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The callers expect this function to return zero on success or -EIO if it
times out.  The type should be int instead of unsigned short.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/c67x00/c67x00-ll-hpi.c b/drivers/usb/c67x00/c67x00-ll-hpi.c
index a9636f4..3a1ca4d 100644
--- a/drivers/usb/c67x00/c67x00-ll-hpi.c
+++ b/drivers/usb/c67x00/c67x00-ll-hpi.c
@@ -237,7 +237,7 @@ void c67x00_ll_hpi_disable_sofeop(struct c67x00_sie *sie)
 /* -------------------------------------------------------------------------- */
 /* Transactions */
 
-static inline u16 ll_recv_msg(struct c67x00_device *dev)
+static inline int ll_recv_msg(struct c67x00_device *dev)
 {
 	u16 res;
 
