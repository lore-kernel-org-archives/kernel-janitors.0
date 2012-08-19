From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 19 Aug 2012 08:44:22 +0000
Subject: [PATCH 2/14] drivers/power/ab8500_btemp.c: fix error return code
Message-Id: <1345365870-29831-7-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/power/ab8500_btemp.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/ab8500_btemp.c b/drivers/power/ab8500_btemp.c
index bba3cca..2b76943 100644
--- a/drivers/power/ab8500_btemp.c
+++ b/drivers/power/ab8500_btemp.c
@@ -1014,6 +1014,7 @@ static int __devinit ab8500_btemp_probe(struct platform_device *pdev)
 		create_singlethread_workqueue("ab8500_btemp_wq");
 	if (di->btemp_wq = NULL) {
 		dev_err(di->dev, "failed to create work queue\n");
+		ret = -ENOMEM;
 		goto free_device_info;
 	}
 

