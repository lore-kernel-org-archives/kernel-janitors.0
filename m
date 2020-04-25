From: Colin King <colin.king@canonical.com>
Date: Sat, 25 Apr 2020 12:44:48 +0000
Subject: [PATCH] drivers: uio: remove redundant assignment to variable retval
Message-Id: <20200425124448.139532-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/uio/uio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index 6e725c6c6256..73efb80815db 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -398,7 +398,7 @@ static void uio_dev_del_attributes(struct uio_device *idev)
 
 static int uio_get_minor(struct uio_device *idev)
 {
-	int retval = -ENOMEM;
+	int retval;
 
 	mutex_lock(&minor_lock);
 	retval = idr_alloc(&uio_idr, idev, 0, UIO_MAX_DEVICES, GFP_KERNEL);
-- 
2.25.1
