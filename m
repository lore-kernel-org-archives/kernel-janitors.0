From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 08:18:52 +0000
Subject: [PATCH 0/2] [media] TDA18212HN: Adjustments for two function implementations
Message-Id: <eb35c033-46b3-4fd6-8398-f1e3869a67a8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 10:03:45 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve three size determinations

 drivers/media/tuners/tda18212.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.14.1

