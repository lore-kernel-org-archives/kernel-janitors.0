Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158950;
	b=X7b/bLbULTuQJfhnDYMeKDs/lRNYwd3nKzeR337r4EoVYFFBm6io3JlRVB2d4n+j1Ybb
	 vLXRRyIU5HCDuzFQLarDRWSmcpNS1i4Q+HljYe8g8nWvEHPmrSmkgSl4c8kKZq/Zusqmi
	 /HuwBgaKF1txB6ik9dLVNvGV731PIZLDonjKcfoi6uKmdl3m1yyU5776ApAj2C3J/e1HS
	 tmQcXjQLGtbSf0Y5FhC0YLGNBOpJidTJpbLmVVppGSBdy/WqjNvSfnDPgrMCdfUiNB+C9
	 6Vgm9KNeRcPDnw8ocHyDpt07t0P6Oe/LPC6uiRLT1vRW5utqnqI4zIZkP2vHfJRc/jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158950;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=uT1E8pNLmkPUJcGU9BDkeT9xHNKFhCK/f27BGuqqpVo=;
	b=zNttqF6HZRuVPJBq6THsIPzSYRXdOwuaEXEdHqks1uOJUKV71ghom8MJaVK9izZP/ysD
	 sFGtc8wBYilF2S/4Kl3EF6Eqw9rM+tr/NzXRMChqmGM1VIGcSWkmS/IHONgIeo/wNH+7v
	 pXuM8nQVWHgx5rPn4kO+UaETd7bBk5iHk8XXs+7UlHxAGs06w2gLIv0XM2lJ10GK4pO/8
	 SbomneeHzmbsPxA4Wy/xGb/+KXR4+DarVCbU+9feuQ06YpCBuIBGrwESwic0Xp+4tGlXr
	 7fycHw8loYDWssl65H7G+DFisobwCAHTLNJ/a5kXN/WGD7wYxIfiQCWOywLBu1uXx3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bb4Z2Djd;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A756606A320
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Nov 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A756606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bb4Z2Djd
DKIM2-Signature:  i=1; m=1; t=1795158940;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:FmtMiXvPVKZtBjxKYwLlvTc+9YhR
   4p95RuH4hEYE4j4mNIt/rt4M9cpjYXwc2b5rkmRN7l7eIKaMLqp0PlS5IO9E4cMFsMsJwqCda0m
   ibiG+fCdZHA16QP2//iOcC6bzgL1wKvuKhhbXdJdgkbMQY+OnklCTMhSFYax55lmiOK9QWrqqN2
   5jM+MyB8B1E0YykM6y6suAnmvYnpwTHWwDHUShoiRAoaf3Kb1nh5fdI+Agb/kKsUXFf7i9npuXd
   My4hxAPE8/5yWVowSk2NBWmpgEokA3b4ntesrRV2pMc1HXLgD1z1WcaWMuEc/fOfiM9EXzB0bJh
   ZADOGMLsnQ80XA==;
Message-Instance:  m=1;
 h=sha256:
   JobDJj0Bfg4T332bj0JhEgXbHuXgcHYMedxLPw0qyT8=:
   uT1E8pNLmkPUJcGU9BDkeT9xHNKFhCK/f27BGuqqpVo=,
  sha512:
   IBNEIf8C5BHU4fZ2mf8yVXoeQoc2RafUQNrDQVMyPOYjPiHdMFv4arnBUpvlXwEArYjoS390mo3+CGiF5p/cow==:
   jHIbntjz43gXaNiM5Ii13yXdG14fPEifCCJrxK++BDM+gs9ef1so2jRsnpI8J6Tpmhu05UVpED2qR6Ys8kabdw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795158937; x=1795763737; i=markus.elfring@web.de;
	bh=uT1E8pNLmkPUJcGU9BDkeT9xHNKFhCK/f27BGuqqpVo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bb4Z2DjdjqTRXDZOU5YNLltwnvt+2aNwwfNuPR5nkscb1kx9MnUU/jt9Yoepyssp
	 wzSNxYULuDmXElhg9RTf/Hy5W1tL/MmWv9b7t0vSaS4YU4XfCLihadrAB3JNf+D4O
	 XUfKJQ+R348jl8LzV1PYd0R4AypjrliqOmiQzU9Cjv6yq8exC9rPNhRFy4QNx7K7c
	 XRe0+cc13Hbx8s3glPJqmJf2sm2J8lf5+63OyhOeb3dEdVsn7NcthZO965xU2P2qa
	 Fyj3pbAjWIPJOeeAl0EJVU9s1dzJlIft56OjdEHFEGU/nM+7cOfa6IzbIFXUp8TAz
	 Jnn3F84KnhSdkpOOFw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTfkd-1x0EsO06cX-00UknU; Fri, 20
 Nov 2026 08:15:37 +0100
Message-ID: <e2dcb284-01c8-4814-b17e-3fae2ca91463@web.de>
Date: Fri, 20 Nov 2026 08:15:35 +0100
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
Subject: Re: usb: bdc: Use devm_clk_get_optional_enabled() in bdc_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Cc: Al Cooper <alcooperx@gmail.com>, Justin Chen <justin.chen@broadcom.com>,
 Neill Kapron <nkapron@google.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
 <111e6c03-017f-47f2-a941-cba45697c1e4@wanadoo.fr>
 <2026112005-shadiness-prism-c312@gregkh>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2026112005-shadiness-prism-c312@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dbVMdjYjRGEgqXt07eg1IFF0BBMLI/aBzZIxdK1M5Iaq8Ei5Su5
 ecmuZdhgZVDBpeZkAxZC/Q9sZxrkWqSv8D6cH1XHcvOiRPa1X1oYYGCLPmCSfNtTGzUoTOb
 ri8gxmvJtMMPGmMU7rcoNRI+PXENxvUYIYTV5khM6uAogPz9YMtRUjC5my4ryXFv8498zVL
 jl7hiA88B9/zHIorSB9lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gj/BRN//wEI=;ccMbGXQKb4j7Lg8aoQGFHce6M9a
 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

>> this patch is wrong because the remove function and the error handling =
path
>> of the probe need to be updated.
> Don't worry, we don't apply patches from this bot =F0=9F=99=82

I guess that collateral evolution can become more constructive again.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?q=
t=3Dauthor&q=3DElfring

Would further contributors dare to pick corresponding change opportunities=
 up?
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/usb/gadget/udc/bd=
c/bdc_core.c#L483-L583

https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L680-=
L699
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/driver-api/driver-model/devres.rst?id=3Dd220c9443db6e5f20a60ca=
d55c6a0ae7a75c63b8#n242

Regards,
Markus
