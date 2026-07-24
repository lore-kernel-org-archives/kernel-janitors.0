Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B590438024;
	Fri, 24 Jul 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891982; cv=none; b=DeE3sQ3zVuyJlAfJNv1GAENCUyVHBOamIf2U/5Bs19VC2tiqdCwQgYocYryEapzQT35OEJ/PdcDNslNWVPwX1Elu5Q8Rv9WNg2Ipuy7Icvyi7vzCpsLr4nCWzYMwE8eTFljW9oxxp7QgzkZc32bdEMT+9CJ+pt5j7qhWf65sFaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891982; c=relaxed/simple;
	bh=Jdd6/iNT/z50eoCbz0CZEvHrEVPXJH8LaXfrC2oz9Wo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NeTXA8RxZLP6zG8W7J7j1v+BeL6hog8WoOfdZDOVYMM/HGKO/OOQSxFouSWsQuj7EQaPr7OXZjAV1SBZxqq0NwrGVNl3jcBrd2/RxF38Nz5kjL30dlkIrnhJyCYPw44NV+7HYQN4BQv3DkOqFX0eTaGnQ+LOp14iTfsi2h3ewLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FW4ahomS; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FW4ahomS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784891972; x=1785496772; i=markus.elfring@web.de;
	bh=E1+j8xzufHV+DZoZWwD6fcDvKcJeCD3qaDFrtxNJ1m0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FW4ahomSoDu8hnotvJRYTlORhruRcaUoQXm43gTqTJCBJBIZhYYJOdx0n7r9J/wi
	 96+VjS9jCaCBUwEwQiwaHkNqTRi+6Ny+Q+cMPXwdT3VzYBSHVOI0ED7w2dUNm3bME
	 J0ghRYt0N2hhiQRF85l3PaTjIoHP8se83RZSi2X7mJkd9go07JHrvkw6K7Rkb79++
	 B+3Xv2ItTC5mXiPfko7b3Ts115vLz7lzoPz0q2NSwRikYFwiNG3yXduV6VNx7F2kk
	 78y4S9eAD214hXoeXOgVTSbiwwHiwmkQMXa4QqtJoy0QRQAiXzVM38N7JmD87doTk
	 qYHCGQK6aR2UNsPIFw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MRk4s-1wOQjW15go-00NWv8; Fri, 24
 Jul 2026 13:19:32 +0200
Message-ID: <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
Date: Fri, 24 Jul 2026 13:19:28 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sang-Heon Jeon <ekffu200098@gmail.com>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260723184538.3888637-2-ekffu200098@gmail.com>
Subject: Re: [cocci] [PATCH 01/36] coccinelle: misc: add
 cond_return_no_effect.cocci
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260723184538.3888637-2-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EtjwMapEqHm3fCVntWgSJN4LlawKoBnYVSMI9nTZN/r+lWKJ6/h
 Hbo9rg7syFI10n3h9z5lrehv9lu05dX1+phLeEZy4LGB1m8nsmLHfLMBHqQOLuumGV8gAGy
 FFho3SHWqYIJplFb4zJNKX6olmNgkKUGZazJSbx81t/zoDRvc3XpXeb34hFzvhfn+Ypd9vz
 sjC6W6TZodf6NEKcw048A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U8QfUi9lJXk=;n89R4JcLvuzMENEShzjvuPWnjof
 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
 xRWkNUxjRAStGJlBDAipZrJnuZT5a+sAzj/DPQF

=E2=80=A6
> +++ b/scripts/coccinelle/misc/cond_return_no_effect.cocci
> @@ -0,0 +1,121 @@
=E2=80=A6
> +@depends on patch@
> +local idexpression ret;
> +expression E;
> +binary operator cmp =3D {<, <=3D, >, >=3D, =3D=3D, !=3D};
> +constant C;
> +@@
> +-	ret =3D E;
> +-	if (\(ret \| !ret \| ret cmp C\))
> +-		return ret;
> +-	return ret;
> ++	return E;
> +
> +@depends on patch@
> +idexpression ret;
> +binary operator cmp =3D {<, <=3D, >, >=3D, =3D=3D, !=3D};
> +constant C;
> +@@
> +-	if (\(ret \| !ret \| ret cmp C\))
> +-		return ret;
> +	return ret;
=E2=80=A6

How do you think about to combine such transformation rules
by using an SmPL disjunction?

Regards,
Markus
