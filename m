Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E713D199EB7;
	Wed, 29 Jan 2025 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738140420; cv=none; b=iLJXJmaXDVySL5qFFbgtY7rz3FO1hJMNGGI4PwWsOd3Jxe19OQrM08U/18eHKfh3WF9fBw3qzNL06E0H+34Hv7KTJ1MvOgZHLxRlUmCVoYe2rcZ3IyLwxyNy3uXEcgTGwdBaI181gHbwQRHsrjTOUEQm7ZAm3CY4DU5EcB//S6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738140420; c=relaxed/simple;
	bh=/630C+CIkYuGrn0QRV/2ElPy58L7cgeFfD+7FLwoMKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JaglM+7ulImwtIgod6U6R/eQxaZRnj2UfkEJ5di7DmZVmmWFho5Xe2Q5WZsiySStJXf6JnDtrbz3P7V4PP3zRv5Z297KJkC6P0rK1xdZkOc2kSz7ofq/XWkcOZOm9+QLVBJQUqqOPkWQB3NNeN6oSH0bqTHgk6QSQHTL2WSexOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=htAkK86s; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="htAkK86s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738140409; x=1738745209; i=markus.elfring@web.de;
	bh=/630C+CIkYuGrn0QRV/2ElPy58L7cgeFfD+7FLwoMKM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=htAkK86s/S61beDFPmL8eYy88jSodQwQgCsnpy8uwgxO3wL7ZVneMhCtDXLr3XzD
	 ya/ulQvPl/kWDcxYrzJ7eD1n6x8C3fNps9gjq1lCUUb31LX4qqUaq1kHXb6Q+GnbB
	 RZ4Q8+uoIaoEk4Lij64dHWG5b6GOmogmHgN55y6EkQzgMdNjVnj5PTrp0yt17AHNd
	 AXJRsdobl87/bTx6I/zHbpBlsDR2jBG6Ofe9NwjGrf658NgarQ/G3HZs4Z+oRYCzB
	 4ZS1q85fRTP2UtmbfljwWZDCF2oYyJYCtXGcBf9ec40jybsGNuscd+CiHHmruSgVu
	 krkubfslaDxTuGV95Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrwsB-1t8w5U3HV7-00lt03; Wed, 29
 Jan 2025 09:46:49 +0100
Message-ID: <fce88885-8c10-4f22-a19c-3b04430aec3d@web.de>
Date: Wed, 29 Jan 2025 09:46:48 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: coccinelle: misc: secs_to_jiffies script: Create dummy report
To: Ricardo Ribalda <ribalda@chromium.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Victor Gambier <victor.gambier@inria.fr>
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org>
 <fe13604a-2626-4641-908e-87eeaca53288@web.de>
 <CANiDSCvufe0nK_NLykSRLb9RmttNOhw3-mm6aiC=gj41Hxtgiw@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANiDSCvufe0nK_NLykSRLb9RmttNOhw3-mm6aiC=gj41Hxtgiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kcKgRWibP0MRuqDZ3WitnDD2Gm8HrfqOd/QvbiBB2IZFvyaKW3q
 3OUNoCfqyvUyEC/vhS7z3V4wt8Mxb/fwYXeSckvA4/nA2v772aFH4E9RjXYPgSMWNM2p5sI
 4ygUfE63xVtF4NUxF11hRUGoXGgnK4Y+NbdbZX6p7qrIkRvKQ0IxCiZyX75B+Asz/prIhYX
 DcHlMjwdbCqtxsOjYOmdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Hq9ZiBWIa4=;v+dcI54E1H0PZTcRdUYBRUs9R7B
 WH6vy9YGPZF0/vUewsGfFj1xEHU7WSDhiUWlwjl79VYEydI74O84uNvswM1fYRPMbrtbTWY3Y
 Rc0jg1WU87azaHkRJBKdQpH0JT3o9Zi0/lXyZv7ZbCwdtc8mnEq7+JKrRVKXM5+lEV0+/Yiay
 1+xeVk16yG2Wt1zr61Wwf3NDii2VOkWbw6M70qW0faZoC2CgnEoDmJRcnxlduTlChD1y88N3J
 BV0887i8RcDh28E9qSWVR6knJ02xPyQg3cnlSCcNhQhycyrwmU4igK9LlO1s+5vD4GY5qATPu
 TSxzaRM4Edem5FVcLgSLWfukohwtPVPyKpm6Ya+GUre5JxByg92f6uujQVthVXIOd4DPwCCqW
 1ESj2b4W97zAT3artIdlrfVlK7poFZ2qN/B9lG/RVAztTVD1NMYlHXWjw2BtXQzCLt1WmlXvz
 Fv+QdY5vqAyriVaUOfxlocvCQIa8vTFtGdOAe0abuJC5Q8ok5Rhgu2J1hky3CIk8JXBGKBCcZ
 sn97rypWF9b5ItakTRwiqU1Po5Msr+5iLntPeLzI0Z5oOhJZ9UaGgcbOLqcTMAZ/UvYvaefFi
 P9ZhXLnlDAlgJhCtX8zt7na/IsSzQgm8o8B+04scCDgwvUM8p0RiSdyKq10CFOs4kItLkwgm4
 PFKKTNT6e8C5XaQSXjzHfKFe3/r/DzZJrggXwiDLaf5amDOlTrtohZuuAGdv2/hmTSJzbspfG
 d4GSMsk4Ae4lxpKzF76csxpxM+df66+TshkGC5Q6oWSk53T1gdhwSNfRQDQUG12vRgDPT4RU5
 t8F3BD8eeJG26HrJJJthfhWjOp08qj/oCpgLtYlfIAY5MJZT3NE30u+eMR+634JqtFuW3oUPL
 /Yud7Ps98zNnx9QA18yPSFqWCoVj5qSnsTbW6aq8aHgkahl54grJ0lV8Cr9Zzf6jsnWZNe2Q5
 RjdodczSgII2lF2T/PHxgq4r88FSWPS3qndy6YJyOuHNmTOWPJGiutQoii1n7VCdbF66F6LKz
 SxS6sUCyBk3nNN9KRzJeLiqfMx9wMQZys+EYiuMrbEOxXp9NxTmbn1+RgmN1mwejZIQ0k0Llr
 aPaLTAmkILhuklylp0CD/DtKdLDCbWLduIN7n6t9LO8LsXKprJlZADm5/L9q3Aqjg9qxwXAaZ
 4TWkuSeQS7U6/9oC6eR8TeATZUMhBNIetnXtGLfHH2A==

>>> Create a dummy rule to avoid this error and run the other cocci script=
s.
>>
>> Please add proper support for operation modes around discussed source c=
ode analysis approaches.
>> Will it be more helpful to work with function calls like the following?
>
> My main concern is to fix the CI that was broken when this semantic
> patch was introduced.
>
> I am sure that a person more capable on cocci patches can implement
> the report mode in a follow-up patch.

I prefer to avoid a temporary workaround when a more useful solution
is actually simple.

Regards,
Markus
