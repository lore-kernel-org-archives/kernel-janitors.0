Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C4641169F;
	Wed, 10 Jun 2026 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100759; cv=none; b=TWNyXY3fP794g2DsADKWc29fpfDK4tBa385ys7NNygu/EJSh3bYKsCAuVwRwkVuYLl1khaplyz41bnQ7zKLCrq7q6sZYiTw62zlG51qV4FdwENg4isng76BPOEUsWxnazDvm9+eFRi3RfygBEC12sPwzMe6F7ovGvfk0z1MmuSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100759; c=relaxed/simple;
	bh=Y6e4PIP+1unPd89FTdcHyy/SR3SaWeHNuSBR7wmrh2M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=a9pIZ3TyKacKXZOLtMiDslcU/6Huj+9qP1NcFLDFP0qjMxXgqtFaYxTscePty4/q4IfwU9vmyjf2eH8c90WbP4mT5TyzsHkxpWC+iZm2ufvmm6pijc0ekYI0SgCbCGexisxQQ7/EcZIFhIJgmxGENrhIVKrcaVIZR4Fg9LctFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZU0iX0O7; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZU0iX0O7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781100753; x=1781705553; i=markus.elfring@web.de;
	bh=+W1f2EzKeVQHT7CtAmT2Nlev0UALIQOpGwIy4aOQ2lc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZU0iX0O7a4jquClSNn1UB/hP6FOeB+KM1kj8yCug+XXihBDyOPruNk2mr0j7P6qz
	 nF3Y2FhzJoSH6iAmEBgfCiUFAk+3N1PMkMSTLtH/kOoFDle58fqRBUv6pG6EG+mZj
	 jg3J0YoPEnwYQUSO1tfECWxVaYFtQbqB5c6fgJiYm+53j401LXCM2dwY3w1VBr7NY
	 aLuRAXc4E+6Tj9/rWYegO7Qu3dExwXgMjWi3hhJ/0UfydKQ35I7y8Ywuc3srUFLfT
	 /dKsMtEhKcTzrVkB8RJ/kMaK3J2UIXXq6cQl804A7eU/5kG284WKScWsEdXtDOUGi
	 LsUBcE6cBDvNcnXTYw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9479-1xL70Y0koZ-00vUOu; Wed, 10
 Jun 2026 16:12:33 +0200
Message-ID: <188a2ea8-6bb6-46aa-883d-a1472b35217f@web.de>
Date: Wed, 10 Jun 2026 16:12:31 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Adrian Korwel <adriank20047@gmail.com>, Felix Gu <ustc.gu@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] USB: serial: io_ti: Use common error handling code in
 do_download_mode()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yf8hTMNuShJjI6Jhu88KU95qC2955U5rGmG3Fu8PoLwUwopj+Yd
 UCknzXLbam6MhRC6HxXpQdyL66yRbgQaRBRLyLr99Zx09kZMXa1aA9qzgI8D3ocjOj7JGns
 LLERzsmo/0DLzQQ2XUD4dMoSuMTPYFLqHT8fJuzB1/xCfi4HNS8gTTvgZxHfuCqGiQHoeKw
 GiX93Y8GdwDpoiduZn6Uw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tSI8IIGqSRs=;RB9j+jRHS1XPVTO067wBoDsX9ka
 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
 uIXSl+Tfq9joK24EFcFZAzvcfoY=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 16:00:06 +0200

