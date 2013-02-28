From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2013 04:43:12 +0000
Subject: [patch] usb: gadget: f_uac1: silence an info leak warning
Message-Id: <20130228044311.GA15239@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that "len" could be larger than the sizeof(value)
so we could be copying garbage here.  I have changed this to match
how things are done in composite_setup().

The call tree looks like:
  composite_setup()
  --> f_audio_setup()
      --> audio_get_intf_req()

composite_setup() expects the return value to be set to
sizeof(value).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker fix.  I can't test this.

diff --git a/drivers/usb/gadget/f_uac1.c b/drivers/usb/gadget/f_uac1.c
index f570e66..fa8ea4e 100644
--- a/drivers/usb/gadget/f_uac1.c
+++ b/drivers/usb/gadget/f_uac1.c
@@ -418,6 +418,7 @@ static int audio_get_intf_req(struct usb_function *f,
 
 	req->context = audio;
 	req->complete = f_audio_complete;
+	len = min_t(size_t, sizeof(value), len);
 	memcpy(req->buf, &value, len);
 
 	return len;
