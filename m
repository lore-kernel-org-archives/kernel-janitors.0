Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795888142;
	b=yvmNkNU0ohAQ8/9/rC0POI37XHT+JXCgHn6XD8duSZery1JfHcmXyw9kM6hEQdY4VmcB
	 yx68t8EW/eQFvlzTzAN/ojCQdYeLvpoN2Oq2mZEXYRklhMaLSS3TyEhIeUjxh1tBtMAG+
	 0IpsUtPVRML6GzfQ7RfSzFPxNN9egpAO7ouKuL6VrHSUG0TkywrBs7+wU87A28GflpJcC
	 27kZJ4p5g81MOB/74R6U7encvbhbpMpDF8bdIZlHDkjno+12vU9c64xEz8b98nJdbmA8h
	 wYN/cKCAZ9Y2JSRPvXt3Xy5QvvZCWGOyUfw/NHqXxffZmmZ4a/Rx51BMGtQuCTlvbDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795888142;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=5PccFkZzLdYpOy1D0QuEwjcqvrZR7202drZKs92E+Q0=;
	b=XIYYU8IOINk9Av5aI1NV3y2dZK13PBp04RvbB/ZoR/VEj2FpRFTmf5z5N4h50VfO2ik9
	 itpmqwwl5MiP6AZ63kQwg47qSdIj+Q9AX9hjn5DfEDo7fVRNkaE69QM38giHNknyPBLpt
	 FdDSf2OIafFjVlH61o91zkl2QK9wFP/9uHvuC/1o9yX6762ZThG3ep1vKTIvBnck2/zBx
	 bwpganvpZhEKwY/7gpLfJliXuYdDSSLv8Z80ermML5tlhNUyJzIxPizI0Ru3Yvt2YWCD8
	 8uzcnVoWSV+8OyuA16QOeSh9O4nCaE4q3+IATENK9tSrfKNtVMR6Ts9GuZw5q64/SWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=e75+vkOm;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB900606A334
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Nov 2026 17:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB900606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=e75+vkOm
DKIM2-Signature:  i=1; m=1; t=1795888139;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:Ret4k1BbUSUrmwj1mrMX90tEa5wm
   zWDqB4ZChSX7XUK45FouDuPU8zYUEqAfwET8+GuKdQakI9sUj4af/1YxW5artcF4xbTVEr0xtah
   uzRCXeIKeg7CJUxFbJJ0Ktox7N0BuJ7rj3BQbbbQPWnoKcH8pV0qNexDyRb3x1kfhIKHxyKtn+/
   qNGk4KR+cNb9ocD7cwDRBn2+/J54S4vnqmG+rDX/sGE2TsQVw/cdtgBLSf+BiGRm/6k78PtP7Tk
   13AKaQVwAY+T9TLjbf1G2zmk4eMr8aDBqsyEgdsV1vKjWNLyT9+cCo3/9KDNhi5wvEm42d8BZ4R
   178kJhuR8C2WRQ==;
Message-Instance:  m=1;
 h=sha256:
   EqKF2plFPXAq5Dej2MoP92PSONMytwpRCjspj/jBMi8=:
   PtxexPZ3yQ23qQ/pHSthpEf5VnnF1mKRpcRC62Pl7Mk=,
  sha512:
   nTEXckBxpl5R6iPDnm621zyUvIh7GmuTrFbdABDoLKR1U4lwMHx1/B6plaMvfGqKyynAY4b+AHtDp5Q587I4YQ==:
   ug0VYzEyfQ0JQYdVne4EBAkP1rcVGoHahv+VN8ETr9rZbWjn2aw4yN6ih7dnEwfI2t/E/pLbEGZgQHCstZMecQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795888128; x=1796492928; i=markus.elfring@web.de;
	bh=5PccFkZzLdYpOy1D0QuEwjcqvrZR7202drZKs92E+Q0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e75+vkOmnNuSHOkt1tYzzWjPsN57U9NQLd51a4ggbHynFgSI9c8espQ/9yLi/5iG
	 Me3whxPMrbeoTJ4T8EjuVBG7Fanx4HhHXHRkafvToP8jHwlC+qgIM95gdlq4+iu/P
	 sxF7T2arcQ5HajZy3PscK75tkJoww5UiIuv+at/6utUwGHKy5eeWvSpALQXv/8+LB
	 VXxcGXwojWKCyBfSA9FKJGii0FMq4VvCB2W191zBCjmhD4NyYV4+p/HXVx3WJEnJW
	 oWrl+Vs1pglohSmWbIxP9o8GUf8rbCe+V6opyp094OcaJ01snloevtI905lHnyeTn
	 Qvel1lR5LO9vRj6wFw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9LIO-1ycg7g2h9g-00zh2n; Sat, 28
 Nov 2026 18:48:48 +0100
