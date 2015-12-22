From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 15:48:33 +0000
Subject: [PATCH v2 0/2] USB-FHCI: Use return type "int" for two functions
Message-Id: <567970D1.3030503@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675BAE0.2010304@users.sourceforge.net>
 <20151219202706.GT5284@mwanda>
In-Reply-To: <20151219202706.GT5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 16:43:12 +0100

Another update suggestion was taken into account after a patch was applied
from static source code analysis.

Markus Elfring (2):
  Use a signed return type for fhci_create_ep()
  Use a signed return type for endpoint_zero_init()

 drivers/usb/host/fhci-hcd.c | 4 ++--
 drivers/usb/host/fhci-tds.c | 2 +-
 drivers/usb/host/fhci.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.6.3

