From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Dec 2013 21:56:18 +0000
Subject: [PATCH 10/25] usb: gadget: fix error return code
Message-Id: <1388357260-4843-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Set the return variable to an error code as done elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
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
Not tested.

 drivers/usb/gadget/printer.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/printer.c b/drivers/usb/gadget/printer.c
index bf7a56b..92b55bd 100644
--- a/drivers/usb/gadget/printer.c
+++ b/drivers/usb/gadget/printer.c
@@ -1133,6 +1133,7 @@ static int __init printer_bind_config(struct usb_configuration *c)
 				  NULL, "g_printer");
 	if (IS_ERR(dev->pdev)) {
 		ERROR(dev, "Failed to create device: g_printer\n");
+		status = PTR_ERR(dev->pdev);
 		goto fail;
 	}
 

