From: Mark Brown <broonie@kernel.org>
Date: Mon, 12 Feb 2018 12:09:21 +0000
Subject: Applied "regulator: of: Add a missing 'of_node_put()' in an error handling path of 'of_regulator_mat
Message-Id: <E1elCvB-0007XX-0o@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1444480254-14399-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.orgMark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>linux-kernel@vger.kernel.org

The patch

   regulator: of: Add a missing 'of_node_put()' in an error handling path of 'of_regulator_match()'

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 30966861a7a2051457be8c49466887d78cc47e97 Mon Sep 17 00:00:00 2001
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 26 Jan 2018 23:13:44 +0100
Subject: [PATCH] regulator: of: Add a missing 'of_node_put()' in an error
 handling path of 'of_regulator_match()'

If an unlikely failure in 'of_get_regulator_init_data()' occurs, we must
release the reference on the current 'child' node before returning.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/of_regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 092ed6efb3ec..f47264fa1940 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -321,6 +321,7 @@ int of_regulator_match(struct device *dev, struct device_node *node,
 				dev_err(dev,
 					"failed to parse DT for regulator %s\n",
 					child->name);
+				of_node_put(child);
 				return -EINVAL;
 			}
 			match->of_node = of_node_get(child);
-- 
2.16.1

