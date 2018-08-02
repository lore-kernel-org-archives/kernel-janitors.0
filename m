From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 02 Aug 2018 08:24:47 +0000
Subject: [PATCH] uio: potential double frees if __uio_register_device() fails
Message-Id: <20180802082447.rkdptfjxn5vyifbt@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Hans J. Koch" <hjk@linutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The uio_unregister_device() function assumes that if "info->uio_dev" is
non-NULL that means "info" is fully allocated.  Setting info->uio_de
has to be the last thing in the function.

In the current code, if request_threaded_irq() fails then we return with
info->uio_dev set to non-NULL but info is not fully allocated and it can
lead to double frees.

Fixes: beafc54c4e2f ("UIO: Add the User IO core code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index 144cf7365288..cf388c384553 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -957,8 +957,6 @@ int __uio_register_device(struct module *owner,
 	if (ret)
 		goto err_uio_dev_add_attributes;
 
-	info->uio_dev = idev;
-
 	if (info->irq && (info->irq != UIO_IRQ_CUSTOM)) {
 		/*
 		 * Note that we deliberately don't use devm_request_irq
@@ -975,6 +973,7 @@ int __uio_register_device(struct module *owner,
 			goto err_request_irq;
 	}
 
+	info->uio_dev = idev;
 	return 0;
 
 err_request_irq:
