From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2021 13:19:14 +0000
Subject: [PATCH] staging: vchiq: delete obselete comment
Message-Id: <X/RnUjY3XkZohk7w@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Arnd Bergmann <arnd@arndb.de>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Amarjargal Gundjalam <amarjargal16@gmail.com>, Phil Elwell <phil@raspberrypi.com>

This comment describes a security problem which was fixed in commit
1c954540c0eb ("staging: vchiq: avoid mixing kernel and user pointers").
The bug is fixed now so the FIXME can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f500a7043805..54770a9b4735 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -999,13 +999,6 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		userdata = &waiter->bulk_waiter;
 	}
 
-	/*
-	 * FIXME address space mismatch:
-	 * args->data may be interpreted as a kernel pointer
-	 * in create_pagelist() called from vchiq_bulk_transfer(),
-	 * accessing kernel data instead of user space, based on the
-	 * address.
-	 */
 	status = vchiq_bulk_transfer(args->handle, NULL, args->data, args->size,
 				     userdata, args->mode, dir);
 
-- 
2.29.2
