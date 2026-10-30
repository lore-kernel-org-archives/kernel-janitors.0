Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382514;
	b=ZvSk/2YdwJCbYmFZOPgiwgGmE+rK815QShp1SvyJDu6qG5aUPAJhe7nfweLdLcL+ZS4f
	 WJj1HKItRzDar/tlbF2etS0JHs3RIfWzQq7+IyGth617MdQqynZTXDiZi1qlqDx9Axoz6
	 FtEVxLuOs0AI+VY/eq21SmyPfzG+byzsjBX68jcQ/oQ32qv2aZigixaCUDwPEJg8fuEAB
	 Zo+3o9ObYvELVgiMkzmbrW3OXfn6TOcyRhi4RXxUl2n+j+bFsCyTQUi2P4OgVG4GS1sbc
	 VnXuJdeFu7GI4/xrgyze4HJIfqDtykuKui87cagIe9IZsegYQjQ5NDFRuEF1rFPLkgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382514;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=kpJ1lUE9SxSQmArdBjvgK9L9YCOfImZzQHu/97bma08=;
	b=z8CHmkViv0gbHsmSs029Qv696EmtpuUU++c1Pb/x/cB/N/YGk5mk77/BblR0z9IbPgKl
	 BpC1sP+x6NcVMv/tvorxIpjfU2Pj+OsOhfUFuFsFosLzCcttA+dKjWgHjXJfHYOQgB3B4
	 YbYFi1hBRtZHiF1vuK3DsjUiMUcPMW78akheAhKk1s+7a6zBabah6C1OBoiSuKjKwslup
	 acnNfiiYT02TqqU4Be1WwRMEiXP7BlrwUSbvZrROz5NHGrOJaRr7P9l5/sr/NJoG9W1BA
	 e17pjSP4V9ki8N+orzrK5fqvOQSUqztrWsBeYkKIr7yTAqHciJdicomMBedhh9Ic/ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Sma3tG0I;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE160A260A;
	Fri, 30 Oct 2026 17:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDE160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Sma3tG0I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793382510; x=1793987310; i=markus.elfring@web.de;
	bh=kpJ1lUE9SxSQmArdBjvgK9L9YCOfImZzQHu/97bma08=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Sma3tG0IsPBbs71NzF3IzCbf7czMPX/SodEwJKeAr2H7yZn2DZ0vG605S6sOzJzL
	 NPjjD2rc6fEZfQgo9RucwFivL59l7ie884iOWzCVM6CNgsQTD52S3XNjXG2sJQZ/c
	 bzEBWeS8Vpw6dgiJ1gll+7xB0O3GERgwBD/UbNw/2Lxq7FdJp8tkPgsUcc0Djgjrn
	 w+taW7swIuSBDHKzJQxygIS6wnoB8ZnIrnzL/zdV2Kyo0e0NWqcJEUSDSb6ZJSyrs
	 I9jrtktgHQyhpXK3b0JnHuRN9EnuUo4nPuI2LO3fa9zg/BVTR5rRdiWeD4EbmeN+G
	 rBYs/ThdQj/MpCd3aQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0Igl-1wZxgv1dcF-013399; Fri, 30
 Oct 2026 18:48:30 +0100
Message-ID: <20729143-9d1e-4d8a-989c-c76f362c5612@web.de>
Date: Fri, 30 Oct 2026 18:48:17 +0100
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
To: Reid Downing <skibletz@gmail.com>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261025170833.1316443-1-skibletz@gmail.com>
Subject: Re: [PATCH v3] memory: fsl_ifc: Clear global controller pointer on
 probe failure and remove
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261025170833.1316443-1-skibletz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yiPNuQz2a9Nuo96BOoNKcjjb/qKypb5Defl93vRfa5ppZ4hNcEh
 gWajoEnXzuNu8I79338tUQyTiVbzRpw0jRIpzyuiiroLxS1YruvplDQGOB0jlAaMT8G7yNB
 4GXWRuPlMORM74niGnOkuGLE7N/fO6pOpBhVKAB1EqAsKmf4GBeSr6KHcevNp3ZLzJBcAE9
 p8p1MhFjOraEPHu10YY5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:peTx41rcoAo=;vRRmX6QBAoh57rDhWYg70e/eKUv
 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

=E2=80=A6
> Clear the pointer on the probe error paths and in remove, once the IRQs
> have been released. The global cannot be published later in probe
=E2=80=A6
                          ???

Is there a need to refine the change description another bit?


=E2=80=A6
> ---
> Changes in v3:
=E2=80=A6
> Not compile-tested (no PowerPC build setup); the change is four
> assignments of NULL.

It seems that I am counting differently.


=E2=80=A6
> +++ b/drivers/memory/fsl_ifc.c
=E2=80=A6
> @@ -218,6 +220,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device=
 *dev)
>  	fsl_ifc_ctrl_dev->gregs =3D of_iomap(dev->dev.of_node, 0);
>  	if (!fsl_ifc_ctrl_dev->gregs) {
>  		dev_err(&dev->dev, "failed to get memory region\n");
> +		fsl_ifc_ctrl_dev =3D NULL;
>  		return -ENODEV;
>  	}
> =20
> @@ -300,6 +303,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device=
 *dev)
>  	irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
>  err:
>  	iounmap(fsl_ifc_ctrl_dev->gregs);
> +	fsl_ifc_ctrl_dev =3D NULL;
>  	return ret;
>  }

How do you think about to avoid duplicate source code a bit more?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv7.3#n526
https://elixir.bootlin.com/linux/v7.3/source/drivers/memory/fsl_ifc.c#L194=
-L304

Regards,
Markus
