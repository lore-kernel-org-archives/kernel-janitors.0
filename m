From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 May 2017 20:05:50 +0000
Subject: [PATCH 0/2] regmap: Adjustments for two function implementations
Message-Id: <7d7b8131-5aea-cb33-994f-f410dc7cd615@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 May 2017 22:02:02 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in regmap_bulk_write()
  Adjust five checks for null pointers in __regmap_init()

 drivers/base/regmap/regmap.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
2.13.0

