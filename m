From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:21 +0000
Subject: [PATCH 06/28] Staging: comedi: comedilib.h: Edit file so that checkpatch.pl has 0 errors and warning
Message-Id: <1286326843-6170-6-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/comedi/comedilib.h |   30 +++++++++++++++---------------
 1 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/comedi/comedilib.h b/drivers/staging/comedi/comedilib.h
index ca92c43..8a699c5 100644
--- a/drivers/staging/comedi/comedilib.h
+++ b/drivers/staging/comedi/comedilib.h
@@ -1,23 +1,23 @@
 /*
-    linux/include/comedilib.h
-    header file for kcomedilib
+	linux/include/comedilib.h
+	header file for kcomedilib
 
-    COMEDI - Linux Control and Measurement Device Interface
-    Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
+	COMEDI - Linux Control and Measurement Device Interface
+	Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
 
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
 
-- 
1.7.3.1.50.g1e633

