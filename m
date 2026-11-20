Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169930;
	b=cqfd/o15in2fnrL6QCVa8L2/CJVXwBWWRb0n6B806WKMAsdR6Rqz5s9meGRpGihA3/Ry
	 1oG2rXJWMmuL3d5lsNvm8Q8TDjWvcBIcDSoUaCti8aJgLpre+SzeN/TSKS3P98ldWM0DB
	 rH9wg/KpGCCPoaJbuVAdtwoNmKR4GHrfrx7EwykFJAOBt7e1EGjbcvUeAPuDIiRosB2Kr
	 XqsxEX52/s13mJbI25byWqkl8mpfnFrBA4pHTxjEV9MntRSFvQVozNUM44EobQuoCU2PK
	 FcNYP9oTGT9LBlGv4Xb0mCwChgJEKue+Z2L4qBcGVQBOn9jpRf/ga7/WMutgG7Anqcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169930;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=w9mO5udOoOAPlt3TIjkBf90ljjYVMMkfdGaJlaAwR+Y=;
	b=5LiytJyVdBXoVrsaG3o+P1ozzngdJfgKiGaMYLQ4aCPCjfwWGxfDuEEigyY81Pt0kGGv
	 KFqkdMXgmuzQz2D1jqOQeNzjo4weDtnKGJMFnzwG+7J3fy76JwaoZelVwJ3KLYEXDMLgy
	 uj5Y1SEfSyYaDXRh2ZLAON6ypCmkWSWeFekRsCrQtcFgE0i1elKb9Q1NlJVSWNBvre7nR
	 PW4V1N+blO6XuiJqsS8tKQQuEutx5uX/aau2sZR/ATrqScE+3wmgr7lu2UkKokClSTgSq
	 szEabMa94M2ipUN/NRPnAGie8tjsstC1N0gqGAswq2o9H8OvVjjsZU5cucFe3BSS3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=aaYq2dIs;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEC2606A325
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Nov 2026 10:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEC2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=aaYq2dIs
DKIM2-Signature:  i=1; m=1; t=1795169927;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:I+jUVXGn5Yj8VPz/7o4/XVregmVX
   J/RL+Gm/Ip6ccSu0Jd/nOolOAtVnreYIe3R1HTIp1t991YfGfbVQ5+iWgFbOxP7IoZnl+7sy080
   MV6Ey0wZm2hJQ4ZXi+B1d+gX53z56j8YAH7svpTlj7rW0HKyjznkC9VWGfzlPfffW3a8gv6Pd0e
   +Rn9iDG83krIy+ws6slQJ1yqsz/qiKllFN8WDSWGqS+YTj22QatnZ0XCTYVjSG5KHkY3H2Q9CAi
   01scuMH2mK0nYCg4A4PQniiyUJzbGQ7ziSGi+APt3CWCyk5ohcLYolLRigqGd1AewbpUUyJFoLv
   ligTXuhC6qb3GQ==;
Message-Instance:  m=1;
 h=sha256:
   J6lKEZWlqBJ9awQpOhoA1ubI5KltUYC/hR6j/hkfiN4=:
   6EWhoWmeOaiBHiyIlivxq7oKCwIR/iin7I4W2IGCRPI=,
  sha512:
   i0mQykrBsFCGXCauQvzrhOL/7qdbWl2yKo/SIdehSJ+C9o64y9dCi8YZzCgDsW+2uGLcojlbB7Ftv+nzElE0og==:
   0xscJ547O34iXdITY5K9CR8T1Duo3YpcQIiYsIVyvw6Vzxq4zdnWQiJkaiQnRlp9ZVf3zVEjpGr5+ruZH1bhZA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795169904; x=1795774704; i=markus.elfring@web.de;
	bh=w9mO5udOoOAPlt3TIjkBf90ljjYVMMkfdGaJlaAwR+Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aaYq2dIsdNFaPbqxcTm6u4IHGdbnvg8nUyhkprM7F9YGRSCPV6MrQl/fCeejyfie
	 ngIL680b8Rth9+8wZ9O0NBLDFpn4VNDHbCsBXim2W6wiA+6MauvfnJvFLQFPWoij/
	 uMJNvpX4gcMXxwicND+PJwFzZDUg7K0QAff8Yd7Blp/0ZsmBLYE6E48aab1eGl6R3
	 ytL5bfBs80alRtxRYC+w05cRbvUe+3j+WjRVKWkf5NhId0LiaN0SvF1mtjiUGmzQP
	 g8QXnpjyWMM/3nzws0FbZFgN8xbic7yYmEnXzbCa/f+qRCfs+x4X+/JzoKBpVp7o8
	 6tZTHCY5EPXzFm618w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKdHC-1xpIrc1PC8-00Vryx; Fri, 20
 Nov 2026 11:18:24 +0100
