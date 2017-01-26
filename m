From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 21:44:44 +0000
Subject: [PATCH 0/3] Virtio: Fine-tuning for two function implementations
Message-Id: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 22:40:02 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  virtio_pci: Use kcalloc() in vp_request_msix_vectors()
  virtio_pci: Use kmalloc_array() in vp_request_msix_vectors()
  virtio_ring: Use kmalloc_array() in alloc_indirect()

 drivers/virtio/virtio_pci_common.c | 8 ++++----
 drivers/virtio/virtio_ring.c       | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.11.0

