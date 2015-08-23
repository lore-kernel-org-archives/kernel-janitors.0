From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Aug 2015 00:11:17 +0000
Subject: [PATCH 06/11] mmc: usdhi6rol0: fix error return code
Message-Id: <1440288682-12732-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

Propagate error code on failure.

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
 drivers/mmc/host/usdhi6rol0.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
index 54b082b..99f894c 100644
--- a/drivers/mmc/host/usdhi6rol0.c
+++ b/drivers/mmc/host/usdhi6rol0.c
@@ -1734,8 +1734,10 @@ static int usdhi6_probe(struct platform_device *pdev)
 	}
 
 	host->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(host->clk))
+	if (IS_ERR(host->clk)) {
+		ret = PTR_ERR(host->clk);
 		goto e_free_mmc;
+	}
 
 	host->imclk = clk_get_rate(host->clk);
 

