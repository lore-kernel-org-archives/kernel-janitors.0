Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170C19B59C;
	Wed, 29 Jan 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738144599; cv=none; b=We3UMrWQzxGS3F5aqqkrakhsWWjOuoJ2Neen/qZe/9bOCpPRSXJEMO3MrJJIOvLNqtIzBukCUAhkgwNHJ0fQNcibtmO6R/x/KZShRMDjgW/ZoKXxN+aO6QUbzRvbtlz31ubn9FXAZNsmanNubYLumrGbWNFz5iVta/pnJy7wjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738144599; c=relaxed/simple;
	bh=dvFOImcNLnrl8V4L7jerUtWNld1BzBEzK1IVbzafeuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFig0coacGZu64MSdKTKDmvVenJkEcfgMHEPRgrrbTkWCCU8FJB10Eo7s/rhj2RoyPUZdhaIfxzv6YM0SXZ9OtxFtjKWYQ4YkONkXBOHtl2VL69eiV8EfGnHn/QbuyeLlrKFKfzW2Xa3DCR+kfq4U/i8UrrpfCtybK76EHLROTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=TJTQRWlV; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="TJTQRWlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738144591; x=1738749391; i=markus.elfring@web.de;
	bh=dvFOImcNLnrl8V4L7jerUtWNld1BzBEzK1IVbzafeuY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TJTQRWlVPvQNwJ66lfz3Tnn0gNimFueiM1XZhBHHGDU0BzRiJhikXRAMCc6qn/S6
	 n10b3sK9O/4d/S1F83jasBi5q1k1mxv1zHX/7D4i/Z8sVXWE/coFS5dmN26BfdP0t
	 AMuE535QHJB2EP9eYGMifUQyUne4XeuebXbckXtF0yjLUHFDBGHAd8oXinZAuB6rE
	 9LJgxhrpIK6EELrHEgktwuDGmmCQh9GWj+zs8xNltrtZ1Gt6ydm6UN3wwNldwaBeh
	 66Q9LTPjAnhJYUQ+6eeVy3hDwZSX2iuuMvgNYo2A4kP6we2LbPruj+IihNNsuJOoU
	 lXFFg1EcXRmUUWUvvA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzkOR-1tGZws2jk9-00tcKb; Wed, 29
 Jan 2025 10:56:31 +0100
Message-ID: <7372f92d-9703-4b03-b048-b1d6c35895f6@web.de>
Date: Wed, 29 Jan 2025 10:56:30 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: coccinelle: misc: secs_to_jiffies script: Create dummy report
To: Victor Gambier <victor.gambier@inria.fr>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org>
 <fe13604a-2626-4641-908e-87eeaca53288@web.de>
 <CANiDSCvufe0nK_NLykSRLb9RmttNOhw3-mm6aiC=gj41Hxtgiw@mail.gmail.com>
 <fce88885-8c10-4f22-a19c-3b04430aec3d@web.de>
 <35764b92-edf0-490f-beea-c36207de4cc2@inria.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <35764b92-edf0-490f-beea-c36207de4cc2@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BUZID2x87oTK4BwRkKB13QSLLMoTDYrcWjWONukuGBe+If2NX80
 up73xGMY1sgWzu4w3UwMLk7owft9pd87HJ4z1XcfwGXbXMmNQd64ZcPFlDeSqo5UB/mmT2i
 56DvA6CrFsIXg9o6tawxf1jC7iLiQ8OgerNQ+9EVaPFoajz4WZ/7HuZj00ke0w1YjU70kIo
 sArqE1luDm7KK9OkdIrfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UBLqc1X4lmo=;eRgxwNo3SNGtSsHQCxLA6rD+5fu
 jZD/80GARbStOjjilzonSM0m906epO9e05Y/1qVdAM58cy3TIMTyArEnHx4U288R4pe5dOeRw
 dz/uqUb01i2DBosIbOIXCfUAPq+wyXSTEEtLTcVb2oyU/bePKBFsuNA9ZB8tAYpdeGPhEsvd7
 yl36set+zsWi6uojPwa8VbtlKedBHJuUKW+9QSR4KYXxktL0yNPpc2HXSZkReirC4cWWshGrr
 l3ZARF4qtM/0kfelmMiRfKwn0X0CPAtHeAyMvsp/+A70XQaZ9Z2kuPuXjR512yzCqn8Y/J3oI
 2mxRwXzHXelwzt7irSCSOX5drq5ESbTn7Yjw+sMVOtCALSKbsO6BLa86MjL63SesSz/OerLLI
 IhPu2yUY55TQXKWD5Gceaeub2wsi/mOThsalUF4AQDjNKDGhPcQz4MRneCbbhsWahveoE5TVz
 u0yLj8BoPBUcGsc+v+ES5g1ipzmyCKlPs3yCN+nQxyQRVgYlp5xQ64U+c+8pkpIAIN38h1BCD
 xhm25ITJOOwoSDaBWA/OXlVN8bcgnsHLS9rvHXLuUJbR5+SblI9KbJgpZ6MMSUh7FCDiUYFhR
 Okq1YC/0kGnqBYESswRv/gcslrWlndTneknb8r7zC1DG6JbljRRATUKAySHkeVpfjIzOfvFLt
 uWWfqo6QcGTfD7W79Nsx1sdIetCyWLXWcIghq5byyVzhvUsC9NHQm3pr9rgX8q7Jz/7ra0Ake
 Tf/5r8GbPw8S8B9Gqv2p+PVhETHkhJKbuIFP22qVEL16ohl4tQXS2mwpXmysoKJTc2Qy460Cg
 tT50Ijr0MHgte5Kqk7hiJ1A3iFN5FeSWUX6HImlr/JF7yHwDE7DEUhasBuw3t8zqtep8blSAN
 gkEfNBK/jOxdp5ZGRT/SAhMYntKMx2o70wjel1VjJdW5Ix9jp5MN/7dwzhrBO10kt7Z6MX36S
 DUK3ilII9g2tMlrmaxQJTAm9YuNpL3U/zyMEUf4B3TnXMEqaRniXCs3vxkZPzw9Z3IUhBlsFu
 RPuIv7IQ3vMUL+J8+Rtjrl2dbz0SXnvzSe0XOMTu6VgYRWQ4vkUA4JuTQAZUSwO7As0v+QL0b
 6cXfd+iKSa/F8xSAzNU7Slq68qncaBaSqlI632pH8aiPYu4C23iBkL8lZytn4TM0QVS2FzsaO
 Tt4gmokhaZbRSeZxquMmtyFgPn/XOZgst+af1z9DyAg==

>> I prefer to avoid a temporary workaround when a more useful solution
>> is actually simple.
>
> Markus, this is not helpful.

I got an other impression


> Either provide a fully working example

I contributed some demonstrations for selected data processing approaches.


> or stop nitpicking useful patches for projects you don't maintain.
I hope that some information can be picked up in constructive ways also fr=
om my patch reviews.

Regards,
Markus
