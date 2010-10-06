From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:40 +0000
Subject: [PATCH 25/28] Staging: comedi: drivers: aio_aio12_8.c: Edit file so that checkpatch.pl has 0 errors
Message-Id: <1286326843-6170-25-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/comedi/drivers/aio_aio12_8.c |   34 +++++++++++++-------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/comedi/drivers/aio_aio12_8.c b/drivers/staging/comedi/drivers/aio_aio12_8.c
index 1728cc0..64369be 100644
--- a/drivers/staging/comedi/drivers/aio_aio12_8.c
+++ b/drivers/staging/comedi/drivers/aio_aio12_8.c
@@ -1,23 +1,23 @@
 /*
 
-    comedi/drivers/aio_aio12_8.c
+	comedi/drivers/aio_aio12_8.c
 
-    Driver for Acces I/O Products PC-104 AIO12-8 Analog I/O Board
-    Copyright (C) 2006 C&C Technologies, Inc.
+	Driver for Acces I/O Products PC-104 AIO12-8 Analog I/O Board
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
@@ -26,15 +26,15 @@ Driver: aio_aio12_8
 Description: Acces I/O Products PC-104 AIO12-8 Analog I/O Board
 Author: Pablo Mejia <pablo.mejia@cctechnol.com>
 Devices:
- [Acces I/O] PC-104 AIO12-8
+	[Acces I/O] PC-104 AIO12-8
 Status: experimental
 
 Configuration Options:
-  [0] - I/O port base address
+	[0] - I/O port base address
 
 Notes:
 
-  Only synchronous operations are supported.
+	Only synchronous operations are supported.
 
 */
 
-- 
1.7.3.1.50.g1e633

