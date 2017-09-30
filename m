From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Sep 2017 08:15:29 +0000
Subject: [PATCH] usb: misc: usbtest: Fix overflow in usbtest_do_ioctl()
Message-Id: <20170930081529.g3vtwn22yfrjdbjv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There used to be a test against "if (param->sglen > MAX_SGLEN)" but it
was removed during a refactor.  It leads to an integer overflow and a
stack overflow in test_queue() if we try to create a too large urbs[]
array on the stack.

There is a second integer overflow in test_queue() as well if
"param->iterations" is too high.  I don't immediately see that it's
harmful but I've added a check to prevent it and silence the static
checker warning.

Fixes: 18fc4ebdc705 ("usb: misc: usbtest: Remove timeval usage")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index eee82ca55b7b..113e38bfe0ef 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -1964,6 +1964,9 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
 	int			status = 0;
 	struct urb		*urbs[param->sglen];
 
+	if (!param->sglen || param->iterations > UINT_MAX / param->sglen)
+		return -EINVAL;
+
 	memset(&context, 0, sizeof(context));
 	context.count = param->iterations * param->sglen;
 	context.dev = dev;
@@ -2087,6 +2090,8 @@ usbtest_do_ioctl(struct usb_interface *intf, struct usbtest_param_32 *param)
 
 	if (param->iterations <= 0)
 		return -EINVAL;
+	if (param->sglen > MAX_SGLEN)
+		return -EINVAL;
 	/*
 	 * Just a bunch of test cases that every HCD is expected to handle.
 	 *
