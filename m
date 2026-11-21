Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278794;
	b=g8D0M9x7xhiZ66bXI+jYTxSzrYPdYeEEJS1i5HyJrYndqkkXLYJfwRSUVqMeLehlXv1j
	 6ZlxgfX7HbrtpncBRF2BuyUEfwU1oToLBSFsrHDfgDfGbXNmafInMBa5pSEB5nG6yOr3I
	 cFm0D82MtgC/D5o1WikBu93F+wCa9PUdImj7V6THnKCvw07uiz8v8KCmaxBE9fUGdqB0L
	 IvF3kA+2Sjkdd08ko0RK8BiSIRTyAabDyjb0fF8S88KNn8l9XoPH/4ybIefrIEkRVww0k
	 sdFChRTDVWS1+LlvL/KHmIoMnVNOergnjnTYETIPXILXBbWqfjWcC1UnhB6wLh6/j0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278794;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=auWbpWfPPFdjYS0sjeGkL+z83l0fOIuRwcMvAjF4Jc0=;
	b=WS78+SZl/IuUv37FifKm8syIA0sJ9Cumk7qIdcSNMMGBEWAXkJSmKPN4ah3x87FI/AAE
	 t2N8tJdfXdyuGkMt6EY9NODs2y3ML0Plfjruc9e3rd5u/Jwkp9dyJpFaM/Y03eGB5aewU
	 6uMWcQGtoYJT6ALRAkNRAANEF9iFAUU7PQP/sr3cEbVd1OU0kcx+QKL0aCAAcGxiRRW3Q
	 fomgIODpVVyyhO0udGUazodScXfAPOGlU4o3Qc08Y9SZwy6qRWlede684UIvjB+YeXF3o
	 cSF8ZPbf8c2UwvXwpE0PZvziDj58OQI0TxWlSO+gJcJq6BIXLkv/UpeMYGAz9+MsjDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VLbnCl77;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097D606A320
	for <kernel-janitors@vger.kernel.org>; Sat, 21 Nov 2026 16:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E097D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VLbnCl77
DKIM2-Signature:  i=1; m=1; t=1795278790;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:WK1C2e6mH65BpJx4WIc2hH0Y7Wtm
   kretHsgzxn+DZLXYiNYE5usMyr43+8wUxgwphnilZdcOQ/RjWiRBEfhWVt5QOArwqcnKbM8crAj
   wf9jUUnyy/L0UzGRg1OCF32BINK772kOhc4MQIai/NOrkxsSTLN3fmrCral17fcbK3R0VOhUNMI
   OLfsvPPl/UXe9NWM/EA/1UUtqEADwQnXH4eB4zZ11X2xCGlOPn/jMSqK2N3o7OBWwxGvQSHM2T3
   KezAYRYx7uryswz3ongjnTqzOL1YLNzUPj4VtFtvAGHsfOPCnMuH7A94Rn3ZszfidUewXsA8o/Z
   TtA5uOZWpRZvuQ==;
Message-Instance:  m=1;
 h=sha256:
   +htYexGBTL2kBAPo9jTQRKIbUfRm1urwn+kdAc+VkEE=:
   N7e3qNVbjjZchMqSISQgG5F1KkwW9NMwj1Xj5wWQ2As=,
  sha512:
   Sox2zYRxP8bZVGPkg7K8XJrMUgN7Mlt2fjgjmVv/5SVj7jSOITQEvnjJ0ytuImv3RGxZ1KMKpL1I2GTr10tj2A==:
   GRrB3Lg4xoy7w2Xzuvvjt0Ly/F4OOdziDEX5aOcZPFhvNqvoqG9KR9RMFN7QoBnKc2RCBchiW+vH4YBC8th82w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795278790; x=1795883590; i=markus.elfring@web.de;
	bh=auWbpWfPPFdjYS0sjeGkL+z83l0fOIuRwcMvAjF4Jc0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VLbnCl77bnDCskStlab/2GGRU3BGp4yGfEqo5XUOs+j+DdrT1tErU1JDwy/jSPGt
	 ucnSVlsmt6W8BY7wfPztJ0dPkDMmcTxdJ6yR0dLL9EGfOwELoOtwI2ZQFDB7hJrFZ
	 24VnlpbPJILNUm02e58OjBTDtR61fTuAcWkmuJ1Lsv2RTubCwh36zu8wsegNZxkdn
	 QPhn6j1zKTq4oHUyedcQvTlU59xZfFvv6SLv/G178GJrlmAFE+uCulyUuW6ZDdE2G
	 l2zvWjzc9qqWC//V12NvGm+cpdIYWe9XttntcGvJXBNaA2MwI+Mnr62vdNjOJZ9u7
	 wpCE7zkRxNQm3kI/Eg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4bO-1xgOcO21gA-006a4Z; Sat, 21
 Nov 2026 17:33:10 +0100
