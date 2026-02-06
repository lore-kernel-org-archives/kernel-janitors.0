Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9617212542;
	Fri,  6 Feb 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387746; cv=none; b=Sd03I+t0IRMo5ORrsFNuLzevqkIxI3CBsx7QfuzZyjmFVe3gnSy5pJ8Dt2TFKvjE4+ODmLuH5H1ioNDyseTrIxafapgwD17d4IJSFjFAJLzRtN2ZJ1pGwoWLI0H9iNmPu2gU8dldk5SOQadPDqv7vc0jCAbykbYOEpdASkFnwf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387746; c=relaxed/simple;
	bh=o62dTIOfNtsiqRyjq85WvcyZ9UgquQxyQ2UwWd4KYSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qk6AOdqtaASSKdrrT0vz8+peE411dyX004jUqvq5tAwyD9dtACEPsG9xJgEZWLvD15gn09b3byvhTKpa6OPVEfTZbMoSUmeQL2s1KfA9Zal0odjnIDftUq4pXhr+/WvVjfZezr2haIgdpJjzXMgC3qTrVEzd45UYihCUB4Q6t1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j0uDo9Cv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j0uDo9Cv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 43E924E4243B;
	Fri,  6 Feb 2026 14:22:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 153CC60729;
	Fri,  6 Feb 2026 14:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2190119D1ECE;
	Fri,  6 Feb 2026 15:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770387743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o62dTIOfNtsiqRyjq85WvcyZ9UgquQxyQ2UwWd4KYSA=;
	b=j0uDo9CvvBYNQEJ4GtYdy665+SekrmHe/8xUmWBFDkfgL1xUV31Pas8jyIkEJD6BLFgPrR
	zbjRNXZD1u0miM41aTGHTOtFiWbJ9DfLS0gbHzHyWyVuEsJKxl5WHP1dQSswb5OZItWL3M
	JCG6MFLWFHvpkHIEEw6neBSLrdvQuOtrpQIjzlvpRwUDjm0aUiB8Q1xk950GORRCSaKIGI
	bEKO9G0RFVRuem2DWfTW/5KXviCb7k57qA/RtiLCXv6ngN65h9dLHVCPtBCGvf0XuCznqx
	55j3dMYgQam0Z6DdtHfTtvo5VaU3nhZ4/q0Xr+4s8zBQgTtkcEIQMDcAnQyIiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
In-Reply-To: <2vxzy0l6x8kp.fsf@kernel.org> (Pratyush Yadav's message of "Fri,
	06 Feb 2026 15:14:46 +0100")
References: <aYXu7uqMQdZRMmQF@stanley.mountain> <2vxzy0l6x8kp.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 06 Feb 2026 15:22:19 +0100
Message-ID: <87y0l6dk9w.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 06/02/2026 at 15:14:46 +01, Pratyush Yadav <pratyush@kernel.org> wrote:

> On Fri, Feb 06 2026, Dan Carpenter wrote:
>
>> This was converted to a _scoped() loop but this of_node_put() was
>> accidentally left behind which is a double free.
>>
>> Fixes: aa8cb72c2018 ("mtd: spi-nor: hisi-sfc: Simplify with scoped for e=
ach OF child loop")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>
> Miquel, since you took the original patch through the NAND tree, can you
> please take this one too?

Yes I will, thanks!

Miqu=C3=A8l
