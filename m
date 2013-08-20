From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Aug 2013 09:06:19 +0000
Subject: [patch] staging: comedi: usbdux: allocating too much data
Message-Id: <20130820090618.GD20170@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We only need to allocate enough space for a pointer.  We allocate the
space for the urbs themselves with the call to usb_alloc_urb() a few
lines later.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested.

diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index 7e91f15..701ad1a 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -1558,9 +1558,9 @@ static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
 	devpriv->dux_commands = kzalloc(SIZEOFDUXBUFFER, GFP_KERNEL);
 	devpriv->in_buf = kzalloc(SIZEINBUF, GFP_KERNEL);
 	devpriv->insn_buf = kzalloc(SIZEINSNBUF, GFP_KERNEL);
-	devpriv->ai_urbs = kcalloc(devpriv->n_ai_urbs, sizeof(*urb),
+	devpriv->ai_urbs = kcalloc(devpriv->n_ai_urbs, sizeof(void *),
 				   GFP_KERNEL);
-	devpriv->ao_urbs = kcalloc(devpriv->n_ao_urbs, sizeof(*urb),
+	devpriv->ao_urbs = kcalloc(devpriv->n_ao_urbs, sizeof(void *),
 				   GFP_KERNEL);
 	if (!devpriv->dux_commands || !devpriv->in_buf || !devpriv->insn_buf ||
 	    !devpriv->ai_urbs || !devpriv->ao_urbs)
