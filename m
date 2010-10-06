From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:38 +0000
Subject: [PATCH 23/28] Staging: comedi: drivers: adv_pci1723.c: Edit file so that checkpatch.pl has 0 warning
Message-Id: <1286326843-6170-23-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed a few lines that made checkpatch.pl complain. All were WARNING: please, no space before tabs and WARNING: unnecessary whitespace before a quoted newline.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/comedi/drivers/adv_pci1723.c |   52 +++++++++++++-------------
 1 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1723.c b/drivers/staging/comedi/drivers/adv_pci1723.c
index b133bb8..cbb62d4 100644
--- a/drivers/staging/comedi/drivers/adv_pci1723.c
+++ b/drivers/staging/comedi/drivers/adv_pci1723.c
@@ -1,22 +1,22 @@
 /*******************************************************************************
-   comedi/drivers/pci1723.c
+	comedi/drivers/pci1723.c
 
-   COMEDI - Linux Control and Measurement Device Interface
-   Copyright (C) 2000 David A. Schleef <ds@schleef.org>
+	COMEDI - Linux Control and Measurement Device Interface
+	Copyright (C) 2000 David A. Schleef <ds@schleef.org>
 
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2 of the License, or
-   (at your option) any later version.
+	This program is free software; you can redistribute it and/or modify
+	it under the terms of the GNU General Public License as published by
+	the Free Software Foundation; either version 2 of the License, or
+	(at your option) any later version.
 
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
+	This program is distributed in the hope that it will be useful,
+	but WITHOUT ANY WARRANTY; without even the implied warranty of
+	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+	GNU General Public License for more details.
 
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+	You should have received a copy of the GNU General Public License
+	along with this program; if not, write to the Free Software
+	Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 
 *******************************************************************************/
 /*
@@ -28,11 +28,11 @@ Updated: Mon, 14 Apr 2008 15:12:56 +0100
 Status: works
 
 Configuration Options:
-  [0] - PCI bus of device (optional)
-  [1] - PCI slot of device (optional)
+	[0] - PCI bus of device (optional)
+	1] - PCI slot of device (optional)
 
-  If bus/slot is not specified, the first supported
-  PCI device found will be used.
+	If bus/slot is not specified, the first supported
+	PCI device found will be used.
 
 Subdevice 0 is 8-channel AO, 16-bit, range +/- 10 V.
 
@@ -42,10 +42,10 @@ configures all channels in the same group.
 
 TODO:
 
-1. Add the two milliamp ranges to the AO subdevice (0 to 20 mA, 4 to 20 mA).
-2. Read the initial ranges and values of the AO subdevice at start-up instead
-   of reinitializing them.
-3. Implement calibration.
+1.Add the two milliamp ranges to the AO subdevice (0 to 20 mA, 4 to 20 mA).
+2.Read the initial ranges and values of the AO subdevice at start-up instead
+	of reinitializing them.
+3.Implement calibration.
 */
 
 #include "../comedidev.h"
@@ -235,7 +235,7 @@ static int pci1723_insn_read_ao(struct comedi_device *dev,
 	int n, chan;
 
 	chan = CR_CHAN(insn->chanspec);
-	DPRINTK(" adv_PCI1723 DEBUG: pci1723_insn_read_ao() ----- \n");
+	DPRINTK(" adv_PCI1723 DEBUG: pci1723_insn_read_ao() -----\n");
 	for (n = 0; n < insn->n; n++)
 		data[n] = devpriv->ao_data[chan];
 
@@ -243,7 +243,7 @@ static int pci1723_insn_read_ao(struct comedi_device *dev,
 }
 
 /*
-  analog data output;
+	analog data output;
 */
 static int pci1723_ao_write_winsn(struct comedi_device *dev,
 				  struct comedi_subdevice *s,
@@ -264,7 +264,7 @@ static int pci1723_ao_write_winsn(struct comedi_device *dev,
 }
 
 /*
-  digital i/o config/query
+	digital i/o config/query
 */
 static int pci1723_dio_insn_config(struct comedi_device *dev,
 				   struct comedi_subdevice *s,
@@ -305,7 +305,7 @@ static int pci1723_dio_insn_config(struct comedi_device *dev,
 }
 
 /*
-  digital i/o bits read/write
+	digital i/o bits read/write
 */
 static int pci1723_dio_insn_bits(struct comedi_device *dev,
 				 struct comedi_subdevice *s,
-- 
1.7.3.1.50.g1e633

