From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:20:10 +0000
Subject: [PATCH 00/13] DRBD-receiver: Fine-tuning for six function implementations
Message-Id: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 22:13:22 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (13):
  Use kmalloc_array() in receive_uuids()
  Delete an error message for a failed kmalloc_array() call
  Move an assignment in receive_uuids()
  Improve a size determination in drbd_do_features()
  Delete an unnecessary initialisation in receive_sizes()
  Improve a size determination in receive_sizes()
  Delete an error message for a failed kzalloc() call in receive_sizes()
  Move an assignment in receive_sizes()
  Improve determination of sizes in receive_SyncParam()
  Delete error messages for failed resource allocations in receive_SyncParam()
  Improve a size determination in receive_protocol()
  Delete error messages for failed resource allocations in receive_protocol()
  Improve determination of sizes in receive_Barrier()

 drivers/block/drbd/drbd_receiver.c | 45 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

-- 
2.10.0

