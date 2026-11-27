Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788485;
	b=m0oIPx0U9WkElzJZklsVzBL7OngHzhyi/Ef51oSZHbU7B9bBGqI+TqXHBlBqZiLCI+5U
	 leBVxDNKOPWqqvrg2TttUw+jHegf4fqgFtNmJWpMNaVcQ/0QX9TsJEcqCmZExAljYM7k9
	 v/I81hVaiZU+tRxaiSrRcWhSdlDpX8JouAwNUSnXy0wUwKpK3VJRExw8ZZMHQgqZZ9zp0
	 B26HJsM6e7QBlvYBAJOlcAT09CThYIWdIIoZvohyI5JcdXPINo3T0KZd10zqj86TzdYNe
	 P1bIeN8eNebGbpV7uhEeLL5MV0Tt2EsVUkYNSsQiSQOnvRAuc880YoGb/ZWD+b3e09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788485;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=G+YmkpU8N5DVJcWfqnHGpk1jQNfy1BxxyghiHeCG1AQ=;
	b=dxHJrJ9Kf6KzrR0sVwtHQAGKURKkSPFDADgQHacD4s5s3OITdiAVgZ5zVkkCzfs4GVES
	 JLOnhfOJ+kx2tVu0dsMo3BZjy8rllCmSq7fEROfMlL4UrAP0Nqv33yKfoDZEgpJyf+SIl
	 YJpzNcAY2FyISSUiEMPWEBNTinvz6/zWL9Co0AUxewClDLVRA3b/YZTOn78Qra+wFVwCT
	 8A5a2huVImORHaZtbGoBevqkv4R9IeHF1wj+Y4yauJ5q1ZJpEAPLlsP+vlcjIjXczrSy0
	 5+gKPI1S+IiOIaiTHarUCOvEjP+5o0skEWkxbuS/uNDdXV642j669F2mhHA3Mu3ONmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Wgl1j18O;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59F606A31C
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Nov 2026 14:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F59F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Wgl1j18O
DKIM2-Signature:  i=1; m=1; t=1795788482;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:l7PETrBltyMsvF8/gcwgWxM7Z3me
   3GBsAsnbzH5FQWZdbk+Ie8MjHL4xzAepSOitXiM8Y6+1BeyHW7+o8DRJv2/0dnOnrH8v0mi2nsf
   lkBhm8vWUmnnGc6oQIMJcNoikxkt+QonRHjpVWFTwtFPojXKbmWS7STj0g2rCmC4Mki/kR4KHQO
   V00rTeNxFQM3eINAXZAJCvsAUAgweV2T037p7V5eDVpchDQajgOOB+WbIac3Exn0NIxHun/NLeg
   B/QVu+GFtBz1cUMdD84u5S0wG8mRjC89zvbOKpnWMrWlewL6ShaJhGa6GyPgCilbgtdSeyiSfOU
   inf3yDmCZR48sg==;
Message-Instance:  m=1;
 h=sha256:
   T0w7U1EXGhSOlWghPnmV2jYLtfkJhRUE9PDER+8n8BQ=:
   e0WkM5WTkUgbQZ1WtobdSEWxNpuohMgED/jNh/R1QLA=,
  sha512:
   K/hYupwE55ikEIk4G7Fn5lFElVeaxlMppM6AmOlUt295V25zptDCCpmY3WoCMCMh64Q1xe8EMKk3vHXukkNA2A==:
   Pmieu2kXZstDhxORnTqfiZ+7Kg0Zp1pXfno4cVnr+qywf2yiNbt8SgZfxwkclNzM7s8jM1WqkQawnu47KgaMOA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795788476; x=1796393276; i=markus.elfring@web.de;
	bh=G+YmkpU8N5DVJcWfqnHGpk1jQNfy1BxxyghiHeCG1AQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wgl1j18OQjFS6+okUKzOLt+p2LAEWOFxozo4KiOzYJq9snOBhu2+2mlZ6y3ULjzR
	 eUM3BrQfhnPnyfPEWHCVX8KY0aGAKBfviFtFI7Nf7aCAAHAGvUQ9CtqZAAprsfW+x
	 tmsgYE1F8cXj9ED3tUG6gYMLhddTsPvFY08pYnjMTKf/fXOuyBtyZanFtK0/Np2am
	 4S4XH2tpQURIEXTAMYCnZFbdsiD4TqjuwleZ7gamoaC6ShFCG2S197zKQsBdpewHy
	 lr+BpKHEBSQTvFCm7UFf2s1H/k64ikktSbrkqlfDvb0F7jEe0LokEjeYRJAIe218S
	 uhZcSpgviLjf0u+dRQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCGWc-1xgKGk1rko-00F08L; Fri, 27
 Nov 2026 15:07:56 +0100
