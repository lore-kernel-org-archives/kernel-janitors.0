From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 21:00:06 +0000
Subject: [PATCH 0/2] regulator: s2mps11: Fine-tuning for s2mps11_pmic_probe()
Message-Id: <b0fc50c2-4552-93d1-1ae0-42f78d255fe9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 22:55:22 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kcalloc()
  Use devm_kmalloc_array()

 drivers/regulator/s2mps11.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.12.2

