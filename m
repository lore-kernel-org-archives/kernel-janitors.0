From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 14:15:27 +0000
Subject: [PATCH 0/2] mfd: smsc-ece1099: Fine-tuning for smsc_i2c_probe()
Message-Id: <5682957F.5000604@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 15:10:48 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an unnecessary variable initialisation
  Refactoring

 drivers/mfd/smsc-ece1099.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

-- 
2.6.3

