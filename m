Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540942;
	b=ZfGXB2l/dBJRWr93adQKYRQKOixwoGN2YHIiyGTBcW1cv6ISWGRcSJmKnqMda5dwbxRw
	 F9d58VU66MXGCYnHig5rkQh71TlV2kPrm4BOpYf5AslcFIrGHKJhEWKTijOcMZMgGBIP2
	 pKrcvf8cCy2EgczEKvQLsg6NGSTMyBqDl1OhIcTmwvuVEl8UZ9h0uq3oPerY4BonsEmBd
	 6xax3trkd04OPYyGo8B58z7wwFk92WAmyL/qljHrMWGK2kcQGjxTwdAstWVhzPPcuYZ2l
	 QmDeJjdCJoFPSn+cfO6+B5hQKara1VXU0RGiSsZ67bcBSeUP9y7eMp7qiWuzKMn0Qmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540942;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:From:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=fRTclcQOyoE1yIED3kMV3TzEfAMgQeOZTxHIJQv6ZGc=;
	b=U8ToiKyDhdR3QZJh9plZzyHr0sABhBAHZUcSHZYMnsyAFSHE4vGZIPq5PbTWX5zK+Qul
	 gi7W1Sj280tsI5wJmXqiO2vFs08JK4AEqDlScmVm7zDzRGwQ96exRvVNCcirdtCdnS2jH
	 wNaOiN74zxsA92S4Ls3ZeL/28ugtwv1Jw8S7Sf9MyQ4Ddw36KlK4yGGEgf260e/5/PTfr
	 7QxG9A7iOcvFtX9EBj2etlsCRHOTDGwm+hXMD7E46AG0mNUY6Qi7yqHmWFK+IFvbIpuPi
	 mrxgy4UzqNKx7Dbog8xhrBjM757ag8TtAsKjdC5XJdeGwfAUhFhWGrcG5HXWRCMzr1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=aXkA4WFD;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF3A606A321
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Nov 2026 17:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF3A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=aXkA4WFD
DKIM2-Signature:  i=1; m=1; t=1795540939;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:M6kfR3unXgDtcUHFFodhsPoycwUF
   I3zT5Mm9Y/DHX9IBUZRSyogacoh5UBqVx6eiNrOS0hjIZhdXazUZKfBB/oMDTesNk4IOiyf6YnF
   yVUUd2RYaUukSz79uPoAcb/Bxpi01egQo3WrJ6bH44yXgv9QJFvWqEMbtUlK+gIlDitQC6x3WL+
   7KhDQYLvv5AqEK463DdMtOVei+rjhCoz4kWkmZdqgUvQuxJ8O7+v/uBVWuMAy1Po5BhIg1XIihi
   +D1R987Gd3fX1wuuRX80CFfCkSEeD5rO2QdJHHpODzomtQWHSuB5gPVXkKWJBngz/LztO5pWdgI
   jSKnFxY8KqaFXg==;
Message-Instance:  m=1;
 h=sha256:
   ZuWOG0QlwUdKqr1K2FSMphk24t6gYKxq8pFy2cnVNgc=:
   S3L5BugI304oP36yaUvwqJOgjxe9BuaeVibyMO5JKGA=,
  sha512:
   cbA1Pob1rG6wXvFF9l0Rv+/EBwsjS1mSSIvixZk2rz5MUOyhC6leP4lchzGF/KxEx5quED7tnRao3uXw01WGDg==:
   GhB1Bn6TSNWNUElEfvAlBMHDs0JLtC0bHA95+6UfjuNOquSiLe9d1M5WrcH379Y7A4OFafwVaxXg7YAuecb+Ig==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795540813; x=1796145613; i=markus.elfring@web.de;
	bh=fRTclcQOyoE1yIED3kMV3TzEfAMgQeOZTxHIJQv6ZGc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aXkA4WFD3CnEe7PUgerZjT/zRYko85iCx3LVy7dVi8EhXOAk+U5rovU1rNYlp8tH
	 upRJvH1cgBRGtilb6Secr0yQSpL7Wrrcj61pwJAl8hh2GhJiyYJvzss1xlwdOFNRe
	 A0tP1Dc8cHpuk22fCFOtnOevvvVjFPwLsiTjxsBq2ZVMOkIRdnH3t1e26c0Grxxbg
	 JUf8QmgRR5M1GJyIkjZEzxo8/06FbfCPRX6JWEbhNHanoOXvr5BZlhscRfxEt13Sw
	 PV8UvFbtWhmAcSw6ZDXBbRxCjvEUTFKkVIUMGtMLKN4PltJCHwT54OSmsENzT/T1Z
	 UN09lW1TZed3gy7U/A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6pUK-1xbySo3Mek-005Ifj; Tue, 24
 Nov 2026 18:20:12 +0100
