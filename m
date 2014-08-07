From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 07 Aug 2014 20:57:47 +0000
Subject: [PATCH 4/4] usb: gadget: fix error return code
Message-Id: <1407445067-4044-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a zero return value on error to a negative one, as returned
elsewhere in the function.

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
 drivers/usb/gadget/udc/fusb300_udc.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index d40255f..5c5d1ad 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1398,13 +1398,17 @@ static int fusb300_probe(struct platform_device *pdev)
 
 	/* initialize udc */
 	fusb300 = kzalloc(sizeof(struct fusb300), GFP_KERNEL);
-	if (fusb300 = NULL)
+	if (fusb300 = NULL) {
+		ret = -ENOMEM;
 		goto clean_up;
+	}
 
 	for (i = 0; i < FUSB300_MAX_NUM_EP; i++) {
 		_ep[i] = kzalloc(sizeof(struct fusb300_ep), GFP_KERNEL);
-		if (_ep[i] = NULL)
+		if (_ep[i] = NULL) {
+			ret = -ENOMEM;
 			goto clean_up;
+		}
 		fusb300->ep[i] = _ep[i];
 	}
 

