From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 12:10:05 +0000
Subject: [PATCH 0/4] block-virtio: Fine-tuning for two function implementations
Message-Id: <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 14:05:05 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use kmalloc_array() in init_vq()
  Less function calls in init_vq() after error detection
  Delete an unnecessary initialisation in init_vq()
  Rename a jump label in virtblk_get_id()

 drivers/block/virtio_blk.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

-- 
2.10.0

