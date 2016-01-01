From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Jan 2016 12:18:07 +0000
Subject: [PATCH 0/3] net-gianfar: Fine-tuning for gfar_ethflow_to_filer_table()
Message-Id: <56866E7F.8080609@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Claudiu Manoil <claudiu.manoil@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Jan 2016 13:15:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Less function calls after error detection
  Delete unnecessary variable initialisations
  Extend an initialisation clause of a for loop

 drivers/net/ethernet/freescale/gianfar_ethtool.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

-- 
2.6.3

