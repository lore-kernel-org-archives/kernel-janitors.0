From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 12:57:42 +0000
Subject: [PATCH 0/2] NFC-digital: Adjustments for four function implementations
Message-Id: <7e27a76c-de7a-22ec-cf8a-31aee2000e29@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Samuel Ortiz <sameo@linux.intel.com>, Thierry Escande <thierry.escande@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 14:50:05 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Improve a size determination in four functions
  Delete an error message for a failed memory allocation in digital_in_send()

 net/nfc/digital_core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.13.0

