Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7D55C07
	for <kernel-janitors@vger.kernel.org>; Sun, 26 May 2024 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716744647; cv=none; b=KnbKBcVkMfT6nJy/EIaERn3vqzEmdX41IHyR6v1lTAF3ATLa2j4MY5mwM/GHnr3fMQsKGynRbkj+z8rohiH3xaAlkTSlffNJBPlzvWpqgFhrjB5RruwL2FPWcHpU/VLnzAFfL2VCp4yhMmeULIZuKATFhEmhOLUg/7q48XnW2/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716744647; c=relaxed/simple;
	bh=YeUzMvKQKdoQ9opSQ0fgwhvfxy3o7ez5ypsTKw3GAfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b0iiWguecFn6taWH7aVMAyE4zv9YKFRlrSkMCf9EYwUhKhKhzjJZDe3RNCdZiCLZDxS+UgokM/YlcPVLR1il/Aiby4yF4/DR+IRBqthYb0gp9K1WH5NYhRTD63EYGya7BA5j1AH18KlwTxvG9Xe+E2rCTXOSVql2DzhUXYt671w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EmC/EC+I; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EmC/EC+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716744635; x=1717349435; i=markus.elfring@web.de;
	bh=nO71Rr6YTT1Zk0XePrDw6nBVPhQtXNcG/MeRZ9hdRVU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EmC/EC+IFB03BRgpp1jFMboaOVc3uhOJK0J5eJnRw55BI+Ke4Gyx115q5J04UYrR
	 kMrDIXRyRuMKRk5LVy5l00ZTDo4sALby6YeuGwzyaGhiMK8W1ft8R6gjTWY95OKKR
	 fU9ksNeZkV89nfamZWkhhzCYDv+mlXaBGPdizSHwoAIvUKHkjL4g2IWx0+3fWzD9U
	 iuBEMTqgrbeShtvTQa51FnQ2fNheOTcql/vgDKSkE0bShs9FK8JvHcflbj2LQtkP3
	 hzbnQF2pbhQIKVnbrX0n/NrahYepmGsxfkbadx0EtYCPPQFtXX/N7Wi4dvR6YVm2Y
	 J86IA6s1pnhroPNiew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MV2KQ-1s2wFZ2wMw-00HjMU; Sun, 26
 May 2024 19:30:35 +0200
Message-ID: <702c16f2-33ae-4493-8062-24b14b7fb0be@web.de>
Date: Sun, 26 May 2024 19:30:34 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Increasing usage of mutex guards (with SmPL)?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QxDcZ1Q4NKfZv1oR89qimddPactD1jInaztwz31nQIXQE3RCkHm
 +9ZvZpI13uL9tARAztyBc9AZdryUEksFb6PsrDXch3yZDqVZKlCqyM3KMOlalLzUI8Ovjek
 EBEOGm7kyAG6SBGK4Rh4/fgsYlmT6IM0dm0FwmyrIkSc9dkLEQxUKc5vzH3v8BQ8rXrJ3gY
 4BK1arL0AqT1K7r+R6S3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EOuGqvImNtI=;yGQ3liq7C0sZyOAkg/f0z6J1Nyj
 bngNN9DdS1z7MzVQnLh8rZ9kfZA91eShGNANQRJCR964F8AIvlaXkFk9vI2goFBrPxAXrBm6n
 RFdgoRGDzetdAwX/TBy49rT572563+C9c9o3LR0rvyI6O+AEXwC6hnyT1d6wwvscAqm/XJZQ6
 fHU8XkRRpt9IlU2OYnOQ+xrKtvewK3FBnmSFl7DAJ99WpZnZxwSQYndJ4e/Veusbqwqvp7iR6
 UgULEPi/szvDyeIjIBg6SHglRSFdaLyQvKWyC0AIiY+ungqIu/TsfJe75IbPw+Y2H7AWIpRJW
 5S8O4N3LETUEH9FdKg4eN4301QFeOGnAA5Q5916NKHjiDMnmr6KJVCIwPEuJtYjqJV8oPVrjO
 HLX8C41ILsmswnzJ/gRNH3wGkxaElMq9q74+3agzZw4Qfb9sML4psVATPrSFKioe/7sVUtzR8
 9+srciPwstJHLsY8K09JqpcriiGsD75Bhn2kPrgipwy5p0a+hBUQTHC2BNdFqa978yfc1qiOp
 Vp7PjziLgmZOvhIP73/BMSvMNxGzkra3oZxvgSWzTeeKfsrr/LUF6AuRt7YlTv8oYyCcRwf6D
 EZ/i3pqQMIjluizR7XQPDzAXpN2r1eF+KWeb/5hK8/RaAQNvgi0UONkGkHVc6Auqj8d1/SViq
 0wUWs7EQ9cNzrjGqLVvicMXjj9qaX3xbnEr7uSya92iWaGuMdnPSy/D6Ic1C0Yi/HFYz4mFSM
 RyFHUmKYxGuKJune1Wv29HVdX9KmUJOcm951CDF/4T/gHjy8c2PLO9hz9qMjloA5S2kcgeqWo
 FcLX3ZPoGOPlSNRcMx0Cq8aJ4+IDCHWVmcs9dEBdLuzmk=

>> Will it become helpful to offer further SmPL script variants which can =
be used
>> together with the tool =E2=80=9Ccoccicheck=E2=80=9D?
>
> I'm not the one to decide whether we should use cleanup for mutex locks.
> Intuitively, my opinion would be that we should not.  Something that can
> have so much impact on the execution of the system should be visible.

You are trying to influence software evolution also according to
scope-based resource management for a while, don't you?
https://elixir.bootlin.com/linux/v6.9.2/source/include/linux/cleanup.h#L12=
4

Regards,
Markus
