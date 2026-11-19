Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106259;
	b=kSbCXF0tp/1IK51vh9/q7XPYMcWdBKFwWO6snf0q2QyTOY9NLR7pyZSPX7DLdJh4Fm8h
	 xx/TX/57GBoKaY4muKVxXFEmJQ6xUHuxlvvVQ31i0aaPC+m81buCMhB9vna8tDl7MdxXp
	 EhvI3eo1JOVwIrBRAaOK8b7gU8PeKPxKtcoAs5G6uCWUfZNPHnSavDzAC+pDbNFn/ZISN
	 lwuT1zCqWmCliEF3Ybrl07uBFHYJmCtXUkzQKAfbvnyNs+XQpOhr/FrPrzMW+t+d1tS2H
	 Ky2QwIcEsYEiDNLUPYcE9MdY4PBsA/9ImUC0KB+7j7ivFGGHvbJrdzlHHtasTD6opqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106259;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=/6gedtZUVgARrlR2/Fe7drA+mFqcnLUGdP38hYO+XzI=;
	b=1Qaas/N+SXR9NS6naSp85pU3SIczBienBbn9o9keDAhCdnFJIQUX5Teu0D8KOn2cBHr6
	 zi8F5h00qT5bAhTwdPUwWZ+skuarF1Jhdq4rALSxXLZkvw8XkFmPeshaZsFOrV71CUGk1
	 QFoOtm9MQnjjZ4zoxjgkA+hpM8JqYlAE5d8WYxno/zZSMxA3wkiUxNiktZMnr5rMXOM5p
	 CvFjOccf6GByICIGUGN6AzUUFXwbwvvIrJGeDlu9ViyV9IZMD/j1n6VvAdCRZKJjfJj06
	 KtOn1fbcJ6GaBtTIrGh0LppU88bWwygP47+GGFBt28BJ6630ox1NrTkvbZgrNvQd+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b="P6/OVxFd";
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79547606A320
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 16:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79547606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=P6/OVxFd
DKIM2-Signature:  i=1; m=1; t=1795106256;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:HYqIJyCOay6Ie9iRHY25q3qYvaXl
   O4GPksmqMP+188xlSF6plfWiNFckAa4lKFzu2VkXyBvT1lU01mf1K2aiNO4JNxzOEy/WWAsTfCa
   WgaO/cRJpxTkOlD7iimdiSzo/CfyfxQmfZffiSGRoTLM6OIuUz7ny1hkj11RjY43DqatjdI+A8l
   Lf8U0md0/ernQoYhAxTWSyT8zxpYceYE2zewPFgIPq9Pxo8eLHDx3C2XA30HF/+O6SYceuEbbCV
   Bxwc92CqmQLR/CwSYtsIBxqTNDI4tv7nMEluA/DMVt5uxfYDINn7uYlTut5I+9A+yaG4OhI6NK/
   20rcXrV6R7Y2CQ==;
Message-Instance:  m=1;
 h=sha256:
   Oj5PkxcC98DsS1q0DPV24/kaWba1XfWsaOwgd2HqPb4=:
   p6WF1LloQ5BXp0Vh11Z4hgHjYafTBYECQ5R6QtkXR14=,
  sha512:
   0sxsNUI+ABPsA/2ztP6Aft63KiUmmXCzNu7t8l9UQF812G271kW+2NS55FWKpT60o8mAUniQpm2ywJVN7gYflA==:
   xxe8r16gLL0dZfHEA/fFe/KOoQxbzX/fa1Qn7jJW3pCMdZdVxD1W0lsHYx1xKEVtJKfptUrHJjm6PZlfLJJnAQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795106240; x=1795711040; i=markus.elfring@web.de;
	bh=/6gedtZUVgARrlR2/Fe7drA+mFqcnLUGdP38hYO+XzI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=P6/OVxFdYB/Ux3YBrCdreY8FWzeVkZkh//bZjEqVKL97UbQ8LxdSSWDqhlb5OCHO
	 TjfgERI5a7VuGEz5RJZfV/e03/GmsTAvo9E/AxNc/pqFs0Dtv8XWm6SfODTQwpWE9
	 Fnf478ZyC9rw1IK4W/+RSPSsl7+qrUuF473Wwvqgk8KoZNeML4wfsvUV8cp1gFqNG
	 5RI/YA9dqdZixhEiGshvrYWfxjHhDci4d+sjYpSfQHxcR0l0jLlJ36iylstOLBq7E
	 CG33WQ/7XFU5PY3g1GwyAQKRch9l9DOa4Oakw/7edjyxplPIQazx7hFMmxQKRfLtN
	 K9J+UsH8rtdqMrz96Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWop-1wpoZf0I5L-00lwIn; Thu, 19
 Nov 2026 17:37:20 +0100
Message-ID: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
Date: Thu, 19 Nov 2026 17:37:16 +0100
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
To: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH net-next] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:88EI8/GpfhihIpUgaAF8JQaAoLwpztmSK67NIbJBPSr/NwBl6RK
 Es2db2+nqki41PmaLBUSfnpXwJGexwCdfpC422cCKZHV0ZNXSzXT+oP4SPVoMhF5iRPCgy/
 7UvtGlTPbvDvRHLFKeq4JmBoRbqxp3hzfXPxYebkt7uAG/FLuA9I+GSHDXzitv9ZrVHbVwj
 4Zj5bXfMRr51enRG1+ymg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M8woAP6Knvs=;pPz4PeHV/Jes0grsCIUnW1m2QO0
 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
 NOG4zf6Hi7dCI7ZIR+G7lI1KZUlFrUQ/HqLC0Q==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Nov 2026 17:30:09 +0100

Reuse existing functionality from devm_clk_get_optional_enabled()
instead of keeping duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/dsa/bcm_sf2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 1747a1f20c78..011ce79392e8 100644
=2D-- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1467,14 +1467,10 @@ static int bcm_sf2_sw_probe(struct platform_device=
 *pdev)
 		base++;
 	}
=20
-	priv->clk =3D devm_clk_get_optional(&pdev->dev, "sw_switch");
+	priv->clk =3D devm_clk_get_optional_enabled(&pdev->dev, "sw_switch");
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
=20
-	ret =3D clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
-
 	priv->clk_mdiv =3D devm_clk_get_optional(&pdev->dev, "sw_switch_mdiv");
 	if (IS_ERR(priv->clk_mdiv)) {
 		ret =3D PTR_ERR(priv->clk_mdiv);
=2D-=20
2.56.1

