From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 10:09:00 +0000
Subject: [PATCH v3 0/3] gianfar: Fine-tuning for gfar_ethflow_to_filer_table()
Message-Id: <5698C53C.8060204@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56866E7F.8080609@users.sourceforge.net>
In-Reply-To: <56866E7F.8080609@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Claudiu Manoil <claudiu.manoil@freescale.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 11:05:43 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Less function calls after error detection
  Delete unnecessary variable initialisations
  Extend an initialisation clause of a for loop

---

v3: Rebase proposed changes on the source files for the software
    "Linux next-20160114".
    
v2: Unfortunately, an inappropriate return code was selected in the first
    update step from this series.
    Thus fix that.

 drivers/net/ethernet/freescale/gianfar_ethtool.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

-- 
2.6.3

