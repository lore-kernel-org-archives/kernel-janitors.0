From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Jan 2016 20:51:21 +0000
Subject: [PATCH 0/3] NFC-mei_phy: Fine-tuning for two function implementations
Message-Id: <56883849.2080304@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Jan 2016 21:47:30 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Refactoring for mei_nfc_connect()
  Refactoring for mei_nfc_if_version()
  Delete an unnecessary variable initialisation in mei_nfc_if_version()

 drivers/nfc/mei_phy.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

-- 
2.6.3

