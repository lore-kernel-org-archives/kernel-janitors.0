From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 20:57:16 +0000
Subject: [PATCH 0/2] mmc-host: Fine-tuning for one function
Message-Id: <5682F3AC.7050107@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mmc@vger.kernel.org, Sascha Sommer <saschasommer@freenet.de>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 21:54:14 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete unnecessary variable initialisations in sdricoh_init_mmc()
  Less checks in sdricoh_init_mmc() after error detection

 drivers/mmc/host/sdricoh_cs.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

-- 
2.6.3