Message-ID: <abc2c963-f3bc-43e3-a7c0-56e2cde1a268@web.de>
Date: Fri, 20 Nov 2026 11:18:20 +0100
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
To: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Yuanjun Gong <ruc_gongyuanjun@163.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH net-next V2] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() calls in bcm_sf2_sw_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6/4LszDmqs4hiERCky2aSi3u+1auraBpaSx6Wv4wpFbv7VGp+A5
 b3jaFHXOQyOLf/l4K5+okZIFafvZjPetdmJGG7TRXwXuDFVNp6TIw7Nh16IKAJlhyzwRthQ
 iRFSb2mIrtMuo0O1yqADYZ7E169E9y1ACGIK7o5Rz1vdbORP6/js8FFcF/3GhNupjnzWX7K
 azizN4rnyBv8QqNWUexkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0JdAc3COgdU=;BKU0VAnKGzOeaklwEl7XFcJntny
 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
 kX7Gs0HadOw==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Nov 2026 10:45:18 +0100

* Reuse existing functionality from devm_clk_get_optional_enabled()
  instead of keeping duplicate source code.

* Omit two clk_disable_unprepare() calls in the remove function
  and on error handling paths.

* Delete the labels =E2=80=9Cout_clk=E2=80=9D and =E2=80=9Cout_clk_mdiv=E2=
=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
Christophe Jaillet and Florian Fainelli requested further adjustments
according to the proposed changes.


 drivers/net/dsa/bcm_sf2.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 1747a1f20c78..1279906154bb 100644
=2D-- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1467,28 +1467,18 @@ static int bcm_sf2_sw_probe(struct platform_device=
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
-	priv->clk_mdiv =3D devm_clk_get_optional(&pdev->dev, "sw_switch_mdiv");
-	if (IS_ERR(priv->clk_mdiv)) {
-		ret =3D PTR_ERR(priv->clk_mdiv);
-		goto out_clk;
-	}
-
-	ret =3D clk_prepare_enable(priv->clk_mdiv);
-	if (ret)
-		goto out_clk;
+	priv->clk_mdiv =3D devm_clk_get_optional_enabled(&pdev->dev, "sw_switch_=
mdiv");
+	if (IS_ERR(priv->clk_mdiv))
+		return PTR_ERR(priv->clk_mdiv);
=20
 	ret =3D bcm_sf2_sw_rst(priv);
 	if (ret) {
 		pr_err("unable to software reset switch: %d\n", ret);
-		goto out_clk_mdiv;
+		return ret;
 	}
=20
 	bcm_sf2_crossbar_setup(priv);
@@ -1498,7 +1488,7 @@ static int bcm_sf2_sw_probe(struct platform_device *=
pdev)
 	ret =3D bcm_sf2_mdio_register(ds);
 	if (ret) {
 		pr_err("failed to register MDIO bus\n");
-		goto out_clk_mdiv;
+		return ret;
 	}
=20
 	bcm_sf2_gphy_enable_set(priv->dev->ds, false);
@@ -1565,10 +1555,6 @@ static int bcm_sf2_sw_probe(struct platform_device =
*pdev)
=20
 out_mdio:
 	bcm_sf2_mdio_unregister(priv);
-out_clk_mdiv:
-	clk_disable_unprepare(priv->clk_mdiv);
-out_clk:
-	clk_disable_unprepare(priv->clk);
 	return ret;
 }
=20
@@ -1585,8 +1571,7 @@ static void bcm_sf2_sw_remove(struct platform_device=
 *pdev)
 	dsa_unregister_switch(priv->dev->ds);
 	bcm_sf2_cfp_exit(priv->dev->ds);
 	bcm_sf2_mdio_unregister(priv);
-	clk_disable_unprepare(priv->clk_mdiv);
-	clk_disable_unprepare(priv->clk);
+
 	if (priv->type =3D=3D BCM7278_DEVICE_ID)
 		reset_control_assert(priv->rcdev);
 }
=2D-=20
2.56.1

