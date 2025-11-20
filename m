Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C34338598;
	Thu, 20 Nov 2025 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644056; cv=none; b=EivAAqBo3sbEVFA69OScDAedYbScamz+6h/AUrqqczR+0WQ6DyQ8zX3hgKHNlofLYrmGJhGDo2qJh1UsUflwL0fOClvt0xGgNndb/Ad6pN1M91IfHJdwEJQrFV3d0SQ6xLQqecLW5fc+gxKVQMUU/tUri8agJW4AoCdB3pWJ7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644056; c=relaxed/simple;
	bh=QVwaJfLknOxS48s451QZj8l21YKhJSSyiBUAlzHaXhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF0PTToulFKgbFTSva107pUcl5Q1LqggW2chONkPyYMKS3AanQy1lVX+lnViFXqhDf1ZLM1A25gsXcpSFjfp4FluWPwjRYXwmPRsMEH7Wn/9ThJKlpkUp5OwqQ9JA41MOKgMexC9V91aDOv+GmzJ4a/qQFeFazvXk/usaRy7tmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=emicD4dQ; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="emicD4dQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763644046; x=1764248846; i=markus.elfring@web.de;
	bh=QVwaJfLknOxS48s451QZj8l21YKhJSSyiBUAlzHaXhQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=emicD4dQ/Yg5Z4iUE+yK1zu6AaPUvtbpP5yn//9Ho44wMVqGZ9NG9MvwjtT2nvVt
	 gSJxe9BsqDmBTxLCFphJLAbOg52QZpEdt84jlKl3loLQuQYc8D38cobiEAU8Es5/D
	 XCDtCFGdpbe2Ddci8809mTpS639mvthk6Wllf05zIJNF+6Q/i3ylHC1K7x18cls6r
	 kfv2kZhLZ8S41YfkeWpUuJeaFTK81TvY0uMS/KHrClya9WvdRY/Z865t1/cC6HnJE
	 HFjRkqqDReaF2yuQscV75wU4bI8+MBwuBdw0Fwfzdf5jI7R7vZ13BUFW8S9BhX+u3
	 9IEfAoqDeZ7pP/34cw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.176]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2BMA-1wI4Dw0Eyk-00t84K; Thu, 20
 Nov 2025 14:07:26 +0100
Message-ID: <0d5bad33-49ed-4531-b399-e548d3dfce66@web.de>
Date: Thu, 20 Nov 2025 14:07:24 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] intel_th: core: fix null pointer dereference in intel_th_irq
To: David Arcari <darcari@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20251118212106.541728-1-darcari@redhat.com>
 <32755d36-050e-413f-93b9-55d8306c165d@web.de>
 <e314be75-c171-40dd-8298-dce40f65d93b@redhat.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e314be75-c171-40dd-8298-dce40f65d93b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:soI/ym5VJyPGhcQhnkfdjDcKtqbtDhajGRqpNF966nz4bHoB6Sn
 l4Y1Ck3F8BG/MKWn1rZzQZKs79XSVoVTE5LPRaLp0AE0TxuL6XQ2hnSKDhOy1g/SkEn2q4i
 DEiT3edpAW/yZtzNA1TqNdMi9FKNkuG1YyDcwv5khyW55x98B62B4BJ0KVwcQYNQ7YYXiz/
 +P+t5F5myp7Xi8mCLm8wg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N8Gn7QX535g=;Ljg5z9WgZhP/YK8U5Qgm7nV7Iwk
 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

=E2=80=A6>>> the same array.=C2=A0 This can be fixed by disabling interrup=
ts
>>> during the call to intel_th_output_enable().
>>
>> 1. Would another imperative wording become helpful for an improved chan=
ge description?
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git/tree/Documentation/process/submitting-patches.rst?h=3Dv6.18=
-rc6#n94
>=20
> I feel like the description explains the problem well.

Perhaps?


> However, do you have alternate wording you would like to suggest?

Under which circumstances would you get into the mood to convert the wordi=
ng approach
=E2=80=9Ccan be fixed by=E2=80=9D into an imperative one?

Regards,
Markus
