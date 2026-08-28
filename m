Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5003F1078
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907046; cv=none; b=JloI9pQI/ZeJ5+L59DiakvFp+whTIfwM7ecFT251oq58bntOeg3aMvlT1xmpcKn1B7Sxmi4lc/f06bFeDUFZzW7kNbmK3kHfUYLHsmLvRNxrnOa1jdexmYSvUnYCbkpYqZc7DsISoPGTqkUQ9BDCH6buIUIZxZrMPEqmFUrxj08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907046; c=relaxed/simple;
	bh=NmLrTAeeZ+UXmPpbmBGwAGHgqJvHRectlvYQHCMAWXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=u8XdfWwVCY8t/FOBDGmhkgjlG/f93UjDaydv3o7+6mkyXwTHuRKaoMTMbwgqIWIkYH1PB698VOgPKFoBIgP9zwoixUQh7edU2iA98TV3wRTPU41wSGSLCIPtK9nhtMDZP6M78roMj80FSHJUs9ImbQYfKqn/QqeNiQL9n7KySO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FNXIfvWN; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FNXIfvWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787907032; x=1788511832; i=markus.elfring@web.de;
	bh=bcrzOY4Nht9x6GH8REgdVymwusaqYWhDCd4ja21lmrk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FNXIfvWN2JaU8R52OJ2wpWNBYnUoM913rXsqq5KOV9Kyuoh9Eb9cuGT6Fr6Z4PXC
	 M9LLoP82nT7JdsofrEodJ1MqqD4Up3AEDG2QkBZmb4YNis4OQ9rd71AjWPtrH8+hx
	 uJtnceiNU6O8a6BX5X1MZOPe9pmqDKWBrSPnwTtM9AGc1v9PeUeisRjD5A+AXYJcX
	 yBeHideHhwLdqm2goyrNdpTt+L7gQAuNuACEP7B4Uxq5MqPB5+N6dnDRST7hoVAj5
	 +cRYLm1t4lG/TuT4h6pX3OT57k+PA1EMcP9RSVBOOammBD+xSxvcaR5pkoidE8WaA
	 vEEhwrWzqbEtNIkcHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1rTG-1x249X3QFM-00HF0Z; Fri, 28
 Aug 2026 10:50:31 +0200
Message-ID: <d1901bd3-5fda-48d4-a8c1-cdb715636fa5@web.de>
Date: Fri, 28 Aug 2026 10:50:19 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Checking run time characteristics for longer SmPL disjunctions?
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
References: <95c4aa23-d13d-4ec3-89a8-5df56844addf@web.de>
 <acc76ef2-2a0-f716-ff28-f8be945db26d@inria.fr>
 <0fbe54d4-d595-4fcc-bba7-14da44ca3f0d@web.de>
 <3f2a4432-375d-4a93-ba53-11006d0c2fd6@web.de>
 <b7cba424-69d9-5534-85dd-e3cf5098e4af@inria.fr>
 <a6f6fee5-d935-48eb-82b0-63e202f25529@web.de>
 <eac84dab-f980-a9fd-e37c-b8259140b4ed@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
 Denis Efremov <efremov@linux.com>
In-Reply-To: <eac84dab-f980-a9fd-e37c-b8259140b4ed@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jAhz7sxN5v8CvOOQr416b+O1Ev1csHmWlzMZO/sobhcLqihl14S
 xE7TQVkI3xQFZFuzl3z98+EHnfDMxC8yDEtBdg1cUIvAjdLmjw1IQoPk6/kCd99u/yViiKY
 7E1e0PT8n8Geu6rzKLtkP6yzYhDGRJangEE/r4/NfLEjh/f60dbDibXdQjOfY7oE7aCye3i
 BgKCZW54cM6ERbDrJbUpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6SJBdY70Ico=;5TlXHn2KAayimvDoVp6mhITFVty
 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

Am 14.11.25 um 17:11 schrieb Julia Lawall:
>=20
>=20
> On Fri, 14 Nov 2025, Markus Elfring wrote:
>=20
>>>> Which adjustments and improvements would need to be applied so that 8=
70 branches
>>>> can actually be used for an even more detailed SmPL disjunction?
>>>> https://elixir.bootlin.com/linux/v6.18-rc5/source/include/net
>>>
>>> Time and patience on your side?
>>
>> Maybe?
>>
>> 1. But I would prefer to integrate additional development resources bet=
ter.
>>
>> 2. Did we achieve the common understanding that the Coccinelle implemen=
tation
>>    for the handling of short-cut evaluation is still improvable?
>=20
> I have no idea why you are still trying to use a disjunction.  If you ar=
e
> just trying to make things complicated for no reason, I don't have time =
to
> help you.
How will development interests evolve further after the release of
the software combination =E2=80=9CCoccinelle 1.3.2=E2=80=9D?
https://lore.kernel.org/cocci/cfce7bfa-bead-443f-a418-8e79e9f1cef3@inria.f=
r/
https://sympa.inria.fr/sympa/arc/cocci/2026-08/msg00018.html

Regards,
Markus
