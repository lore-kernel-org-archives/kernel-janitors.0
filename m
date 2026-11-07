Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048942;
	b=EQSZqM7WPKtfy9sQwCJBeWcv7F0dHZ6jIDan7s4xo8kMmUN+DEAnZ62V+ONCGYKs8QWz
	 v17Pk5KIWaSZGI7lE+YKhV9YpjjvHSW+3tX3ks01OyajMWtUPPJprLl9ftoIdQQmtbjyM
	 +DqntxhKBFBV31d+MgON4xDAiHGtyAsRTGzrIfRRTUCuJw2j9Stx9FfqE660CIt6TeaC1
	 uxSpvh9KW38V4Nk73kKLSPS1qdyCEPOUUXCkdpQlkDOAEuombpYopUf6NQ1mxDwec/BHF
	 fyT5LiGDT8j12qRNrEPpWzRIPWErH/YbBWsFsulwqz7BIOq+8nKMTob/k2DdO/mxNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048942;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=6QzkgOsI6hSYSvZ2Rxelwg+aI/i/gSPdT9ful7PeE/s=;
	b=HEtEYt6jVckuumKZnkmDloE9RzgCtenAFHwUGSL8IWB7/jr7YN7Ggt0sRf0LBlWoqWW1
	 49XfSpVBiwrAHSn+2zBcJeXzZfhuMsSMj8Z4uBOzoT+/E5JDXYctjju1gk0NpVxdjM8L2
	 5kCyGCAs3PI8SeB4sGWKoaxUrl9kE/M1T1xKV3mDNLdW+T2g70f0W85vsXUse162k4ppS
	 d2amuxF6GAjGDC+N3S996GxBnMHI9J3YWFD/6Udnag2FhJ8N7hcMU7eqZ6XDbPLf0k5L/
	 d15fu8kSM6P4namkzHcX5qhfoqKw2aeZvpmthXYWbV34ymDdPSo0FIO7QKNoG0TDDnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=EYgMz6gG;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4719606A32E;
	Sat,  7 Nov 2026 10:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4719606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=EYgMz6gG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794048927; x=1794653727; i=markus.elfring@web.de;
	bh=6QzkgOsI6hSYSvZ2Rxelwg+aI/i/gSPdT9ful7PeE/s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EYgMz6gGR1TUpEOitiBFSHg/SI28H8c67ST1B9ULYPeZQZL3NE/7XEWrIF+tJQ4q
	 NWyS2raV+LvQU/5pkeqnI2X3m9dFUufrmcqy3r6CVjIejZ2v/lW/C2i4JUQwQ8+SP
	 +vOIE9riw3IShHXDeVLtkm3Ez3kwpdSs8EXeuMqXpuHNaESov/FnuSfjJe7cjDCn6
	 GX9NyPDPx27OAYP8wJlBh+O1gXFohl5r+LLQ6uVW72ZrraPUKPc6ywTkbTKPYDUR/
	 JcNqNXCK54q5ABKTrw3qWTAWvjmXdoF5w4GFhb1/qDSBEhL82oM4lIcjb7LCOSSq2
	 qrVvt/HecQj0qXKLGQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgRMB-1wqt162x39-00gwwy; Sat, 07
 Nov 2026 11:55:27 +0100
Message-ID: <2148bc74-0558-4eeb-a66a-e903995df05f@web.de>
Date: Sat, 7 Nov 2026 11:55:24 +0100
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
To: Chad Aldreda <ca@modelmiser.com>, cocci@inria.fr, tools@kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20261106193517.3267013-2-ca@modelmiser.com>
Subject: Re: [PATCH] coccinelle: api: add a checker for device nodes in devm_
 memory
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261106193517.3267013-2-ca@modelmiser.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kRPE/nykOWUNZXnOxGzbdSoEEQAEk9jEnqsSMiasonToWFzWmtq
 bMtsCVIjIHZ9Syc6kpQ/kTiZKi6PC6rHBBjkmIKzDXMdiJbpwYeRPQQH/mw5n/QGj8N1FbZ
 pRvsbOVrUeWrLhqzhHH16o2lRNvTe4RjENOFV0gkzNVXNnbnAyJNxq7QHd0pyZswZd6PsSw
 XTDzZp3US2NfG9yf6k/jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a1MtagUpoPg=;IF74glW9fFClojY4UQ/IXS+L6hL
 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
 td3w/8

Thanks for your contribution.

How do you think about further collateral evolution according to the prese=
nted
source code analysis approach?


I suggest to use the word =E2=80=9Cdevm=E2=80=9D (without a trailing under=
score) in the summary phrase
(and subsequent messages).

You propose something for device nodes.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/driver-api/driver-model/devres.rst?h=3Dv7.4-rc1#n9


> A struct cdev, struct miscdevice, struct video_device or struct
> v4l2_device embedded in memory from devm_kzalloc() and friends is freed
> when the driver unbinds, but a file that user space holds open on the
> node outlives the unbind. Its later file operations are a use-after-free
> when they use that memory, and for a cdev or video_device so is its
> close(), where the core touches the object and the v4l2_device the
> video_device points to.
=E2=80=A6

How many data structures should be touched after a close() call?

Are there more system dependencies to reconsider?


> +@initialize:python@
> +@@
> +seen =3D set()

Such a programming interface can look appealing.
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/ea58efe355dea21842179=
54248a01f5dc5995d24/docs/manual/cocci_syntax.tex#L697-700
https://docs.python.org/3/builtins/stdtypes.html#set

But further constraints should occasionally be taken better into account.
I guess you would like to benefit from parallel data processing with multi=
ple
processor cores.


> +@alloc depends on org || report exists@
> +expression x, e, e2;
> +identifier fn =3D~ "^devm_k[mzcr]";
> +position p, q;
> +@@
> +
> +x =3D fn@p(...);
> +... when !=3D x =3D e
> +(
> +misc_register@q(\(x\|&<+... x ...+>\))

Would such an SmPL disjunction be redundant for the passed argument expres=
sion?


> +|
> +cdev_add@q(\(x\|&<+... x ...+>\), ...)
> +|
> +cdev_device_add@q(\(x\|&<+... x ...+>\), ...)
> +|
> +video_register_device@q(\(x\|&<+... x ...+>\), ...)
> +|
> +video_register_device_no_warn@q(\(x\|&<+... x ...+>\), ...)
> +|
> +__video_register_device@q(\(x\|&<+... x ...+>\), ...)
> +|
> +v4l2_device_register@q(e2, \(x\|&<+... x ...+>\))
> +)

Were these function names ordered by their usage probability?


=E2=80=A6
> +@script:python depends on report@
> +p << alloc.p;
> +q << alloc.q;
> +@@
> +if (p[0].file, p[0].line, p[0].column) not in seen:
> +    seen.add((p[0].file, p[0].line, p[0].column))
=E2=80=A6

Can such a control flow pattern still be refined?
Would a temporary variable become helpful here?

Regards,
Markus
