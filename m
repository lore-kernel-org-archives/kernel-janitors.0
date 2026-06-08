Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8DF370ADF;
	Mon,  8 Jun 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922124; cv=none; b=eB/7gTxJNSUooYYjn/SkEPpajkcYxMPWkTOR2xqj8SM7yMlkAisMJb08hGkVRtMVkyP9B3dfwuOvojqHLZbU/Hjta7fvvoRQ2t4BiT61zWnuUDpGEaNAehXfp/WgbA7Ki4ZolNLzREg3ZAlthI1O2Jjf5NdY/jX6SG3uOO7ypMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922124; c=relaxed/simple;
	bh=pnTA6nqLxCmY0uEGvwj8HVNNcrrex2VvoSOTzOjnaJ4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WcfEG7knUh2+OcIWG+82L2Htw2sqLVxXEkwyvaXo8lwswU6gIgc6lsjDbdPqBVGlxa9kifIkt7mMfok75tJ+7NJzZNDnnOpkX1EiiindnaH7pKSw+kaC/8PXEPHhFZXVEb7wGyYeawVtPjlPWB4fCQAiKJInT1dqzOo9UP7/Jqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=O7WtC7A3; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="O7WtC7A3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780922114; x=1781526914; i=markus.elfring@web.de;
	bh=692VSWWI4JP1ZtvqjGtfjyNQg5z7+byiQ/6aWh3N3Io=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=O7WtC7A3G1fRD1zBFlLRUooQTJHZ2a4qZkFy3H6CmBox9nlaTAf8GgXR3t2OfX/k
	 nFvIUXSCxxVBFsA6ja3NMGvEn2YFr5DVAW5qFyLs7UgxHcsz2t9/HzdS5mEU7ZGbF
	 4LQ0Y0qBy8rbzgeEEUDZxfJlVUuVBdE+0CyxeTCvU33O+g2gwNxeyboXVzEJ2rumv
	 tt8HLKQG4iQQPcndR1aNFdCXQLDOgIJlWEuzTCMLuAZimKw5ZYd/9Go/izrJWNuZV
	 2EerlGne+c3SBVZnl0X8HplTNHHklHcLykdD5th+gcZbiIY/324N0UHvrX26bWzZ6
	 CkqguxNAodM5nU/NVg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Md6tr-1x5LiU3sRv-00ncQi; Mon, 08
 Jun 2026 14:35:13 +0200
Message-ID: <a65ed0db-6519-4665-bafc-1bb15752ff2f@web.de>
Date: Mon, 8 Jun 2026 14:35:11 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: ulpi: Use common error handling code in ulpi_register()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0PnpzhzUqU+KnRY854keaklHso4bGZMdUsN7Qksq/MNGrv8ihr6
 Knfzwl9eRQmvfXDwmH75XVfnxccwMzKyoDRt9NH3Afnqz6kuciJDwifM8d3JjVAcRWVQQML
 3Wz4R8WP2G3r8nIfIx3W3BHMMWSsRyztyFHE5vQn86/HnxzDS9Q6kQi6qYB+4q656R0xyDR
 o+gpURxAZRR+71LKUj0TQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VfKcc85oFO4=;CJyREhibvo+3czb7ZYp/n3nPTJP
 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
 BjeTBMvl8l3RBiNTlhOVgkwOIhA=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jun 2026 14:17:57 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

Cc: stable@vger.kernel.org
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/common/ulpi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index 9b69148128e5..1b9a4995903d 100644
=2D-- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -286,16 +286,13 @@ static int ulpi_register(struct device *dev, struct =
ulpi *ulpi)
 	ACPI_COMPANION_SET(&ulpi->dev, ACPI_COMPANION(dev));
=20
 	ret =3D ulpi_of_register(ulpi);
-	if (ret) {
-		kfree(ulpi);
-		return ret;
-	}
+	if (ret)
+		goto free_ulpi;
=20
 	ret =3D ulpi_read_id(ulpi);
 	if (ret) {
 		of_node_put(ulpi->dev.of_node);
-		kfree(ulpi);
-		return ret;
+		goto free_ulpi;
 	}
=20
 	ret =3D device_register(&ulpi->dev);
@@ -311,6 +308,10 @@ static int ulpi_register(struct device *dev, struct u=
lpi *ulpi)
 		ulpi->id.vendor, ulpi->id.product);
=20
 	return 0;
+
+free_ulpi:
+	kfree(ulpi);
+	return ret;
 }
=20
 /**
=2D-=20
2.54.0

