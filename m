From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 14:30:15 +0000
Subject: [PATCH 0/2] vhost/scsi: Adjustments for five function implementations
Message-Id: <bafa65e4-08fe-efdb-d836-7657e8a64749@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 16:25:04 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Improve a size determination in four functions
  Delete error messages for failed memory allocations in five functions

 drivers/vhost/scsi.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

-- 
2.13.0

