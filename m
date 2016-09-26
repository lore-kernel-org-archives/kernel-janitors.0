From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 26 Sep 2016 20:24:46 +0000
Subject: [PATCH] spmi: pmic-arb: Return an error code if sanity check fails
Message-Id: <1474921486-7560-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sboyd@codeaurora.org, gregkh@linuxfoundation.org, bjorn.andersson@sonymobile.com, marc.zyngier@arm.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the test 'if (channel > 5)' is true, then we will return 'err' which
is known to be 0 at this point.
Return -EINVAL instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Un-tested
---
 drivers/spmi/spmi-pmic-arb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index aca282d45421..5ec3a595dc7d 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -954,6 +954,7 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	if (channel > 5) {
 		dev_err(&pdev->dev, "invalid channel (%u) specified.\n",
 			channel);
+		err = -EINVAL;
 		goto err_put_ctrl;
 	}
 
-- 
2.7.4

