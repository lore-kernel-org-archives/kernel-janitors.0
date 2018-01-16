From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 08:16:48 +0000
Subject: [PATCH 0/2] mfd: smsc-ece1099: Adjustments for smsc_i2c_probe()
Message-Id: <978023d9-01f2-3a16-5eba-e06b8359cfc0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 09:14:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/mfd/smsc-ece1099.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.15.1

