Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22398394E93;
	Wed, 10 Jun 2026 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077695; cv=none; b=s7mXtnExSLoMSa0yx9fxM41oxbX5nrFrHzWj+R0U56npF+Zi69+DM9Husirz/5RN+0oPA3NG6MwpY98tub+saICHPgn428FO2AnCagKHvTVerlWSTSdcTqW/+kUx6/Cpek3rA0i4rE+bUjv9nKPD0QLQfY5lTGP1ThGS8vRJcvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077695; c=relaxed/simple;
	bh=q9G/FOcYt2+K5Fhrjm4f2XtR8xTmdH1LGMqw91VHNJQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=SDE3I9Kk2Ettei2V3+Vcm60klt3zKLtx+Ls2RNaHFVzKq0ZMRxJvmHluDbof45cdBCMVn3g6Q9UhKRuBCyEKRrIu2NCOzYD3L26TDzY7RVcCBAqbotEln+pTOx+RP93nOIgn2bCsQSc2nlwI5szdSjJCTIgKV6ImrDB+un/n9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sbwG1r17; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sbwG1r17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781077687; x=1781682487; i=markus.elfring@web.de;
	bh=4n/7ocG2z4sRABrcWy29Bo0fu+Qze/xRqTd1IARNkGs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sbwG1r17r1H2UznvncKqHnmiNKyPLrGYM4oaFrkM3KfALunCj8sFh0LOYzHNv+Rm
	 +ulJCkcEMSdOEg3K39uf4broqhbCKO289odLjVjLHByRcXza5pOkoQkLuyMnLhRHZ
	 KdXXev4ift3skv34UaIs8a8hnqfjdJiH/AkzICYzGvuHdVLo7NwDOGwPdsY3yYNlC
	 TCuVcQT+wlOx55luhHaex6msi1IIoLQ6H/W8kQ8sFniniwhBIphzz8kbbaw3/OgS9
	 OvNpRWPVxg+M5RR/BlKIZlLNY2JG87zdjaLgIU3m1CVITRgPMRiSmlGCvWi61buQv
	 FR/pCuwdHBq3plqPZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPKB7-1wrtsY1ndl-00Jk61; Wed, 10
 Jun 2026 09:48:07 +0200
Message-ID: <b9dfe41b-0250-47cf-8c03-e6af9d7a8427@web.de>
Date: Wed, 10 Jun 2026 09:48:05 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ARM: sa1100: Use common error handling code in
 sa11xx_clk_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kz1SJpCOiW+Cc85hotsS78isF45BERdFwkTAp9jpFOp7e+kKAfk
 baTku9oEphnX3QUGWD90tuD+WAdJnKwLkwC8nBLNPw4jMNqA/pvCsdzkpTazZY1vXfpgbF5
 6TKiObWGHGykC2FSrL5AS2LY5iTCRgmDdxsVB7cfRk/Gwyc+XP0JvP+bOEra2h4d4osn0w6
 YZ9Gcw5UANkAJe6md1Kvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kR/LROfwvGU=;CCGjKH3TDDr8QtA7/R04XmjRaDl
 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
 CW/3vOanOpm7TqOkjYxpvDJaH70=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 09:40:04 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/arm/mach-sa1100/clock.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
index eafeb38502af..14d2f37e0895 100644
=2D-- a/arch/arm/mach-sa1100/clock.c
+++ b/arch/arm/mach-sa1100/clock.c
@@ -112,10 +112,8 @@ int __init sa11xx_clk_init(void)
 		return -ENOMEM;
 	hw->init =3D &clk_mpll_init_data;
 	ret =3D clk_hw_register(NULL, hw);
-	if (ret) {
-		kfree(hw);
-		return ret;
-	}
+	if (ret)
+		goto free_hw;
=20
 	clk_hw_register_clkdev(hw, NULL, "sa11x0-fb");
 	clk_hw_register_clkdev(hw, NULL, "sa11x0-pcmcia");
@@ -134,12 +132,14 @@ int __init sa11xx_clk_init(void)
 		return -ENOMEM;
 	hw->init =3D &clk_gpio27_init_data;
 	ret =3D clk_hw_register(NULL, hw);
-	if (ret) {
-		kfree(hw);
-		return ret;
-	}
+	if (ret)
+		goto free_hw;
=20
 	clk_hw_register_clkdev(hw, NULL, "sa1111.0");
=20
 	return 0;
+
+free_hw:
+	kfree(hw);
+	return ret;
 }
=2D-=20
2.54.0