Message-ID: <bdc006a0-a095-44d0-ab1b-2675297ef4f6@web.de>
Date: Fri, 27 Nov 2026 15:07:54 +0100
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
Subject: [PATCH net v2 2/2] bcm63xx_enet: Use devm_clk_get_enabled() in two
 probe functions
From: Markus Elfring <Markus.Elfring@web.de>
To: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>
References: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uXHQN+IEXGMaNIuCtR+0WiOuzfHNy2aWagZKuI5447+CJRKS1MA
 WBbpxpvQCaKh1wwsWvx4WO7GGDbaEIL821Q3W7bQWM6557w9ns+qnlzHfe5anZXZkJx0ECQ
 V/B+LEysFIJhfDlwX1kN+awk8unL+6ZFwmANHIe+FiBzx6Avo29FyfOKbpDlW6pWWRxJ4wC
 nsJ9mqyThJYKBtZU3ou1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wvDnyqqmxto=;PiEyixjpBCaWa/tZzWmRyYlKhNr
 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
 0MjGvYqKsyesBO/mWkAr0uk7ISOVJUhsnAg

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Nov 2026 13:30:17 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Delete a clk_disable_unprepare() call on error handling paths
  and in the implementation of two remove functions.

* Omit two labels.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/ethernet/broadcom/bcm63xx_enet.c | 27 ++++----------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/et=
hernet/broadcom/bcm63xx_enet.c
index cc9a5cd2a2a3..d9466609e7c1 100644
=2D-- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1751,14 +1751,11 @@ static int bcm_enet_probe(struct platform_device *=
pdev)
 	priv->irq_rx =3D irq_rx;
 	priv->irq_tx =3D irq_tx;
=20
-	priv->mac_clk =3D devm_clk_get(&pdev->dev, "enet");
+	priv->mac_clk =3D devm_clk_get_enabled(&pdev->dev, "enet");
 	if (IS_ERR(priv->mac_clk)) {
 		ret =3D PTR_ERR(priv->mac_clk);
 		goto out;
 	}
-	ret =3D clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
=20
 	/* initialize default and fetch platform data */
 	priv->rx_ring_size =3D BCMENET_DEF_RX_DESC;
@@ -1792,11 +1789,11 @@ static int bcm_enet_probe(struct platform_device *=
pdev)
 		if (IS_ERR(priv->phy_clk)) {
 			ret =3D PTR_ERR(priv->phy_clk);
 			priv->phy_clk =3D NULL;
-			goto out_disable_clk_mac;
+			goto out;
 		}
 		ret =3D clk_prepare_enable(priv->phy_clk);
 		if (ret)
-			goto out_disable_clk_mac;
+			goto out;
 	}
=20
 	/* do minimal hardware init to be able to probe mii bus */
@@ -1890,8 +1887,6 @@ static int bcm_enet_probe(struct platform_device *pd=
ev)
 	enet_writel(priv, 0, ENET_MIISC_REG);
 	clk_disable_unprepare(priv->phy_clk);
=20
-out_disable_clk_mac:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -1929,9 +1924,6 @@ static void bcm_enet_remove(struct platform_device *=
pdev)
 				       bcm_enet_mdio_write_mii);
 	}
=20
-	/* disable hw block clocks */
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
=20
@@ -2694,14 +2686,11 @@ static int bcm_enetsw_probe(struct platform_device=
 *pdev)
 		goto out;
 	}
=20
-	priv->mac_clk =3D devm_clk_get(&pdev->dev, "enetsw");
+	priv->mac_clk =3D devm_clk_get_enabled(&pdev->dev, "enetsw");
 	if (IS_ERR(priv->mac_clk)) {
 		ret =3D PTR_ERR(priv->mac_clk);
 		goto out;
 	}
-	ret =3D clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
=20
 	priv->rx_chan =3D 0;
 	priv->tx_chan =3D 1;
@@ -2720,7 +2709,7 @@ static int bcm_enetsw_probe(struct platform_device *=
pdev)
=20
 	ret =3D register_netdev(dev);
 	if (ret)
-		goto out_disable_clk;
+		goto out;
=20
 	netif_carrier_off(dev);
 	platform_set_drvdata(pdev, dev);
@@ -2729,8 +2718,6 @@ static int bcm_enetsw_probe(struct platform_device *=
pdev)
=20
 	return 0;
=20
-out_disable_clk:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -2740,16 +2727,12 @@ static int bcm_enetsw_probe(struct platform_device=
 *pdev)
 /* exit func, stops hardware and unregisters netdevice */
 static void bcm_enetsw_remove(struct platform_device *pdev)
 {
-	struct bcm_enet_priv *priv;
 	struct net_device *dev;
=20
 	/* stop netdevice */
 	dev =3D platform_get_drvdata(pdev);
-	priv =3D netdev_priv(dev);
 	unregister_netdev(dev);
=20
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
=20
=2D-=20
2.56.1

