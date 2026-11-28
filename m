Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868045;
	b=b0CdessBV6ym87Mb3lK01HtXdTMmrBrvhkcZZUxF8JIUPUmzdj7ngwF6lOsr1OS1kFtX
	 VdXBKHFXJ9LjI7GPQwsGLl0Ld15vcVcUZnjnP79yTPHjA+x/IeL0q0R0gAi4T8MX+jwO6
	 XWD10Iu9yJO0xA6IO2WODJQEcVwxzG16WQyXA2m2Rq4qSkt/6Q5k9406OP7xqphbNdPyu
	 kLPY7rjhO0MYjFWIreoTRqyblmdU5WsgYiE0A28OlfVMvxHTYbiFxFaxoPJim/NqHEWoi
	 KDN16XJFE3iHQ4mCcyt49F4sP2csVOufDPuT2Ambx6aqe30AJK4A/NsU6AondlUe10Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868045;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=qrw8L4paqpf6T2jJ+5CO7pKA6cyM3ETHJOa/mW7TBPs=;
	b=GvkpVGN6Q0CD6+40BhGLXtrE+LeBsa3aBLI4ek+pf4y/bDTZGcIkthIECh94Wq/Yq1Ia
	 UmUpy3kPki108XIaoL0ka1Ty9BaGfJefa3XSPwcA4Sszb21xcYJh4tfsKPe/d8qPUaO0h
	 jKgV5GGce0tTe0P8o+rd5hvWWOGObpYYKAe17K5zIDrzIUz35HNE0JhOpZXUhwVEzrR5h
	 nELqW7w9DugHoB8KjYYn8FucVKlsnsyvIbp/uavx0A4KEF6qaTqUF4dy4oEqb09ytBugk
	 OPXuA4gvaFjhw5igGV5hu6q8vP0cBxR9xUQWmF14oQ7H53IbPplgN6BnA64cJnER8Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rtspVwVB;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B43606A31C
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Nov 2026 12:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rtspVwVB
DKIM2-Signature:  i=1; m=1; t=1795868036;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:ayb0qIuz0eHyU7AsitBNZ16bpjsy
   j9w3IAlAsZE0BuRdtWI/wOkaDNZNECvzXUhbD2FbNuh3XM5bNFJr/QTa1gzwcFGPi5rxBD29PMe
   Yr0SB/NG89ukfGH/Zsr+sJ+4GkpDxqY3E1f54oj64APJwr4ugHe7OynHNHIHL9dbk2l6Eo4O6MN
   WerP+lvo4ZrreR1pqqG0yiD0iomJ5ZZU1k+pdkJhgo7MGkCI4GbckHSqOoeKYjs05mkQ25l/liw
   VamlwSfOt1bgz+v/C0zgc/b3m8N3ulzzBSb2cQYe3UNQzyvRvPCreytf/elUCsBmOIZdIuGBSGW
   nqFaqcmr87oVaQ==;
Message-Instance:  m=1;
 h=sha256:
   wwR5NQ99WxwwKNtdLCj1HOCx2yxCv1GsmzBoT8POs2o=:
   NhdfRiLzUNfUZ2N7CZchUceClRIcJWB4NImA35k7qqQ=,
  sha512:
   8nBNt4YSLgUTV79khewH5ZhbCMDI1CJmMcMpLRBlOrA0pQYeJASYxL3y1EfQVYCs4m7ynYQKM/QGP2N430cR6g==:
   V/jFQtRJuCSd0+pOMmjP/oK9nr5sNsxuJ3d7+7CtKX3WY46bBS4D6o4cMJ/T0bhgCeey1d2XH3adUZ3e3uHKUQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795868019; x=1796472819; i=markus.elfring@web.de;
	bh=qrw8L4paqpf6T2jJ+5CO7pKA6cyM3ETHJOa/mW7TBPs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rtspVwVB4pMu+FZgDGwwTXagXwceCGhhWMV0dX0BD/cDB1ANozZFNegBxz0gyU0j
	 QyuTLnbFgg6gT26SQ7d2MCwdtcRNOQNXjstr3aeSa8J5Q9LTnQ5UZaGnT4dIfXDKj
	 vCNFTy1o5RFEehMa64m4KCNJVjSdtU1TS3XHpeM+PnJpsyz1AlM1bi1PF3piBla55
	 o6YWt6b0hVsEL/AaShZwyMzw/W4NGvT+OWlKrZ8zCc6Ksokp4FIX/XfsjyYswF1fR
	 XAWJZiyt5EeuEKegXtgnUtCcen9wjDNUP+LXY1gGfY+pGe5wQDZ76NE3R7xfn58E6
	 1shYPyteDyakdt51JQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkVsg-1yDWsH1FAE-00ihyA; Sat, 28
 Nov 2026 13:13:39 +0100
Message-ID: <544e43ea-28ae-46bd-8c1d-e015a372d6eb@web.de>
Date: Sat, 28 Nov 2026 13:13:36 +0100
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
To: Fabio Estevam <festevam@gmail.com>, mfd@lists.linux.dev,
 imx@lists.linux.dev, Lee Jones <lee@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andy@kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Frank Li <Frank.Li@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Julia Lawall <julia.lawall@inria.fr>
References: <20261127180709.315826-2-festevam@gmail.com>
Subject: Re: [PATCH v6 2/2] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261127180709.315826-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XeP/saK+EjdGOUaNlvoj35Mzi+ePLq+K9bUMprYNXlgTxxBbZEq
 GIo/EH6P9Hzry/qRXEJybT61x+bk8tlze9XopwxILGP6f2pL+1/I8VjFn8JjCbqYH1QYoYj
 +gvJ1nL3JzJNESYsJ/pwoY2OyveH4OTDbZ/QTLAcTNvjKtZJpcxeiLCMp7uJqMfl/W/i8oi
 r6XDevKz9eEpllxMxal2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6V79C48Yviw=;imr8760/jHsPWaUJqxbmsytrnpb
 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

=E2=80=A6
> This conversion makes the code simpler.
=E2=80=A6
> +++ b/drivers/mfd/mxs-lradc.c
> @@ -160,17 +160,10 @@ static int mxs_lradc_probe(struct platform_device =
*pdev)
>  	if (IS_ERR(lradc->base))
>  		return PTR_ERR(lradc->base);
> =20
> -	lradc->clk =3D devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(lradc->clk)) {
> -		dev_err(dev, "Failed to get the delay unit clock\n");
> -		return PTR_ERR(lradc->clk);
> -	}
> -
> -	ret =3D clk_prepare_enable(lradc->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to enable the delay unit clock\n");
> -		return ret;
> -	}
> +	lradc->clk =3D devm_clk_get_enabled(dev, NULL);
=E2=80=A6

How do you think about to use the local variable =E2=80=9Cdev=E2=80=9D in =
the implementation of
the function =E2=80=9Cmxs_lradc_probe=E2=80=9D consistently?
Is there a need to adjust further source code places?
https://elixir.bootlin.com/linux/v7.4-rc2/source/drivers/mfd/mxs-lradc.c#L=
126-L231

Regards,
Markus
