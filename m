From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:08:55 +0000
Subject: [PATCH 00/10] firewire-net: Fine-tuning for several function implementations
Message-Id: <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 08:04:02 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (10):
  Use kmalloc_array() in fwnet_broadcast_start()
  Rename a jump label in fwnet_broadcast_start()
  Rename jump labels in fwnet_init()
  Rename jump labels in fwnet_probe()
  Rename a jump label in fwnet_tx()
  Rename a jump label in fwnet_send_packet()
  Rename a jump label in fwnet_incoming_packet()
  Rename a jump label in fwnet_finish_incoming_packet()
  Rename jump labels in fwnet_pd_new()
  Adjust checks for null pointers in five functions

 drivers/firewire/net.c | 94 +++++++++++++++++++++++---------------------------
 1 file changed, 44 insertions(+), 50 deletions(-)

-- 
2.10.0

