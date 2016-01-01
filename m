From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Jan 2016 16:50:26 +0000
Subject: [PATCH 0/2] net-qmi_wwan: Fine-tuning for two function implementations
Message-Id: <5686AE52.1020008@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Jan 2016 17:47:46 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Refactoring for qmi_wwan_bind()
  Delete an unnecessary variable initialisation in qmi_wwan_register_subdriver()

 drivers/net/usb/qmi_wwan.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.6.3

