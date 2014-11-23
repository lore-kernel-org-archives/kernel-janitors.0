From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Nov 2014 13:11:16 +0000
Subject: [PATCH 3/5] electra_cf: fix error return code
Message-Id: <1416748278-22881-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416748278-22881-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416748278-22881-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/pcmcia/electra_cf.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
index 7f9950d..6a67a00 100644
--- a/drivers/pcmcia/electra_cf.c
+++ b/drivers/pcmcia/electra_cf.c
@@ -250,6 +250,7 @@ static int electra_cf_probe(struct platform_device *ofdev)
 
 	cf->socket.pci_irq = cf->irq;
 
+	status = -EINVAL;
 	prop = of_get_property(np, "card-detect-gpio", NULL);
 	if (!prop)
 		goto fail1;

