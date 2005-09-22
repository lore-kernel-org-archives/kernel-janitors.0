From: Jesse Millan <jesse.millan@gmail.com>
Date: Thu, 22 Sep 2005 22:06:04 +0000
Subject: [KJ] [PATCH] BusLogic: eliminate deprecated check_region() calls
Message-Id: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-5-943193090"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-5-943193090
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed


This patch eliminates the deprecated calls to check_region(). They  
are replaced with request_region(). New version is  a little more  
wordy due to the fact that requst_region() cannot be easily compacted  
into the ? operator.

(BusLogic.c was not changed between 2.6.14-rc1.kj and 2.6.14-rc2.kj)



--Apple-Mail-5-943193090
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="deprecated_check_region_BusLogic.patch"
Content-Disposition: attachment;
	filename=deprecated_check_region_BusLogic.patch

This patch eliminates the deprecated calls to check_region(). It's replaced
with request_region(). New version is  a little more wordy due to the fact that
requst_region() cannot be easily compacted into the ? operator.

Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/scsi/BusLogic.c |  133 ++++++++++++++++++++++++++++++++++++++----------
 1 files changed, 107 insertions(+), 26 deletions(-)

diff -puN drivers/scsi/BusLogic.c~deprecated_check_region_BusLogic drivers/scsi/BusLogic.c
--- linux-2.6.14-rc1/drivers/scsi/BusLogic.c~deprecated_check_region_BusLogic	2005-09-22 15:02:00.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/scsi/BusLogic.c	2005-09-22 15:02:15.000000000 -0700
@@ -582,18 +582,45 @@ static void __init BusLogic_InitializePr
 	/*
 	   Append the list of standard BusLogic MultiMaster ISA I/O Addresses.
 	 */
