From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:16 +0000
Subject: [PATCH 01/28] Staging: comedi: comedi.h: Edit file so cleanpatch.pl has 0 errors and warnings
Message-Id: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed lines in the file so that checkpatch.pl wont complain. Fixed every warning/error message such as; WARNING: storage class should be at the beginning of the declaration, WARNING: please, no space for starting a line, and last but not least WARNING: line over 80 characters.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/comedi/comedi.h |   78 ++++++++++++++++++++-------------------
 1 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/comedi/comedi.h b/drivers/staging/comedi/comedi.h
index 6c900e2..680cef8 100644
--- a/drivers/staging/comedi/comedi.h
+++ b/drivers/staging/comedi/comedi.h
@@ -1,23 +1,23 @@
 /*
-    include/comedi.h (installed as /usr/include/comedi.h)
-    header file for comedi
+	include/comedi.h (installed as /usr/include/comedi.h)
+	header file for comedi
 
-    COMEDI - Linux Control and Measurement Device Interface
-    Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
+	COMEDI - Linux Control and Measurement Device Interface
+	Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
 
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU Lesser General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
+	This program is free software; you can redistribute it and/or modify
+	it under the terms of the GNU Lesser General Public License as published
+	by the Free Software Foundation; either version 2 of the License, or
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
 
@@ -33,9 +33,9 @@
 #define COMEDI_MAJOR 98
 
 /*
-   maximum number of minor devices.  This can be increased, although
-   kernel structures are currently statically allocated, thus you
-   don't want this to be much more than you actually use.
+	maximum number of minor devices.  This can be increased, although
+	kernel structures are currently statically allocated, thus you
+	don't want this to be much more than you actually use.
  */
 #define COMEDI_NDEVICES 16
 
@@ -477,21 +477,21 @@
 /**********************************************************/
 
 /*
-  8254 specific configuration.
+	8254 specific configuration.
 
-  It supports two config commands:
+	It supports two config commands:
 
-  0 ID: INSN_CONFIG_SET_COUNTER_MODE
-  1 8254 Mode
-    I8254_MODE0, I8254_MODE1, ..., I8254_MODE5
-    OR'ed with:
-    I8254_BCD, I8254_BINARY
+	0 ID: INSN_CONFIG_SET_COUNTER_MODE
+	1 8254 Mode
+		I8254_MODE0, I8254_MODE1, ..., I8254_MODE5
+		OR'ed with:
+		I8254_BCD, I8254_BINARY
 
-  0 ID: INSN_CONFIG_8254_READ_STATUS
-  1 <-- Status byte returned here.
-    B7 = Output
-    B6 = NULL Count
-    B5 - B0 Current mode.
+	0 ID: INSN_CONFIG_8254_READ_STATUS
+	1 <-- Status byte returned here.
+		B7 = Output
+		B6 = NULL Count
+		B5 - B0 Current mode.
 
 */
 
@@ -514,7 +514,9 @@
 			return 0x1 + pfi_channel;
 		else
 			return 0xb + pfi_channel;
-	} static inline unsigned NI_USUAL_RTSI_SELECT(unsigned rtsi_channel) {
+	}
+	static inline unsigned NI_USUAL_RTSI_SELECT(unsigned rtsi_channel)
+	{
 		if (rtsi_channel < 7)
 			return 0xb + rtsi_channel;
 		else
@@ -736,8 +738,8 @@ INSN_CONFIG_ARM */
 	}
 
 /* Signals which can be routed to an NI RTSI pin with INSN_CONFIG_SET_ROUTING.
- The numbers assigned are not arbitrary, they correspond to the bits required
- to program the board. */
+The numbers assigned are not arbitrary, they correspond to the bits required
+to program the board. */
 	enum ni_rtsi_routing {
 		NI_RTSI_OUTPUT_ADR_START1 = 0,
 		NI_RTSI_OUTPUT_ADR_START2 = 1,
@@ -793,11 +795,11 @@ INSN_CONFIG_ARM */
 	}
 
 /* Signals which can be routed to output on a NI PFI pin on a 660x board
- with INSN_CONFIG_SET_ROUTING.  The numbers assigned are
- not arbitrary, they correspond to the bits required
- to program the board.  Lines 0 to 7 can only be set to
- NI_660X_PFI_OUTPUT_DIO.  Lines 32 to 39 can only be set to
- NI_660X_PFI_OUTPUT_COUNTER. */
+with INSN_CONFIG_SET_ROUTING.  The numbers assigned are
+not arbitrary, they correspond to the bits required
+to program the board.  Lines 0 to 7 can only be set to
+NI_660X_PFI_OUTPUT_DIO.  Lines 32 to 39 can only be set to
+NI_660X_PFI_OUTPUT_COUNTER. */
 	enum ni_660x_pfi_routing {
 		NI_660X_PFI_OUTPUT_COUNTER = 1,	/* counter */
 		NI_660X_PFI_OUTPUT_DIO = 2,	/* static digital output */
-- 
1.7.3.1.50.g1e633

