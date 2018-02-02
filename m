From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 15:38:26 +0000
Subject: [PATCH 0/2] I2C-Nomadik: Adjustments for nmk_i2c_probe()
Message-Id: <97f41346-6abb-1c14-f536-ad12bbcb4c60@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 16:34:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/i2c/busses/i2c-nomadik.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.16.1