Use additional labels so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/serial/io_ti.c | 133 ++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 82 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 07c0eff3bef4..a83e3dd1e5ab 100644
=2D-- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -1103,23 +1103,21 @@ static int do_download_mode(struct edgeport_serial=
 *serial,
 		return -ENOMEM;
=20
 	status =3D get_manuf_info(serial, (u8 *)ti_manuf_desc);
-	if (status) {
-		kfree(ti_manuf_desc);
-		return status;
-	}
+	if (status)
+		goto free_ti_manuf_desc;
=20
 	/* Check version number of ION descriptor */
 	if (!ignore_cpu_rev && ti_cpu_rev(ti_manuf_desc) < 2) {
 		dev_dbg(dev, "%s - Wrong CPU Rev %d (Must be 2)\n",
 			__func__, ti_cpu_rev(ti_manuf_desc));
-		kfree(ti_manuf_desc);
-		return -EINVAL;
+		status =3D -EINVAL;
+		goto free_ti_manuf_desc;
 	}
=20
 	rom_desc =3D kmalloc_obj(*rom_desc);
 	if (!rom_desc) {
-		kfree(ti_manuf_desc);
-		return -ENOMEM;
+		status =3D -ENOMEM;
+		goto free_ti_manuf_desc;
 	}
=20
 	/* Search for type 2 record (firmware record) */
@@ -1133,11 +1131,8 @@ static int do_download_mode(struct edgeport_serial =
*serial,
 				__func__);
=20
 		firmware_version =3D kmalloc_obj(*firmware_version);
-		if (!firmware_version) {
-			kfree(rom_desc);
-			kfree(ti_manuf_desc);
-			return -ENOMEM;
-		}
+		if (!firmware_version)
+			goto e_nomem;
=20
 		/*
 		 * Validate version number
@@ -1147,12 +1142,8 @@ static int do_download_mode(struct edgeport_serial =
*serial,
 				sizeof(struct ti_i2c_desc),
 				sizeof(struct ti_i2c_firmware_rec),
 				(u8 *)firmware_version);
-		if (status) {
-			kfree(firmware_version);
-			kfree(rom_desc);
-			kfree(ti_manuf_desc);
-			return status;
-		}
+		if (status)
+			goto free_firmware_version;
=20
 		/*
 		 * Check version number of download with current
@@ -1182,10 +1173,8 @@ static int do_download_mode(struct edgeport_serial =
*serial,
=20
 			record =3D kmalloc(1, GFP_KERNEL);
 			if (!record) {
-				kfree(firmware_version);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return -ENOMEM;
+				status =3D -ENOMEM;
+				goto free_firmware_version;
 			}
 			/*
 			 * In order to update the I2C firmware we must
@@ -1208,13 +1197,8 @@ static int do_download_mode(struct edgeport_serial =
*serial,
 			 */
 			status =3D write_rom(serial, start_address,
 					sizeof(*record), record);
-			if (status) {
-				kfree(record);
-				kfree(firmware_version);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return status;
-			}
+			if (status)
+				goto free_record;
=20
 			/*
 			 * verify the write -- must do this in order
@@ -1225,22 +1209,13 @@ static int do_download_mode(struct edgeport_serial=
 *serial,
 						start_address,
 						sizeof(*record),
 						record);
-			if (status) {
-				kfree(record);
-				kfree(firmware_version);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return status;
-			}
+			if (status)
+				goto free_record;
=20
 			if (*record !=3D I2C_DESC_TYPE_FIRMWARE_BLANK) {
 				dev_err(dev, "%s - error resetting device\n",
 						__func__);
-				kfree(record);
-				kfree(firmware_version);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return -ENODEV;
+				goto e_nodev;
 			}
=20
 			dev_dbg(dev, "%s - HARDWARE RESET\n", __func__);
@@ -1255,11 +1230,7 @@ static int do_download_mode(struct edgeport_serial =
*serial,
 					__func__, status);
=20
 			/* return an error on purpose. */
-			kfree(record);
-			kfree(firmware_version);
-			kfree(rom_desc);
-			kfree(ti_manuf_desc);
-			return -ENODEV;
+			goto e_nodev;
 		}
 		/* Same or newer fw version is already loaded */
 		serial->fw_version =3D download_cur_ver;
@@ -1276,18 +1247,13 @@ static int do_download_mode(struct edgeport_serial=
 *serial,
 			u8 *vheader;
=20
 			header =3D kmalloc(HEADER_SIZE, GFP_KERNEL);
-			if (!header) {
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return -ENOMEM;
-			}
+			if (!header)
+				goto e_nomem;
=20
 			vheader =3D kmalloc(HEADER_SIZE, GFP_KERNEL);
 			if (!vheader) {
 				kfree(header);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return -ENOMEM;
+				goto e_nomem;
 			}
=20
 			dev_dbg(dev, "%s - Found Type BLANK FIRMWARE (Type F2) record\n",
@@ -1305,13 +1271,8 @@ static int do_download_mode(struct edgeport_serial =
*serial,
 			 * record type from 0xf2 to 0x02.
 			 */
 			status =3D build_i2c_fw_hdr(header, fw);
-			if (status) {
-				kfree(vheader);
-				kfree(header);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return -EINVAL;
-			}
+			if (status)
+				goto e_inval;
=20
 			/*
 			 * Update I2C with type 0xf2 record with correct
@@ -1321,13 +1282,8 @@ static int do_download_mode(struct edgeport_serial =
*serial,
 						start_address,
 						HEADER_SIZE,
 						header);
-			if (status) {
-				kfree(vheader);
-				kfree(header);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return -EINVAL;
-			}
+			if (status)
+				goto e_inval;
=20
 			/*
 			 * verify the write -- must do this in order for
@@ -1339,20 +1295,12 @@ static int do_download_mode(struct edgeport_serial=
 *serial,
 			if (status) {
 				dev_dbg(dev, "%s - can't read header back\n",
 						__func__);
-				kfree(vheader);
-				kfree(header);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return status;
+				goto free_vheader;
 			}
 			if (memcmp(vheader, header, HEADER_SIZE)) {
 				dev_dbg(dev, "%s - write download record failed\n",
 						__func__);
-				kfree(vheader);
-				kfree(header);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return -EINVAL;
+				goto e_inval;
 			}
=20
 			kfree(vheader);
@@ -1372,9 +1320,7 @@ static int do_download_mode(struct edgeport_serial *=
serial,
 				dev_err(dev,
 					"%s - UMPC_COPY_DNLD_TO_I2C failed\n",
 					__func__);
-				kfree(rom_desc);
-				kfree(ti_manuf_desc);
-				return status;
+				goto free_rom_desc;
 			}
 		}
 	}
@@ -1383,6 +1329,29 @@ static int do_download_mode(struct edgeport_serial =
*serial,
 	kfree(rom_desc);
 	kfree(ti_manuf_desc);
 	return 0;
+
+e_inval:
+	status =3D -EINVAL;
+free_vheader:
+	kfree(vheader);
+	kfree(header);
+	goto free_rom_desc;
+
+e_nomem:
+	status =3D -ENOMEM;
+	goto free_rom_desc;
+
+e_nodev:
+	status =3D -ENODEV;
+free_record:
+	kfree(record);
+free_firmware_version:
+	kfree(firmware_version);
+free_rom_desc:
+	kfree(rom_desc);
+free_ti_manuf_desc:
+	kfree(ti_manuf_desc);
+	return status;
 }
=20
 static int do_boot_mode(struct edgeport_serial *serial,
=2D-=20
2.54.0