-	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe330 : check_region(0x330, BusLogic_MultiMasterAddressCount) == 0)
-		BusLogic_AppendProbeAddressISA(0x330);
-	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe334 : check_region(0x334, BusLogic_MultiMasterAddressCount) == 0)
-		BusLogic_AppendProbeAddressISA(0x334);
-	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe230 : check_region(0x230, BusLogic_MultiMasterAddressCount) == 0)
-		BusLogic_AppendProbeAddressISA(0x230);
-	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe234 : check_region(0x234, BusLogic_MultiMasterAddressCount) == 0)
-		BusLogic_AppendProbeAddressISA(0x234);
-	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe130 : check_region(0x130, BusLogic_MultiMasterAddressCount) == 0)
-		BusLogic_AppendProbeAddressISA(0x130);
-	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe134 : check_region(0x134, BusLogic_MultiMasterAddressCount) == 0)
-		BusLogic_AppendProbeAddressISA(0x134);
+        if (BusLogic_ProbeOptions.LimitedProbeISA) {
+                if (BusLogic_ProbeOptions.Probe330)
+                        BusLogic_AppendProbeAddressISA(0x330);
+                if (BusLogic_ProbeOptions.Probe334)
+                        BusLogic_AppendProbeAddressISA(0x334);
+                if (BusLogic_ProbeOptions.Probe230)
+                        BusLogic_AppendProbeAddressISA(0x230);
+                if (BusLogic_ProbeOptions.Probe234)
+                        BusLogic_AppendProbeAddressISA(0x234);
+                if (BusLogic_ProbeOptions.Probe130)
+                        BusLogic_AppendProbeAddressISA(0x130);
+                if (BusLogic_ProbeOptions.Probe134)
+                        BusLogic_AppendProbeAddressISA(0x134);
+        } else {
+                if (request_region(0x330, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+                        BusLogic_AppendProbeAddressISA(0x330);
+                        release_region(0x330, BusLogic_MultiMasterAddressCount);
+                }
+                if (request_region(0x334, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+                        BusLogic_AppendProbeAddressISA(0x334);
+                        release_region(0x334, BusLogic_MultiMasterAddressCount);
+                }
+                if (request_region(0x230, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+			BusLogic_AppendProbeAddressISA(0x230);
+			release_region(0x230, BusLogic_MultiMasterAddressCount);
+		}
+                if (request_region(0x234, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+			BusLogic_AppendProbeAddressISA(0x234);
+			release_region(0x234, BusLogic_MultiMasterAddressCount);
+		}
+                if (request_region(0x130, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+			BusLogic_AppendProbeAddressISA(0x130);
+			release_region(0x130, BusLogic_MultiMasterAddressCount);
+		}
+                if (request_region(0x134, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+			BusLogic_AppendProbeAddressISA(0x134);
+			release_region(0x134, BusLogic_MultiMasterAddressCount);
+		}
+	}
 }
 
 
@@ -798,26 +825,80 @@ static int __init BusLogic_InitializeMul
 	   host adapters are probed.
 	 */
 	if (!BusLogic_ProbeOptions.NoProbeISA)
-		if (PrimaryProbeInfo->IO_Address == 0 && (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe330 : check_region(0x330, BusLogic_MultiMasterAddressCount) == 0)) {
-			PrimaryProbeInfo->HostAdapterType = BusLogic_MultiMaster;
-			PrimaryProbeInfo->HostAdapterBusType = BusLogic_ISA_Bus;
-			PrimaryProbeInfo->IO_Address = 0x330;
+		if (PrimaryProbeInfo->IO_Address == 0) {
+			if (BusLogic_ProbeOptions.LimitedProbeISA) {
+				if (BusLogic_ProbeOptions.Probe330) {
+					/* BusLogic_ProbeOptions.LimitedProbeISA && BusLogic_ProbeOptions.Probe330 */
+					PrimaryProbeInfo->HostAdapterType = BusLogic_MultiMaster;
+					PrimaryProbeInfo->HostAdapterBusType = BusLogic_ISA_Bus;
+					PrimaryProbeInfo->IO_Address = 0x330;
+				}
+			} else {
+				if (request_region(0x330, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+					/* BusLogic_ProbeOptions.LimitedProbeISA && request_region */
+					release_region(0x330, BusLogic_MultiMasterAddressCount);
+					PrimaryProbeInfo->HostAdapterType = BusLogic_MultiMaster;
+					PrimaryProbeInfo->HostAdapterBusType = BusLogic_ISA_Bus;
+					PrimaryProbeInfo->IO_Address = 0x330;
+				}
+			}
 		}
+
 	/*
 	   Append the list of standard BusLogic MultiMaster ISA I/O Addresses,
 	   omitting the Primary I/O Address which has already been handled.
 	 */
 	if (!BusLogic_ProbeOptions.NoProbeISA) {
-		if (!StandardAddressSeen[1] && (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe334 : check_region(0x334, BusLogic_MultiMasterAddressCount) == 0))
-			BusLogic_AppendProbeAddressISA(0x334);
-		if (!StandardAddressSeen[2] && (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe230 : check_region(0x230, BusLogic_MultiMasterAddressCount) == 0))
-			BusLogic_AppendProbeAddressISA(0x230);
-		if (!StandardAddressSeen[3] && (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe234 : check_region(0x234, BusLogic_MultiMasterAddressCount) == 0))
-			BusLogic_AppendProbeAddressISA(0x234);
-		if (!StandardAddressSeen[4] && (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe130 : check_region(0x130, BusLogic_MultiMasterAddressCount) == 0))
-			BusLogic_AppendProbeAddressISA(0x130);
-		if (!StandardAddressSeen[5] && (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe134 : check_region(0x134, BusLogic_MultiMasterAddressCount) == 0))
-			BusLogic_AppendProbeAddressISA(0x134);
+		if (!StandardAddressSeen[1]) {
+			if(BusLogic_ProbeOptions.LimitedProbeISA) {
+				if(BusLogic_ProbeOptions.Probe334)
+					BusLogic_AppendProbeAddressISA(0x334);
+				else if(request_region(0x334, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+					release_region(0x334, BusLogic_MultiMasterAddressCount);
+					BusLogic_AppendProbeAddressISA(0x334);
+				}
+			}
+		}
+		if (!StandardAddressSeen[2]) {
+			if(BusLogic_ProbeOptions.LimitedProbeISA) {
+				if(BusLogic_ProbeOptions.Probe334)
+					BusLogic_AppendProbeAddressISA(0x230);
+				else if(request_region(0x230, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+					release_region(0x230, BusLogic_MultiMasterAddressCount);
+					BusLogic_AppendProbeAddressISA(0x230);
+				}
+			}
+		}
+		if (!StandardAddressSeen[3]) {
+			if(BusLogic_ProbeOptions.LimitedProbeISA) {
+				if(BusLogic_ProbeOptions.Probe334)
+					BusLogic_AppendProbeAddressISA(0x234);
+				else if(request_region(0x234, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+					release_region(0x234, BusLogic_MultiMasterAddressCount);
+					BusLogic_AppendProbeAddressISA(0x234);
+				}
+			}
+		}
+		if (!StandardAddressSeen[4]) {
+			if(BusLogic_ProbeOptions.LimitedProbeISA) {
+				if(BusLogic_ProbeOptions.Probe334)
+					BusLogic_AppendProbeAddressISA(0x130);
+				else if(request_region(0x130, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+					release_region(0x130, BusLogic_MultiMasterAddressCount);
+					BusLogic_AppendProbeAddressISA(0x130);
+				}
+			}
+		}
+		if (!StandardAddressSeen[5]) {
+			if(BusLogic_ProbeOptions.LimitedProbeISA) {
+				if(BusLogic_ProbeOptions.Probe334)
+					BusLogic_AppendProbeAddressISA(0x134);
+				else if(request_region(0x134, BusLogic_MultiMasterAddressCount, "BusLogic")) {
+					release_region(0x134, BusLogic_MultiMasterAddressCount);
+					BusLogic_AppendProbeAddressISA(0x134);
+				}
+			}
+		}
 	}
 	/*
 	   Iterate over the older non-compliant MultiMaster PCI Host Adapters,
_

--Apple-Mail-5-943193090
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-5-943193090--
