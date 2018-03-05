From: Colin King <colin.king@canonical.com>
Date: Mon, 05 Mar 2018 12:38:53 +0000
Subject: [PATCH][next] regulator: core: use NULL rather than 0 for cells_name argument
Message-Id: <20180305123853.25750-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The 3rd paramater is a pointer type and should be NULL rather than a
zero, clean up spare warning:

drivers/regulator/of_regulator.c:424:75: warning: Using plain integer
as NULL pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/of_regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index cf3210c3fae6..4dfa2aca7c73 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -421,7 +421,8 @@ int of_get_n_coupled(struct regulator_dev *rdev)
 	int n_phandles;
 
 	n_phandles = of_count_phandle_with_args(node,
-						"regulator-coupled-with", 0);
+						"regulator-coupled-with",
+						NULL);
 
 	return (n_phandles > 0) ? n_phandles : 0;
 }
-- 
2.15.1

