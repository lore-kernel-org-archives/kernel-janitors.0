From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 19 Aug 2012 08:44:19 +0000
Subject: [PATCH 5/14] drivers/power/ab8500_charger.c: fix error return code
Message-Id: <1345365870-29831-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <cbou@mail.ru>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

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
 drivers/power/ab8500_charger.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/ab8500_charger.c b/drivers/power/ab8500_charger.c
index d4f0c98..c2ef947 100644
--- a/drivers/power/ab8500_charger.c
+++ b/drivers/power/ab8500_charger.c
@@ -2614,6 +2614,7 @@ static int __devinit ab8500_charger_probe(struct platform_device *pdev)
 		create_singlethread_workqueue("ab8500_charger_wq");
 	if (di->charger_wq = NULL) {
 		dev_err(di->dev, "failed to create work queue\n");
+		ret = -ENOMEM;
 		goto free_device_info;
 	}
 

