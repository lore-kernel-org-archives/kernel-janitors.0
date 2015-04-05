From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:06:21 +0000
Subject: [PATCH 1/16] wan: lmc: fix error return code
Message-Id: <1428235596-4757-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/net/wan/lmc/lmc_main.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_main.c
index bea0f31..317bc79 100644
--- a/drivers/net/wan/lmc/lmc_main.c
+++ b/drivers/net/wan/lmc/lmc_main.c
@@ -850,6 +850,7 @@ static int lmc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	dev = alloc_hdlcdev(sc);
 	if (!dev) {
 		printk(KERN_ERR "lmc:alloc_netdev for device failed\n");
+		err = -ENOMEM;
 		goto err_hdlcdev;
 	}
 

