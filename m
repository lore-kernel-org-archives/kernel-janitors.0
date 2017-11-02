From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 07:58:09 +0000
Subject: [PATCH 0/3] regulator-core: Fine-tuning for nine function implementations
Message-Id: <471498fb-58af-46d4-2150-614c0f9cdc22@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 2 Nov 2017 08:54:32 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use common error handling code in regulator_resolve_supply()
  Improve a size determination in four functions
  Adjust 18 checks for null pointers

 drivers/regulator/core.c | 60 ++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

-- 
2.14.3

