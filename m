Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355387;
	b=fzsx0rVvR18JbMoALfs6K4xl8RvzDA5N2lrOjivYeACjSkKLV/D21TrNNYotI1d3dv0Y
	 hI7MCUWDSeR/G4+d1Oi35EiRfjIIpuZgIGbyUSuekFeW05aWoEq72aMSHKYkwTU/+EkCq
	 HJ1nNg1wi9PHxwQRNn2uVSBvIc5IyjxRWmBz9z/hYh6uf5ZraXVjUF1rvbafcYS87eva8
	 3XOSYExC7smK1HHL9toXlA5XhNYYdKk2FBT0jdGO6j8Z5Ii5wW8S4nhEMAVIRNjE/lmYR
	 ANv3q+Z5/XWci8bCVI8GG7eUzAY6+pLuGxpw22Rkpvm3JQB8aFJApIoha/hmrXqX+DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355387;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=pnFHaCQWkbVZh++tawp+m5jdGJiLDZ/IQQEVMTO5Hv8=;
	b=cMz273fiouRzjdFkS/lA3XEgPZF9Tsxz4Hl8hJIu1YHhxiYf79yFIvPRuFzflcWkOao7
	 ROvOzJYmz2B5zMDdiHISD2vMPVAAuaRkcs7AdR+ArZXDVJ2Isj1b2m0HY3tLVXVVzM7Dy
	 drYj6ySWKQusLVlwQgDUDyHvGMl2fKS+eG1N8GH2cPgL0Fi167+KEg6hlKYvDfX6Ru/PS
	 o0331bDoED1aYaxZIck15niQ6RHJNtfVnIKcWR0zbWr2DV5O2Qr0dj1q+wpQNnJiUjyDZ
	 gjWwKvyGX57FgBROi7Vwe/rReo+c1q1o3abuRCwjpn/SwdKhjgFs0gYsFKzAr0PcfAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=c6+XkJUx;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89B606A320
	for <kernel-janitors@vger.kernel.org>; Sun, 22 Nov 2026 13:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C89B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=c6+XkJUx
DKIM2-Signature:  i=1; m=1; t=1795355377;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:VDgXLFrIQv9ReoBW2hwSFdRb3IHK
   tocifiirw+w/iM9X4TQgRaP1i09Q0o0nunKUbdB4o7houOwAt/i23eD6b4tqMM9we5BC9WODs7z
   wmTuXGNhDIrnjjoFiNaGpn6aKAMU1bUzhvFtq1m2K1IMmqBxgT+q2Sk9LXP/Ez93hFQihWoYKu6
   x8kb4KFmbC0UPEQCJuHe+0VxgEWGFxW+5mnR0WYrwaB1CpD1Jwgfm95s1zVI242HXQWrHVbxpzh
   lc1CbrDvfnhxJ88aRVe9l1C+fjsFfF47g189BZA3NGxsIKZRJntt179q4NyARK4Lu39uKH/Xr1m
   WKg7JdGBIgK//A==;
Message-Instance:  m=1;
 h=sha256:
   rNImrOSSVd+XUjJhKKXdqsYVR94o3JlcfOviekipwCM=:
   TD2RIRvfh8z4/OMsSKimMWiBT3NqdLPm10CZ+SDEEEc=,
  sha512:
   p+DCXtkFRFH6RFgxpIsVLmMPltuFjJ3DMzC9IBSmu5ms4mE93mrISJjk4/4j769OoHKWTwplttDUMOdyd05orw==:
   ZtAoIqUoQVroYNI/ymxCNsFSkZC01a4OHji2OgkKwaHpFgwft1oejaTA1WpnrHU8izW9XU11hOioFAEJ7lFiWA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795355332; x=1795960132; i=markus.elfring@web.de;
	bh=pnFHaCQWkbVZh++tawp+m5jdGJiLDZ/IQQEVMTO5Hv8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c6+XkJUxWZ/kdn7KDkPVgFfW60HRmOZQPle4oOmKbyWgtFj6Zb9nu2kGX2RuE1PH
	 2SqyMWG/gTYf2YSBrtHWBl66PIGSM12PEujbsu4cgzOdLpJNpzlsKD3Tk/9Ryz2a2
	 Po4cW1ywZ7WWKzAyzBwbCnHErGNAql/LhXAqbX6hrkwSMh2LQJStCBT6dXhmVJDKY
	 OOfhW/mTjZ8I+iKPsu6ckMD8TaE2xyU6rx9yop9RAqBY/G3CvLSBKEwO+02YL1aHz
	 Nhru85ZdHhOEVSJ0IkxpMwC4WvYRZC0BK5e8f3QLgJ7k93P9jZAm21YEHocJzVPdB
	 oxMmryPMFzUoCDJ1Jw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6HFy-1xbiaB3m5w-00Auqk; Sun, 22
 Nov 2026 14:48:52 +0100
Message-ID: <01ed94d3-18c9-4c31-bbef-f97b1ae35ced@web.de>
Date: Sun, 22 Nov 2026 14:48:47 +0100
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
To: linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ASoC: rockchip: pdm: Use devm_clk_get_enabled() in
 rockchip_pdm_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oQjqv19gu8Lc9GnEn5oznPFZq5ZCL4TyX5+YPAQdFw+9q2IQ0o0
 j/ju9jfJRg+dml/oFwXHXHYYHYtAIDP8hvzWeVc/hCH14YGm74b6nSqwgFP+1VtIWn8QnWI
 6kR5XWXYate+5KgTuN4VMw2Q2uNJMlUfwxpe/CGPbRMBazM/hbrfyQya8YzpkFnulp41W5e
 TN72TqjJpflCmGpwxyfuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hhiti33OKwo=;StsF6kgfg2fIYy3OPufHn9cZWkk
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Nov 2026 14:36:46 +0100

* Use a devm_clk_get_enabled() call once more instead of keeping duplicate
  source code.

* Omit a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Crockchip_pdm_remove=
=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/soc/rockchip/rockchip_pdm.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockch=
ip_pdm.c
index a0a89f5bddd9..9d3bf9d8ce97 100644
=2D-- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -617,14 +617,10 @@ static int rockchip_pdm_probe(struct platform_device=
 *pdev)
 	if (IS_ERR(pdm->clk))
 		return PTR_ERR(pdm->clk);
=20
-	pdm->hclk =3D devm_clk_get(&pdev->dev, "pdm_hclk");
+	pdm->hclk =3D devm_clk_get_enabled(&pdev->dev, "pdm_hclk");
 	if (IS_ERR(pdm->hclk))
 		return PTR_ERR(pdm->hclk);
=20
-	ret =3D clk_prepare_enable(pdm->hclk);
-	if (ret)
-		return ret;
-
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret =3D rockchip_pdm_runtime_resume(&pdev->dev);
@@ -656,9 +652,6 @@ static int rockchip_pdm_probe(struct platform_device *=
pdev)
 		rockchip_pdm_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-
-	clk_disable_unprepare(pdm->hclk);
-
 	return ret;
 }
=20
@@ -671,7 +664,6 @@ static void rockchip_pdm_remove(struct platform_device=
 *pdev)
 		rockchip_pdm_runtime_suspend(&pdev->dev);
=20
 	clk_disable_unprepare(pdm->clk);
-	clk_disable_unprepare(pdm->hclk);
 }
=20
 static int rockchip_pdm_suspend(struct device *dev)
=2D-=20
2.56.1