Message-ID: <33c4b369-0b92-4c77-9bb5-43895f80aecb@web.de>
Date: Sat, 28 Nov 2026 18:48:44 +0100
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
To: linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Frank Li <Frank.Li@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: mt7622: Use devm_clk_get_enabled() in mtk_rtc_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q2e/sotPrQG5PB5MhqQlFZdYnz1J9Bh+rvkCHnY7eu2+FijKIe1
 HKAe9XIvyGyJ/LQIiNygsvOFN6L4H1Wb2044W63MkHVozywMrxysPtRwGTrcFnHMHcs2ehB
 SdQ2MdLACuJYBSf6+jHYMjbLxyLmduoDt1hHAZX1ML5Ja4ZzfRzATnF5dtdy1bQml6zKI9t
 OvQF6clS8nvLlZqDbk8Ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sobtGqO+Cvw=;bwc8IM9TUryjBDafIw5Xi68C/hi
 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
 gnPagOBJjeR43o=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 28 Nov 2026 18:30:07 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Delete a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Cmtk_rtc_remove=E2=80=
=9D.

* Omit the label =E2=80=9Cerr=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/rtc/rtc-mt7622.c | 45 ++++++++++------------------------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 1772cb25b25d..ba4b400cdfcb 100644
=2D-- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -314,28 +314,19 @@ static int mtk_rtc_probe(struct platform_device *pde=
v)
 	if (IS_ERR(hw->base))
 		return PTR_ERR(hw->base);
=20
-	hw->clk =3D devm_clk_get(&pdev->dev, "rtc");
-	if (IS_ERR(hw->clk)) {
-		dev_err(&pdev->dev, "No clock\n");
-		return PTR_ERR(hw->clk);
-	}
-
-	ret =3D clk_prepare_enable(hw->clk);
-	if (ret)
-		return ret;
+	hw->clk =3D devm_clk_get_enabled(&pdev->dev, "rtc");
+	if (IS_ERR(hw->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(hw->clk),
+				     "failed to get and enable a clock\n");
=20
 	hw->irq =3D platform_get_irq(pdev, 0);
-	if (hw->irq < 0) {
-		ret =3D hw->irq;
-		goto err;
-	}
+	if (hw->irq < 0)
+		return hw->irq;
=20
 	ret =3D devm_request_irq(&pdev->dev, hw->irq, mtk_rtc_alarmirq,
 			       0, dev_name(&pdev->dev), hw);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't request IRQ\n");
-		goto err;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Can't request IRQ\n");
=20
 	mtk_rtc_hw_init(hw);
=20
@@ -343,24 +334,11 @@ static int mtk_rtc_probe(struct platform_device *pde=
v)
=20
 	hw->rtc =3D devm_rtc_device_register(&pdev->dev, pdev->name,
 					   &mtk_rtc_ops, THIS_MODULE);
-	if (IS_ERR(hw->rtc)) {
-		ret =3D PTR_ERR(hw->rtc);
-		dev_err(&pdev->dev, "Unable to register device\n");
-		goto err;
-	}
+	if (IS_ERR(hw->rtc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(hw->rtc),
+				     "Unable to register device\n");
=20
 	return 0;
-err:
-	clk_disable_unprepare(hw->clk);
-
-	return ret;
-}
-
-static void mtk_rtc_remove(struct platform_device *pdev)
-{
-	struct mtk_rtc *hw =3D platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(hw->clk);
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -393,7 +371,6 @@ static SIMPLE_DEV_PM_OPS(mtk_rtc_pm_ops, mtk_rtc_suspe=
nd, mtk_rtc_resume);
=20
 static struct platform_driver mtk_rtc_driver =3D {
 	.probe	=3D mtk_rtc_probe,
-	.remove =3D mtk_rtc_remove,
 	.driver =3D {
 		.name =3D MTK_RTC_DEV,
 		.of_match_table =3D mtk_rtc_match,
=2D-=20
2.56.1

