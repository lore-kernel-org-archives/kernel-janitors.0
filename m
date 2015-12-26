From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 26 Dec 2015 15:28:43 +0000
Subject: [PATCH 4/7] usb: gadget: legacy: fix error return code
Message-Id: <1451143726-28195-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451143726-28195-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451143726-28195-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/gadget/legacy/acm_ms.c       |    4 +++-
 drivers/usb/gadget/legacy/audio.c        |    4 +++-
 drivers/usb/gadget/legacy/cdc2.c         |    4 +++-
 drivers/usb/gadget/legacy/ether.c        |    4 +++-
 drivers/usb/gadget/legacy/hid.c          |    4 +++-
 drivers/usb/gadget/legacy/mass_storage.c |    4 +++-
 drivers/usb/gadget/legacy/ncm.c          |    4 +++-
 7 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/legacy/acm_ms.c b/drivers/usb/gadget/legacy/acm_ms.c
index c16089e..2679264 100644
--- a/drivers/usb/gadget/legacy/acm_ms.c
+++ b/drivers/usb/gadget/legacy/acm_ms.c
@@ -211,8 +211,10 @@ static int acm_ms_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail_string_ids;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index 5d7b3c6..f61936b 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -249,8 +249,10 @@ static int audio_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail;
+		}
 		usb_otg_descriptor_init(cdev->gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
diff --git a/drivers/usb/gadget/legacy/cdc2.c b/drivers/usb/gadget/legacy/cdc2.c
index 51c0868..94261a1 100644
--- a/drivers/usb/gadget/legacy/cdc2.c
+++ b/drivers/usb/gadget/legacy/cdc2.c
@@ -183,8 +183,10 @@ static int cdc_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail1;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
diff --git a/drivers/usb/gadget/legacy/ether.c b/drivers/usb/gadget/legacy/ether.c
index 25a2c2e..3396e71 100644
--- a/drivers/usb/gadget/legacy/ether.c
+++ b/drivers/usb/gadget/legacy/ether.c
@@ -407,8 +407,10 @@ static int eth_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail1;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index a71a884..cccbb94 100644
--- a/drivers/usb/gadget/legacy/hid.c
+++ b/drivers/usb/gadget/legacy/hid.c
@@ -175,8 +175,10 @@ static int hid_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto put;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadget/legacy/mass_storage.c
index e61af53..93f2b8f 100644
--- a/drivers/usb/gadget/legacy/mass_storage.c
+++ b/drivers/usb/gadget/legacy/mass_storage.c
@@ -200,8 +200,10 @@ static int msg_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail_string_ids;
+		}
 		usb_otg_descriptor_init(cdev->gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
diff --git a/drivers/usb/gadget/legacy/ncm.c b/drivers/usb/gadget/legacy/ncm.c
index 0aba682..d71e368 100644
--- a/drivers/usb/gadget/legacy/ncm.c
+++ b/drivers/usb/gadget/legacy/ncm.c
@@ -162,8 +162,10 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;

