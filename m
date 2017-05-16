From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 12:06:07 +0000
Subject: [PATCH 0/2] Fixed voltage regulator: Adjustments for two function implementations
Message-Id: <83b84f24-503b-4b45-3e4d-9c88c6b0252b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 13:55:44 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete error messages for failed memory allocations in reg_fixed_voltage_probe()
  Improve a size determination in two functions

 drivers/regulator/fixed.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

-- 
2.13.0

