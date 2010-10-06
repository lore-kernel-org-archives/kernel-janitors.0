From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:41 +0000
Subject: [PATCH 26/28] Staging: comedi: drivers: aio_iiro_16.c: Edit file so that checkpatch.pl has 0 errors
Message-Id: <1286326843-6170-26-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed a few lines that made checkpatch.pl complain. All warnings were
WARNING: please, no space for starting a line.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/comedi/drivers/aio_iiro_16.c |   32 +++++++++++++-------------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/comedi/drivers/aio_iiro_16.c b/drivers/staging/comedi/drivers/aio_iiro_16.c
index 4875995..d0b9800 100644
--- a/drivers/staging/comedi/drivers/aio_iiro_16.c
+++ b/drivers/staging/comedi/drivers/aio_iiro_16.c
@@ -1,23 +1,23 @@
 /*
 
-    comedi/drivers/aio_iiro_16.c
+	comedi/drivers/aio_iiro_16.c
 
-    Driver for Acces I/O Products PC-104 AIO-IIRO-16 Digital I/O board
-    Copyright (C) 2006 C&C Technologies, Inc.
+	Driver for Acces I/O Products PC-104 AIO-IIRO-16 Digital I/O board
+	Copyright (C) 2006 C&C Technologies, Inc.
 
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
+	This program is free software; you can redistribute it and/or modify
+	it under the terms of the GNU General Public License as published by
+	the Free Software Foundation; either version 2 of the License, or
+	(at your option) any later version.
 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
+	This program is distributed in the hope that it will be useful,
+	but WITHOUT ANY WARRANTY; without even the implied warranty of
+	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+	GNU General Public License for more details.
 
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+	You should have received a copy of the GNU General Public License
+	along with this program; if not, write to the Free Software
+	Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */
 
 /*
@@ -26,11 +26,11 @@ Driver: aio_iiro_16
 Description: Acces I/O Products PC-104 IIRO16 Relay And Isolated Input Board
 Author: Zachary Ware <zach.ware@cctechnol.com>
 Devices:
- [Acces I/O] PC-104 AIO12-8
+	[Acces I/O] PC-104 AIO12-8
 Status: experimental
 
 Configuration Options:
-  [0] - I/O port base address
+	[0] - I/O port base address
 
 */
 
-- 
1.7.3.1.50.g1e633

