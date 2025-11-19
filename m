Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1233B6F4;
	Wed, 19 Nov 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556970; cv=none; b=S/5F6SCS0RaKyuW29fxuQkTDj0IKz/gU+HxD8iePtGywUI7d0PSJOR7QYV9Kal0aIxSAHKrjHgPBqj4A2oYVUjLFA8PAaH5oxUetZK+wTG9D6JVvn2aqh+ehZyfHG8W5xkRN35zkcywSwUQiYL40XZjWa4C5V3/rTNv0gPOsTbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556970; c=relaxed/simple;
	bh=OGh5agRfA6z9pXHG9RGJn9fRf2k6ZDQG99SRi2R/DhY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=X9NUk+9brsg1XH5Oy8z6b33a+Pojk5wgCrxV4KH4p+vlbkh/QbGvjRkRjjWgpc+PCv5oPYj3k1LZhrF+qR9m7i4l4AZF9hf8VrhP5sSP5WtEKlFW6GwgS9FmplDIbVYWxI73jz5IMtIribDdBEMxgQ1AI8WNG/D+uaU/10Gvxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Y9yBPUss; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Y9yBPUss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763556958; x=1764161758; i=markus.elfring@web.de;
	bh=iel+gN/t7yA1pPBi2oSvhdc9SzPl6x6vqch6Qlq4Pu0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y9yBPUss8BeYw2Uzgwy5eCfCX1rvlbXbLOqOjBMRKfrC4wwkCguE1hD0FRt1O5bh
	 wyoe8qqRXArTTRDHiYJxZsA06lNWOGKIQqI4i1BI52E0FQki9oB8BwgMHDV6lDUEW
	 EvUbHJ7hDefAkPiNssZGPdnb10GhZ2LoO/mllIl4Cms7SM23ytTvxwFXHUb8vcJfk
	 QlbgawmyMaaRtSF6MzbjGJRIsoTrM7aLZ+jr+XtLttiteghB7dozYy5ixn9O4t7r2
	 NiqWcfU8MpJqzwOXbtnCwIyHtN8ATjpPxrJt3Iydj8V4Cig6e+abwPqYh485EO/qA
	 oNVgDfm0YG2ZIwdK1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.228]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M1rTQ-1vJUnd3t9M-00EqIH; Wed, 19
 Nov 2025 13:55:57 +0100
Message-ID: <32755d36-050e-413f-93b9-55d8306c165d@web.de>
Date: Wed, 19 Nov 2025 13:55:52 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Arcari <darcari@redhat.com>, kernel-janitors@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jerry Hoemann <jerry.hoemann@hpe.com>
References: <20251118212106.541728-1-darcari@redhat.com>
Subject: Re: [PATCH v2] intel_th: core: fix null pointer dereference in
 intel_th_irq
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251118212106.541728-1-darcari@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R+IQicIvTwRCXybE06HAiwTWPWJAvZNoXIeCqVVDXRO7QRI0Y0F
 p+PF6GoYsQKmgj6Pud/RLRxU8jHNXjnbHZf+dvFIyQiQdB3HoI/4thBAErs06k8sU/5+PE8
 8lPDnujAE4X5ZNYJfMIim0KDii3Z2lszkjK5YrjUVF0riQrKV+xTSsT2X6TKvA4huTW9a0C
 BnqW3O9tbD1/HO/h2pqSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:26tMTjH8Tzg=;Lo5qVLz8z+vnbz+3EHrjDToURYh
 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
 YdPiuYFKZJqpiaOSs=

> In certain cases intel_th_irq can reference a null entry in
> the th->thdev array.  This results in the splat shown below.
> The problem is that intel_th_output_enable() can modify the
> thdev[] array at the same time intel_th_irq is referencing
> the same array.  This can be fixed by disabling interrupts
> during the call to intel_th_output_enable().

1. Would another imperative wording become helpful for an improved change =
description?
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc6#n94

2. You may occasionally put more than 60 characters into text lines
   of such a change description.

3. Would a summary phrase like =E2=80=9CPrevent null pointer dereference
   in intel_th_output_enable()=E2=80=9D be more appropriate?


Regards,
Markus
