From: Mark Brown <broonie@kernel.org>
Date: Mon, 05 Mar 2018 17:18:13 +0000
Subject: Applied "regulator: core: use NULL rather than 0 for cells_name argument" to the regulator tree
Message-Id: <E1estkb-0007xM-UZ@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180305123853.25750-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: core: use NULL rather than 0 for cells_name argument

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

From 3b81f5d3442e04e13726f27728592af829df3dcf Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 5 Mar 2018 13:38:53 +0100
Subject: [PATCH] regulator: core: use NULL rather than 0 for cells_name
 argument

The 3rd paramater is a pointer type and should be NULL rather than a
zero, clean up spare warning:

drivers/regulator/of_regulator.c:424:75: warning: Using plain integer
as NULL pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/of_regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 7df3a46908f1..a2eb9046adf8 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -420,7 +420,8 @@ int of_get_n_coupled(struct regulator_dev *rdev)
 	int n_phandles;
 
 	n_phandles = of_count_phandle_with_args(node,
-						"regulator-coupled-with", 0);
+						"regulator-coupled-with",
+						NULL);
 
 	return (n_phandles > 0) ? n_phandles : 0;
 }
-- 
2.16.2

