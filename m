From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 14:20:43 +0000
Subject: [PATCH 0/2] i2c-sh7760: Adjustments for sh7760_i2c_probe()
Message-Id: <3f4a9053-5518-61ab-2cdf-e400f6b35ce3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 15:18:29 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/i2c/busses/i2c-sh7760.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.16.1