Message-ID: <ab46a205-d1c4-48f2-8891-4de667f8ebf1@web.de>
Date: Sat, 21 Nov 2026 17:33:06 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair
 <benjaminfair@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>,
 Peter Chen <peter.chen@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v2] usb: chipidea: Use devm_clk_get_optional_enabled() in two
 probe functions
Cc: sashiko-reviews@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qa0Zm20PhwI+l7EB09aMt9rkzuTOEgQgcW0Iftqs/AYHOgeiq04
 MffT33zE9VaZ7tMqgUW2F57LzyviXpi99fw+yiVdZKjUA3Ag6w237ngLe6UZ6tG0hOFI9jW
 L0Hk+MJwQeBOlm+l5nlZ834Mu9VRrneSXxE2NLcnwkPbJ09FKwEmX3GWwS/iRz9JyuMkry2
 PVg3BTL+wOcqkfeTMoLiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mWywF0oAKec=;C/OPxiawL6H4zEC53h0jGwKUNeg
 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
 oY9dLsljIkh2YH3MX4pCC+h8XeeCsoAWeF57+ug=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Nov 2026 17:06:32 +0100

* Reuse existing functionality from devm_clk_get_optional_enabled()
  instead of keeping duplicate source code.

* Omit a clk_disable_unprepare() call on error handling paths
  and in the implementation of two remove functions.

* Delete the label =E2=80=9Cclk_err=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
Sashiko provided hints for further development considerations.
https://sashiko.dev/#/patchset/6d2450cf-9bbc-47b6-9ea3-f91bc1b91371%40web.=
de


 drivers/usb/chipidea/ci_hdrc_npcm.c | 13 ++-----------
 drivers/usb/chipidea/ci_hdrc_usb2.c | 15 ++-------------
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci=
_hdrc_npcm.c
index 75a0223b578a..4b608f2bb383 100644
=2D-- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -47,14 +47,10 @@ static int npcm_udc_probe(struct platform_device *pdev=
)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, ci);
=20
-	ci->core_clk =3D devm_clk_get_optional(dev, NULL);
+	ci->core_clk =3D devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(ci->core_clk))
 		return PTR_ERR(ci->core_clk);
=20
-	ret =3D clk_prepare_enable(ci->core_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable the clock: %d\n", ret)=
;
-
 	ci->pdata.name =3D dev_name(dev);
 	ci->pdata.capoffset =3D DEF_CAPOFFSET;
 	ci->pdata.flags	=3D CI_HDRC_REQUIRES_ALIGNED_DMA |
@@ -67,17 +63,13 @@ static int npcm_udc_probe(struct platform_device *pdev=
)
 	if (IS_ERR(plat_ci)) {
 		ret =3D PTR_ERR(plat_ci);
 		dev_err(dev, "failed to register HDRC NPCM device: %d\n", ret);
-		goto clk_err;
+		return ret;
 	}
=20
 	pm_runtime_no_callbacks(dev);
 	pm_runtime_enable(dev);
=20
 	return 0;
-
-clk_err:
-	clk_disable_unprepare(ci->core_clk);
-	return ret;
 }
=20
 static void npcm_udc_remove(struct platform_device *pdev)
@@ -86,7 +78,6 @@ static void npcm_udc_remove(struct platform_device *pdev=
)
=20
 	pm_runtime_disable(&pdev->dev);
 	ci_hdrc_remove_device(ci->ci);
-	clk_disable_unprepare(ci->core_clk);
 }
=20
 static const struct of_device_id npcm_udc_dt_match[] =3D {
diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci=
_hdrc_usb2.c
index b0200c5937cd..0cff5486e9c0 100644
=2D-- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -70,16 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *=
pdev)
 	if (!priv)
 		return -ENOMEM;
=20
-	priv->clk =3D devm_clk_get_optional(dev, NULL);
+	priv->clk =3D devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
=20
-	ret =3D clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable the clock: %d\n", ret);
-		return ret;
-	}
-
 	ci_pdata->name =3D dev_name(dev);
=20
 	priv->ci_pdev =3D ci_hdrc_add_device(dev, pdev->resource,
@@ -90,7 +84,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pd=
ev)
 			dev_err(dev,
 				"failed to register ci_hdrc platform device: %d\n",
 				ret);
-		goto clk_err;
+		return ret;
 	}
=20
 	platform_set_drvdata(pdev, priv);
@@ -99,10 +93,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *p=
dev)
 	pm_runtime_enable(dev);
=20
 	return 0;
-
-clk_err:
-	clk_disable_unprepare(priv->clk);
-	return ret;
 }
=20
 static void ci_hdrc_usb2_remove(struct platform_device *pdev)
@@ -111,7 +101,6 @@ static void ci_hdrc_usb2_remove(struct platform_device=
 *pdev)
=20
 	pm_runtime_disable(&pdev->dev);
 	ci_hdrc_remove_device(priv->ci_pdev);
-	clk_disable_unprepare(priv->clk);
 }
=20
 static struct platform_driver ci_hdrc_usb2_driver =3D {
=2D-=20
2.56.1

