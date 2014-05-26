From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:21:09 +0000
Subject: [PATCH 0/18] Use kmemdup instead of kmalloc + memcpy
Message-Id: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org
Cc: benoit.taine@lip6.fr, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, linux-scsi@vger.kernel.org, DL-MPTFusionLinux@lsi.com, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

These patches enhance kernel style usage, and allows smaller code while
preventing accidental code edits to produce overflows.

The semantic patch at scripts/coccinelle/api/memdup.cocci was used to
detect and edit this situation.
