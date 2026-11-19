Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113824;
	b=m1+fPzQA5RuYb+tDfJhWUi1kLJcX5ih5ojklf6Ta2L6URLuf5WsK1cL1gJi3+Q2PgMsJ
	 kYugWTR/gLFX1P1Aet9kRB5v5ab8u1Bj37vt2EWgNQJroAjnZLyEe9Q3XrQJ5N/w+pZSZ
	 s5HAukyTe92WbrxHPFssauThoDx2NxfK5zoIjruG1rECEP9/HEaeE5VdL1L+fsQyrXwGD
	 eswT7gBBUBN5MG3E+MBOIgWO0KB4J4f83xLTMISondQvjPavC9TaxnC3H+LV9ZXiQtC3L
	 +Veo7RqFuqXOlrW6DFj8k59zIn/YftLU8rD1h7P194D+2YHi1pW188DjbjJs5ZVVaZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113824;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=fNcd/76aM5MTcrfMOzFyypyODbWTEMs3q8aCWnQldd0=;
	b=EbFV0lbOb9CK5GCjO8AojBdQsDpNTNehk0ndQ4ShChRiO0MZQQgtiRoZYHKj10ZHbngg
	 EqAmJ/96v9UyfS8ThDkIK6Dm1fcS03Pg16KfQraGwKKOAuu0MNzTGFe21c2pymnHjy7Ot
	 ha/G5aWCsSEKtr2jYfz4OdwIjLXtGXtRbln87cNkhL4J1qEOCFa2ygpWDaDBAeuScmy9V
	 mqjceF63l34evMY5n41U9PbGQH0bhi7gQzKsj8B8IqsPiH3J0slRccH7sNSlG3EFsiQ7E
	 OzuRzsvisq1U1+o5E2uzdJG1cdUF+ub0wt0zt4PPuP0a2JZwyNuKyrUpx3Q6Y+sfsvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Msr6nm+P;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6BA606A324
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 18:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Msr6nm+P
DKIM2-Signature:  i=1; m=1; t=1795113821;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:ZdF2Khh+xbT3iZkpqa3yzQTVpiZo
   ccNx84td/mJvjEH3sM95m8X5h4Mha3Cjlcq3YWAe4oMgbyWUEG6/1mZDXtJ71lecWm3OWpG1kDv
   HaIpgsXKy7tRKrZU+CLu5shfIOVS5Cq8el31HjWNDKtvyuIboAWjrJagxMQzSyGhhJjPErRTLdx
   VqRThYIPRWxWQUqv7Ndc+94XoiuImLuLRZiu8QyeszXlgkiJMqRxxhjvgg1dZRW/P846jSPQTVP
   Gx1a10sc0soG6T/67r8IHzvo+yWXoRN1YbAgUIO8i+91LvsyhgC17MEYl1PrYOE7bOq8R5IqYXS
   0fHRcnGDdBtHOg==;
Message-Instance:  m=1;
 h=sha256:
   CFaWeFhUNtDJUC6nVaiF+pz1M4h7fxXGhAIJBwH9No8=:
   Bw5uRWWKdDmHlmWbfue9KfkSwgidXb2jBVTD+Jamp1M=,
  sha512:
   jhQIeEAkKcli+TFlcBjRXleSbTziN+LSVd+WPnTXwovdjS+C8p+Y9Tbj9k7ZUrMF8NQRyQjKArUtuazC89VP0A==:
   /6iVx7R0U+cEYaDutKOvRGofwTAuj7LlQOIV/17zNwUjJEa6dB2odRnEmo0EIe7wXMctntaoEVR7XJmrqiVung==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795113798; x=1795718598; i=markus.elfring@web.de;
	bh=fNcd/76aM5MTcrfMOzFyypyODbWTEMs3q8aCWnQldd0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Msr6nm+PgD3bqping3MU6mp4ajgKBK7+3/WXL70ojN3qvSj5HWBNMgysfEj5ONTf
	 6upvPh+qdyYvQjRFVR2Pnop+hwq+krzz0/qDXG9WQ+QxxF4ODdj5wXa0XHaAl9Lwq
	 NDnvSxmOyUB+AEwYht1omMwK/+o5snWpJcXzgijTD9N+ykfCrwT+860IYI0Zz0PCQ
	 rtYsWC0uiYLa3oQy8I9r/du6xp1jMSUH1OWpjzdm88G+4wm2to+qQ2M1CxTVVLsoj
	 npuhTILz9Gzh6yI3TX09clAJsmVkHwgxBwO6tzwlWe90SYd0iFXuhKd/sta9ZUpMI
	 4PcfyW2pnFVBLHlFig==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzkST-1wYjA71GRF-012up5; Thu, 19
 Nov 2026 19:43:18 +0100
Message-ID: <6d2450cf-9bbc-47b6-9ea3-f91bc1b91371@web.de>
Date: Thu, 19 Nov 2026 19:43:15 +0100
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
To: linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair
 <benjaminfair@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Patrick Venture <venture@google.com>, Peter Chen <peter.chen@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: chipidea: Use devm_clk_get_optional_enabled() in two
 probe functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XRQQ7DbqHTHLlHEckpLK7q2Gme0P31h2PSBHvJ8rwEaqZEgHp1w
 2LmJGpHYqdZ/SZIOTWY6kXocJtOGA/PI3yofzNvjHRwMYk4XlQUfwEbO3WN3X/gGa9ocIqT
 19XxL4ewvf0yO+TlPBuB9GkVfiITiL/30PyrJFLKR2jEG/7O2WT72kEQYXvTZVPEJdEGCoH
 JcMFdpYITetA0pBeW4CCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HMjKnUPkqvQ=;SZtgvbSSNQu8sSUDS9cVSLTGwOV
 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
 yMe9sycVuL6HPjVV6PTF3GII38aOA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Nov 2026 19:34:37 +0100

Reuse existing functionality from devm_clk_get_optional_enabled()
instead of keeping duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/chipidea/ci_hdrc_npcm.c | 6 +-----
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 +-------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci=
_hdrc_npcm.c
index 75a0223b578a..5052287f69c2 100644
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
diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci=
_hdrc_usb2.c
index b0200c5937cd..d33ab6873def 100644
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
=2D-=20
2.56.1

