From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 20 Nov 2014 17:33:59 +0000
Subject: [PATCH 4/7] serial: icom: fix error return code
Message-Id: <1416504842-18548-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

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
The patches in this series are independent of each other.

 drivers/tty/serial/icom.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/icom.c b/drivers/tty/serial/icom.c
index d4620fe..45fc323 100644
--- a/drivers/tty/serial/icom.c
+++ b/drivers/tty/serial/icom.c
@@ -1550,8 +1550,10 @@ static int icom_probe(struct pci_dev *dev,
 
 	icom_adapter->base_addr = pci_ioremap_bar(dev, 0);
 
-	if (!icom_adapter->base_addr)
+	if (!icom_adapter->base_addr) {
+		retval = -ENOMEM;
 		goto probe_exit1;
+	}
 
 	 /* save off irq and request irq line */
 	 if ( (retval = request_irq(dev->irq, icom_interrupt,

