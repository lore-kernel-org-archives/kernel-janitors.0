From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 24 Sep 2005 15:55:52 +0000
Subject: [KJ] hint, hint...
Message-Id: <20050924155552.GA31609@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80116291970751308=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80116291970751308==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TODO already updated. ;-)

--- a/drivers/ide/pci/piix.c
+++ b/drivers/ide/pci/piix.c
@@ -542,10 +542,9 @@ static void __devinit init_hwif_piix(ide
 	}
 
 static ide_pci_device_t piix_pci_info[] __devinitdata = {
-	/*  0 */ DECLARE_PIIX_DEV("PIIXa"),
-	/*  1 */ DECLARE_PIIX_DEV("PIIXb"),
-
-	{	/* 2 */
+	[ 0] = DECLARE_PIIX_DEV("PIIXa"),
+	[ 1] = DECLARE_PIIX_DEV("PIIXb"),
+	[ 2] = {
 		.name		= "MPIIX",
 		.init_hwif	= init_hwif_piix,
 		.channels	= 2,
@@ -553,28 +552,27 @@ static ide_pci_device_t piix_pci_info[] 
 		.enablebits	= {{0x6D,0x80,0x80}, {0x6F,0x80,0x80}},
 		.bootable	= ON_BOARD,
 	},
-
-	/*  3 */ DECLARE_PIIX_DEV("PIIX3"),
-	/*  4 */ DECLARE_PIIX_DEV("PIIX4"),
-	/*  5 */ DECLARE_PIIX_DEV("ICH0"),
-	/*  6 */ DECLARE_PIIX_DEV("PIIX4"),
-	/*  7 */ DECLARE_PIIX_DEV("ICH"),
-	/*  8 */ DECLARE_PIIX_DEV("PIIX4"),
-	/*  9 */ DECLARE_PIIX_DEV("PIIX4"),
-	/* 10 */ DECLARE_PIIX_DEV("ICH2"),
-	/* 11 */ DECLARE_PIIX_DEV("ICH2M"),
-	/* 12 */ DECLARE_PIIX_DEV("ICH3M"),
-	/* 13 */ DECLARE_PIIX_DEV("ICH3"),
-	/* 14 */ DECLARE_PIIX_DEV("ICH4"),
-	/* 15 */ DECLARE_PIIX_DEV("ICH5"),
-	/* 16 */ DECLARE_PIIX_DEV("C-ICH"),
-	/* 17 */ DECLARE_PIIX_DEV("ICH4"),
-	/* 18 */ DECLARE_PIIX_DEV("ICH5-SATA"),
-	/* 19 */ DECLARE_PIIX_DEV("ICH5"),
-	/* 20 */ DECLARE_PIIX_DEV("ICH6"),
-	/* 21 */ DECLARE_PIIX_DEV("ICH7"),
-	/* 22 */ DECLARE_PIIX_DEV("ICH4"),
-	/* 23 */ DECLARE_PIIX_DEV("ESB2"),
+	[ 3] = DECLARE_PIIX_DEV("PIIX3"),
+	[ 4] = DECLARE_PIIX_DEV("PIIX4"),
+	[ 5] = DECLARE_PIIX_DEV("ICH0"),
+	[ 6] = DECLARE_PIIX_DEV("PIIX4"),
+	[ 7] = DECLARE_PIIX_DEV("ICH"),
+	[ 8] = DECLARE_PIIX_DEV("PIIX4"),
+	[ 9] = DECLARE_PIIX_DEV("PIIX4"),
+	[10] = DECLARE_PIIX_DEV("ICH2"),
+	[11] = DECLARE_PIIX_DEV("ICH2M"),
+	[12] = DECLARE_PIIX_DEV("ICH3M"),
+	[13] = DECLARE_PIIX_DEV("ICH3"),
+	[14] = DECLARE_PIIX_DEV("ICH4"),
+	[15] = DECLARE_PIIX_DEV("ICH5"),
+	[16] = DECLARE_PIIX_DEV("C-ICH"),
+	[17] = DECLARE_PIIX_DEV("ICH4"),
+	[18] = DECLARE_PIIX_DEV("ICH5-SATA"),
+	[19] = DECLARE_PIIX_DEV("ICH5"),
+	[20] = DECLARE_PIIX_DEV("ICH6"),
+	[21] = DECLARE_PIIX_DEV("ICH7"),
+	[22] = DECLARE_PIIX_DEV("ICH4"),
+	[23] = DECLARE_PIIX_DEV("ESB2"),
 };
 
 /**


--===============80116291970751308==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80116291970751308==--
