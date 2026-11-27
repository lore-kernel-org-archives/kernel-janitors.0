Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788240;
	b=dQycJ94RKI03GDPgzk97lRi+AT5qeDArT6iJ9RRP1l7QKJ9zZYHC1iDhKCYHnvxNn9kj
	 m2CzDrMHPKRo1G9FvdwFF5IxdQxixgMoO9avlX1+05b4fxNa1c1gBmhG/Hzsq+VmuHBO5
	 z0AzVZgvZyU4q8iDfGk0zJ7Z1bMfAiQ+ldX4hpGVdbHRhOgD0IGeXAi7cRYekdc+YeAtT
	 kfd/9O4aNma1tCeCVxlKO9DsBw09H+1Pta7eukoPwLnZM3U5i5tKytRRZ2qGSZUN+pB1p
	 zVSVQFGjXfAqglQURD+WvTRAmFnrP5+L7jdRzfDKOgsGpkVTSMkXWYzbOSDfJGi07FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788240;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=dIzYnYYMaTwzjShAcLVHdry4SlK5tN0cpNluHURwl50=;
	b=h93p+CVeia1CPEvhCjdyuciJg2nFLVsz1PR43925l0NDPO1vvikf5r40vhX2CsY66CEh
	 eXpbKC4peITKfxt2ezxv7s3ch6VncKiTf4mUjrZmsMIcUcLBaBg3wK4pTVBbytaLiDkwU
	 s/so3OK/xvOnFaei7xvgZW5Qbr5aoDlV0cT6q0z2BAhy47Avl9nnOvys8XqqVm+Htc6RU
	 P11eNrC3o3bJAyF5vWNLnfGmvyKIazFXQDhndpgsYdztATH323kJ7g8tbPn4KezwE2rek
	 /AzgTmWs/npyADEMwANyqXeZfy7ONn/WVGeX9vMTIdftOhbX8pEUtKGcviKipqq3atg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=jqRqdO31;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E309606A324
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Nov 2026 14:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E309606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=jqRqdO31
DKIM2-Signature:  i=1; m=1; t=1795788237;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:uV2CUwnj8O8yRKjdCfdKmz6oD2Bs
   ldNs9ZBd0JKM3n/9ggFGfn0V9prMxHxcHMsMAbZNXTmf2D2XdhdxzdK9b1P0IcmjjS8lcgWkEJx
   Ne6MdbGum1Qo52nmaACGn2X0AKSydyKCZceozsGtNae/UQTJkqdUt+FY60HQOs9yHBW2nCGLvfe
   SLI2e40Wd4PjvjC6P2+Fy1/qidq+G3a2lytcbW2retbyptL5p6craqwMHAflSgVHgNXSx0mD6En
   8X1QDPg++aN97mrK9os8sHm2PylGRAjXHJ2+L6Dz5Bz+nncDXcc6VvvfTmUnOW4mVcrUF+uMsfN
   xMKFtv1bB7yGJA==;
Message-Instance:  m=1;
 h=sha256:
   9carCh/p8G0Kq7K/FIShjOOBTeRx8klOmz9ddy59CdE=:
   u2u+zc7bg+6jtjIvPM4tFXQCWko7YDRluawfrzPIFrs=,
  sha512:
   SjGwCDit0KiyWSmxoAtsvWJAxyOqs7VoBw7GXVSIfURsUqU8AGrj89bQWpGgwz3aNhv4sRO4iFgZ+O9ZAmy6Ag==:
   UeUaDAT8W5rbO39wn6axSHXECniF+8kcR1mU56+VBgvtnx2Aw2fOX3gRj8y/L/X8+38UFubf26W8iPfpVwqWXQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795788237; x=1796393037; i=markus.elfring@web.de;
	bh=dIzYnYYMaTwzjShAcLVHdry4SlK5tN0cpNluHURwl50=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jqRqdO31oe3DfhNLx+vEl3Aor1NqIWkWeuII0mhLTYgU3GTDWzwWdXeFLNDFbCJj
	 y+6TWufnM1Ic1A33rqSTiMouqTPdqyDIXmX/6nqcntyus+0Ly1eq8ncou1lL15Luj
	 IXQTspmcdYJKuiWwrJyRE9UGIslD3J6vmirfTOPjkaoRlokgcdqZnqFCYJ0FwJo4h
	 YVaQVlS5ccar+ODJpYLSuEXM8ukCaLunAzytzxAJIlduVFxigvUzXULXoBXHOPa0S
	 8KKsU2KS60h5sXWw+Ra4W41FhWENL1BO3tlP0IbCOrIHnIn2B+uIM3EkR7Asmvee+
	 npxRnq8fSM1ZTNCaiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyvB8-1ySdiQ3nH8-00sZyr; Fri, 27
 Nov 2026 15:03:57 +0100
Message-ID: <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
Date: Fri, 27 Nov 2026 15:03:52 +0100
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
Subject: [PATCH net v2 1/2] bcm63xx_enet: Prevent unbalanced
 clk_disable_unprepare() call in bcm_enet_remove()
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
X-Provags-ID: V03:K1:KgBftyQvTcfkLhePclSnnX7FNb0BvEYqOakEtUOxK+sVgHjg2Xc
 LiDTUEZHiZXLQVPcLwpAC4xvXDDs1MTVablfUlycaDH6Zkb/g0Pekjmaw8YJAdERgJSPf9f
 tFIaTN6N+6gMBYkpp4HFGCgd8ZSYfHK17f0Ja3/JEkQkuqTrp2riS1vmMiO9CwzdCWcc6Au
 qGcUGSQW6/CSE2s1tuxlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BC/w4KidlhE=;KTxs4qsSC8ZlOo2RTJvR7Y+ysbO
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Nov 2026 11:52:23 +0100

A clk_prepare_enable(priv->phy_clk) call was specified within an if branch
in the implementation of the function =E2=80=9Cbcm_enet_probe=E2=80=9D whi=
le
a clk_disable_unprepare(priv->phy_clk) call was unconditionally performed
in the implementation of the function =E2=80=9Cbcm_enet_remove=E2=80=9D.
Move this clk_disable_unprepare() call into a corresponding if branch.

Fixes: 7e697ce99ceb09538cdc1dfa9ebb3db60236b0a7 ("bcm63xx_enet: use manage=
d functions for clock/ioremap")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/ethernet/broadcom/bcm63xx_enet.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/et=
hernet/broadcom/bcm63xx_enet.c
index f6595fdc888d..cc9a5cd2a2a3 100644
=2D-- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1915,6 +1915,9 @@ static void bcm_enet_remove(struct platform_device *=
pdev)
 	enet_writel(priv, 0, ENET_MIISC_REG);
=20
 	if (priv->has_phy) {
+		if (!priv->use_external_mii)
+			clk_disable_unprepare(priv->phy_clk);
+
 		mdiobus_unregister(priv->mii_bus);
 		mdiobus_free(priv->mii_bus);
 	} else {
@@ -1927,7 +1930,6 @@ static void bcm_enet_remove(struct platform_device *=
pdev)
 	}
=20
 	/* disable hw block clocks */
-	clk_disable_unprepare(priv->phy_clk);
 	clk_disable_unprepare(priv->mac_clk);
=20
 	free_netdev(dev);
=2D-=20
2.56.1

