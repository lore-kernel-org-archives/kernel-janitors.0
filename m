From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:21:00 +0000
Subject: [PATCH 18/20] usb: gadget: fix misspelling of current function in string
Message-Id: <1417980062-25151-19-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Replace a misspelled function name by %s and then __func__.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/usb/gadget/function/f_hid.c  |    5 +++--
 drivers/usb/gadget/function/f_midi.c |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index a904403..259b656 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -520,7 +520,7 @@ static void f_midi_transmit(struct f_midi *midi, struct usb_request *req)
 		req = midi_alloc_ep_req(ep, midi->buflen);
 
 	if (!req) {
-		ERROR(midi, "gmidi_transmit: alloc_ep_request failed\n");
+		ERROR(midi, "%s: alloc_ep_request failed\n", __func__);
 		return;
 	}
 	req->length = 0;
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 6e04e30..a1bc3e3 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -399,8 +399,9 @@ static int hidg_setup(struct usb_function *f,
 	value	= __le16_to_cpu(ctrl->wValue);
 	length	= __le16_to_cpu(ctrl->wLength);
 
-	VDBG(cdev, "hid_setup crtl_request : bRequestType:0x%x bRequest:0x%x "
-		"Value:0x%x\n", ctrl->bRequestType, ctrl->bRequest, value);
+	VDBG(cdev,
+	     "%s crtl_request : bRequestType:0x%x bRequest:0x%x Value:0x%x\n",
+	     __func__, ctrl->bRequestType, ctrl->bRequest, value);
 
 	switch ((ctrl->bRequestType << 8) | ctrl->bRequest) {
 	case ((USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8

