Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548212;
	b=b3zacFarEpOMcJdlexOnM3d6PJLLIZODceowhr3KqSMOl45Y3udbQDbvyYSsMS9hAqpn
	 UnV9zx/paTe6RrdomgyUcXDt62f0S704LZrwrNqe73TsS64QaSeVoW2318KfmVR7NWwA0
	 1Arh266xD6ySmEkNUPbLlDRGGwfupnQx0lFhEE8NkdkceFq/Yb/i3um6Pd2Ke0Da9Laoh
	 OLm2VGxsNXVWdhb3CFx+wddv/a1FiQVH2C22tZTVmcL+K7HprTYC27w9wsIBeeoY3r5+U
	 OxpXJsjdjAV/GwdALIfRpN/E5hiy3PUWh7Iq4Z8R7/AmI/isl5KOZY/LHCQaFv6UgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548212;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=B6glkg7WHndWy7HDi6TcRv9kqBGxlE41IrpAXoKrNRA=;
	b=FrbvnGhkU4XUa4N1W0JxXuxYjOgFT/GFcs+9JSqjPykr6Cw4nVx4k1jJ+sFwrSrgz1LN
	 2aidiGK3GGGhQ0z8bR1kpChy1fZraqoV51xIkbWMBnMXYOtWw6oGft4fveNnYKQlDbcjo
	 bkiVBLEMx/tgQaFAXjOfg5WvVug+do2zOrWKSemnasVAQQBYVUgNIPLPUKjQ0UFsYNQ5Z
	 aZFc0DbaGvzYZg5tYl2vJCtfuzdLjxQnx23L8mxe3BemRQIkvGvL0SlFuRpGouXMCTliW
	 MG+RYreN5bA9nRT1mIALTdQ+iRqDAljq6ZjmNgeI0gaCYS/Fgi6zOc3AC7FDGeO2g2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=JSfpsRQT;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27787606A31E
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Nov 2026 19:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27787606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=JSfpsRQT
DKIM2-Signature:  i=1; m=1; t=1795548209;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:CYZaELtltsSBAh0enT5j7ZoOGIXq
   4VBwowOrtURqam8nTuOeuNlpORfR/9YHoPsgEGpxJY4ZsFwxVfnIUJnprCy043fnMCxVC7UjW59
   y6LCk9PdygfAv9dpiSrrzzPXZ2tAZMpRvVdjyJJLLs+9Qq84fY6Hm9PwL5zqQ4al2YxzMrZg6VV
   8MrBJ/OwCKIkknbGyrzSE6eB5XgFweK7z2v22K8OisgkQYaF2IUmYeVhxA9Yvr203nLvOnl+vHO
   jknfEE6JByGIqAhNn9oTftGhaSv8WM/zIhxB7nmTe97F5LRKXahHVt4tlGZVCUQ+RVLhFP/Kj2T
   MQ3YXfcQQLOYkg==;
Message-Instance:  m=1;
 h=sha256:
   +L3GJ+J0EY7E7814tNmMckipB0CYcG7+/hwy6WfZ2nw=:
   m5AXB+TWLJmaoJtZTWQuiyJhB1+NuNeOj2YShLxAnIE=,
  sha512:
   NbbcRwn6hqrS/+ajJc8dWW0EUej8CEOk78YuIuecYiV9+p/ARF67K/6/wPuJlPr3HQ7jSTDtncwRC1vaIdzgfQ==:
   iyaGBSJu7pHrFb6M9HXJe/ImnKgIi+XdiKykKH3nAlOCubgsun8hp7K+nX4Xzq0ypnNHCHb5aG14EUYnVYZ3CQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795548209; x=1796153009; i=markus.elfring@web.de;
	bh=B6glkg7WHndWy7HDi6TcRv9kqBGxlE41IrpAXoKrNRA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JSfpsRQTsbhID4qFcRpZYkKge6rUu2/EWGHDhiFOYj8UZ69Vwa0fVtKJe7YQ5z3B
	 FJJ+3MPl1qMNWSM5xEsblNcaMEYjYlCCPqrPwkV4xzyz58+ZLwsfMdGaz46G6gTeo
	 0pIIGkIrh7UK1KyWa+pGlfmO1dMUfGYpaNx0fLogSWt1GuFkXTb1yR7p/evxX0519
	 PCA4cP++wtsMCQLucHp22ZndnoC3QV1tlYftpdeOUrvkpbxTn7y/IfmmuWaW3IRi6
	 14oDOiTmwGEe9Obr/0jDLkOoo4/Ry8tnjBfT0TOT/b4DWYOpJc9mqGKcmh9DwjEBz
	 xRs+0uaF31FRcKsy7w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MElV3-1xlbYZ3G4R-00FoPc; Tue, 24
 Nov 2026 20:23:28 +0100
Message-ID: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
Date: Tue, 24 Nov 2026 20:23:24 +0100
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
To: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH net-next] bcm63xx_enet: Use devm_clk_get_enabled() in two
 probe functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:323/8/m5/33YvaqVctHYGINUewLhCR5lT1Oo0YCn8702Fr3jKvp
 Y3T5/VySozSt3GENOAp+0CcoEaMgsXD5wHyR3vdV58ZJ8P3ASyL+mNJ62h60yX2BC3H4dE2
 1x5t7hxjIGoHgiwGK+z+r3Sf+Xnj7t1ncIG5zaO0iwBscL+CN9zo6ao506y791/stoAqMZ4
 tyh0jgL+QYhCa6rA/ECPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zQT2BgDKeIA=;+3GOBWOg/IWovGIPT1t97W5C2NS
 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
 mJLqvdI77lr9lPw6VQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Nov 2026 19:50:57 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Omit a clk_disable_unprepare() call on error handling paths
  and in the implementation of two remove functions.

* Omit two labels.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/ethernet/broadcom/bcm63xx_enet.c | 26 ++++----------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/et=
hernet/broadcom/bcm63xx_enet.c
index f6595fdc888d..e98130092357 100644
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
@@ -1926,9 +1921,7 @@ static void bcm_enet_remove(struct platform_device *=
pdev)
 				       bcm_enet_mdio_write_mii);
 	}
=20
-	/* disable hw block clocks */
 	clk_disable_unprepare(priv->phy_clk);
-	clk_disable_unprepare(priv->mac_clk);
=20
 	free_netdev(dev);
 }
@@ -2692,14 +2685,11 @@ static int bcm_enetsw_probe(struct platform_device=
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
@@ -2718,7 +2708,7 @@ static int bcm_enetsw_probe(struct platform_device *=
pdev)
=20
 	ret =3D register_netdev(dev);
 	if (ret)
-		goto out_disable_clk;
+		goto out;
=20
 	netif_carrier_off(dev);
 	platform_set_drvdata(pdev, dev);
@@ -2727,8 +2717,6 @@ static int bcm_enetsw_probe(struct platform_device *=
pdev)
=20
 	return 0;
=20
-out_disable_clk:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -2738,16 +2726,12 @@ static int bcm_enetsw_probe(struct platform_device=
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

