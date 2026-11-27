Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767026;
	b=MMAAHcwHIg/uBjNLkvWKonW4AXkC5m13BnuYPBbJxrAXzvvFCxWS23aJNub6t1zpq72e
	 5K+JCy09/46f1XQdO9Rbr+0SoHWLLQhSzcHIsqg0sMh/HnL+xdMnngZuzbbR7W8nQK4Al
	 eyyTdn09UTxfUZ+fLdRbofbgt2UvF+V3TIAPdRDZxvpFelOC7DVmjTQLzBhK/S009urP5
	 oXIYX2QvL2ABqkxpYLY9QmuuBG7F/gzmbNWe1afsMioQGudFkJsiFLyzVda67zkyaxIrj
	 dYH4kUUAjmBiwTf6EuZEIewCR1HN75O84bYbyskk9wJZVkVGNjHkuPElDhU1DmUkZ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767026;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=jCANo1+BjHyU2/B1uMfnq0KTjxBdjgMocVHmrB1ByQY=;
	b=lHmwgu5Mqq09al3RldZq8VfGoAk1v4DjpxkPYs3UNKnf/R/sqQYpsaNFxpqUCXoiPnXP
	 I77lZxY4yuGOxfRAjUUYr4YgcqUq0hJ3ztrY6XC5B7aPmbyfvxBSVcrXKzr5vwWhQs1vw
	 R51Jebx9F9hyl0sHfy+xlEWhRff3vRQHAiupvOsdEOf7GyHQMhFtRR8CbuPQn+HzyX0KQ
	 Td9ivyNaFOvR1lCGhxuhKJzSNjAJG+vARM+J/Xqno+cFGdFEnFH+Iy1xp/8Q26UzE006P
	 Px3D4w5xnHu6EIM3B3/IsUNTxKF4TNQRuegz/xoRg5o8/8ROcr8CQNIGgAtbR8ndrSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=i9SOXG0M;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9500606A338
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Nov 2026 08:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9500606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=i9SOXG0M
DKIM2-Signature:  i=1; m=1; t=1795767018;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:C85hy+NBHgXOvN+xUiTc7+m2mi5W
   EBXfNf+mc7VN9MAHKhPro04xlETUUt4ra0zB5XdCjeYeSb7dKFaRq/oMoNWwlyMUG91glHR+Agh
   tfh5WtEaOjMgfiFi2H6Dop2AgZggiHC8ChHpqeGIc7lJKtRzIr+IxU0tdWlazDokc8d4jh7jhKu
   /N5OLUcGjliFXmeIZb1uN+1EbWXQP9bSc8oOc3MrZB6955Z/XRNFEIILZKnFKH5wQzzxSpL1MXT
   5MDsnfNCUSlVt7W9xMRINma+TmunVH+WumkWEPPLQP4JOICz0/Wj2jhZgaPQlFeak3TEzvK5GRE
   3hcECQqcrW4fqQ==;
Message-Instance:  m=1;
 h=sha256:
   Q2dSPyl8S3uJCiPBOke+XhVfb+KOee3/25uxz9SGfQ0=:
   jCANo1+BjHyU2/B1uMfnq0KTjxBdjgMocVHmrB1ByQY=,
  sha512:
   JVukxLsxWGYkHkuR6c1V+FpTbGxmX0vSJoPWS3yRqhVECOvp166e/V+PAO3+CLvXWzgh/y/PdLViGcgyvrI8ig==:
   uEv2Grjq5iJKjWb5MKHdyS+jPcdI6hxCScHIDtTQMTmA66CZxp9A+YnECZG3yAykKoJeo/ekRR5VL3u9AIugig==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795767012; x=1796371812; i=markus.elfring@web.de;
	bh=jCANo1+BjHyU2/B1uMfnq0KTjxBdjgMocVHmrB1ByQY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=i9SOXG0MTYQwRxRALFunrB1A9aYlIlXPkbwrxnvtPGyAbjssKiN7J360qdZsjv9e
	 X/w3/ORL+N/MZb+a38n4mH9i8uPyOeUDs+jkszEBNLUzKLfcDsyaTPPF6/UEsbgI5
	 wztwFdjeuOsSR1OjSh1euXDLDeHfSDCDLsqKGBepS+RmmXUZVHvvtQFdxcZJUwMVl
	 7MEp7ip/tbb6tDNJ0j7FqR9KFKhqw3r7htATFmwlsOsBJ5Cg21r0KPz27RHTl4ZlG
	 oAm+QeYFhKAUF8McPIwFUpV7U/zRQJaZmr5rcNm2+gCV0pklFNL5n/ygM8ecDa0mb
	 EgffnOiUAYI/vkhvWw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPrPT-1xtB71259X-00QEmS; Fri, 27
 Nov 2026 09:10:12 +0100
Message-ID: <1a5b41a4-0925-4ccd-b04b-2a3f0697821e@web.de>
Date: Fri, 27 Nov 2026 09:09:54 +0100
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
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: bcm63xx_enet: Use devm_clk_get_enabled() in two probe functions
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Selam Hemanth <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Abeni Paolo <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
References: <f3de129e-bbee-470d-a1df-e867269522cc@wanadoo.fr>
 <80E9692C-11F4-42A4-BDCB-E235AA2359AC@inria.fr>
Content-Language: en-GB, de-DE
In-Reply-To: <80E9692C-11F4-42A4-BDCB-E235AA2359AC@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PW0PeXkfiXCUtGbcS9UjEyYt1Lj3bNga+v2nqkT3uN05j+aqWDP
 gnvjPIvZNJYAYAVUVEVdpRgo51LMkN89JA4ibEa3AgSblyeEZWUdbdRkzwGesrwTn+DO2AU
 zs4WGVfpy3EoHIX5QT3BzuPuxZ0MQSN3tkEAtu2XUk72RvtBneG/Y607R3OkasOmikHNXL4
 WuPMlJiAXphdHpj26YcvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p7HZiJ8+D10=;DpHK/GhSRH+52IXlA4wxvqrydaZ
 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

>>> The ungating of the item =E2=80=9Cpriv->phy_clk=E2=80=9D depends on sp=
ecial condition checks.
>> This does not answer the question.
> Furthermore ungating is not a real word.

How will wording preferences evolve further?
https://en.wiktionary.org/wiki/ungating

Under which circumstances will awareness grow for remaining change require=
ments
also according to conditional usage of devres programming interfaces?
https://elixir.bootlin.com/linux/v7.4-rc2/source/drivers/clk/clk.c#L1453-L=
1471
https://elixir.bootlin.com/linux/v7.4-rc2/source/drivers/net/ethernet/broa=
dcom/bcm63xx_enet.c#L1789-L1800

See also:
bcm63xx_enet: use managed functions for clock/ioremap
2017-10-01
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
drivers/net/ethernet/broadcom/bcm63xx_enet.c?id=3D7e697ce99ceb09538cdc1dfa=
9ebb3db60236b0a7

Regards,
Markus
