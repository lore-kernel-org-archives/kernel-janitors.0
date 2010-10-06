From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:19 +0000
Subject: [PATCH 04/28] Staging: comedi: comedidev.h: Edit file so that checkpatch.pl has 0 errors and warning
Message-Id: <1286326843-6170-4-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/comedi/comedidev.h |   34 +++++++++++++++++-----------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/comedi/comedidev.h b/drivers/staging/comedi/comedidev.h
index 68aa917..65a3559 100644
--- a/drivers/staging/comedi/comedidev.h
+++ b/drivers/staging/comedi/comedidev.h
@@ -1,23 +1,23 @@
 /*
-    include/linux/comedidev.h
-    header file for kernel-only structures, variables, and constants
+	include/linux/comedidev.h
+	header file for kernel-only structures, variables, and constants
 
-    COMEDI - Linux Control and Measurement Device Interface
-    Copyright (C) 1997-2000 David A. Schleef <ds@schleef.org>
+	COMEDI - Linux Control and Measurement Device Interface
+	Copyright (C) 1997-2000 David A. Schleef <ds@schleef.org>
 
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
 
@@ -253,8 +253,8 @@ void comedi_event(struct comedi_device *dev, struct comedi_subdevice *s);
 void comedi_error(const struct comedi_device *dev, const char *s);
 
 /* we can expand the number of bits used to encode devices/subdevices into
- the minor number soon, after more distros support > 8 bit minor numbers
- (like after Debian Etch gets released) */
+the minor number soon, after more distros support > 8 bit minor numbers
+(like after Debian Etch gets released) */
 enum comedi_minor_bits {
 	COMEDI_DEVICE_MINOR_MASK = 0xf,
 	COMEDI_SUBDEVICE_MINOR_MASK = 0xf0
-- 
1.7.3.1.50.g1e633