Message-ID: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
Date: Tue, 24 Nov 2026 18:19:54 +0100
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
To: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joe Damato <joe@dama.to>,
 Julia Lawall <julia.lawall@inria.fr>, Li Youhong <liyouhong@kylinos.cn>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] net: allwinner: Use devm_clk_get_enabled() in emac_probe()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wgTR1CtRXdlu59WOwlrECY/OtOvc3Nu7RDZ6g7iCOsSwB7ncoGY
 KX7R818cs6AXHUvl7GjuBHzMaIxnsnzC8WZLE0bNht3mhdgl3W2Wm/7gC84paLDAuKenrpD
 BKeeY/9/e5oIULQaAWnHwcptk0mnzmoXQ4Yn0KUpMc+JIWILuBrm1oEr+IyDmbS92hu84iH
 C9BP/zjv06LUPDgaHOqOw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xywDQUE8IVI=;8eSaYlx3y/FS1U5kyndmYRiQkM8
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Nov 2026 17:56:11 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Delete a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Cemac_remove=E2=80=9D.

* Omit the label =E2=80=9Cout_clk_disable_unprepare=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/ethernet/allwinner/sun4i-emac.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/eth=
ernet/allwinner/sun4i-emac.c
index d7ee42b2c197..c075356cf6cc 100644
=2D-- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -1001,22 +1001,16 @@ static int emac_probe(struct platform_device *pdev=
)
 	if (emac_configure_dma(db))
 		netdev_info(ndev, "configure dma failed. disable dma.\n");
=20
-	db->clk =3D devm_clk_get(&pdev->dev, NULL);
+	db->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(db->clk)) {
 		ret =3D PTR_ERR(db->clk);
 		goto out_dispose_mapping;
 	}
=20
-	ret =3D clk_prepare_enable(db->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Error couldn't enable clock (%d)\n", ret);
-		goto out_dispose_mapping;
-	}
-
 	ret =3D sunxi_sram_claim(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Error couldn't map SRAM to device\n");
-		goto out_clk_disable_unprepare;
+		goto out_dispose_mapping;
 	}
=20
 	db->phy_node =3D of_parse_phandle(np, "phy-handle", 0);
@@ -1065,8 +1059,6 @@ static int emac_probe(struct platform_device *pdev)
 out_release_sram:
 	of_node_put(db->phy_node);
 	sunxi_sram_release(&pdev->dev);
-out_clk_disable_unprepare:
-	clk_disable_unprepare(db->clk);
 out_dispose_mapping:
 	irq_dispose_mapping(ndev->irq);
 	dma_release_channel(db->rx_chan);
@@ -1093,7 +1085,6 @@ static void emac_remove(struct platform_device *pdev=
)
 	unregister_netdev(ndev);
 	of_node_put(db->phy_node);
 	sunxi_sram_release(&pdev->dev);
-	clk_disable_unprepare(db->clk);
 	irq_dispose_mapping(ndev->irq);
 	iounmap(db->membase);
 	free_netdev(ndev);
=2D-=20
2.56.1

