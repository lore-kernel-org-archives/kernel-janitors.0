Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1212364E98;
	Fri,  9 Jan 2026 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979223; cv=none; b=Mhfr0pA72WU18g0fTTiQpWCc9Mx+iiqXt7R2reNGJPcmMUvi9JK/iwX+TglfJ/40X/v5tIWW8zfWfbD2vZg82Js+RX+eVzOcJ8ZVcClJOCeB6N1h+Ywys2PeNIvI17o85lbu2OtKe0yYP/O1C42RWeIeJupLZxtOAtIIrNL1xG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979223; c=relaxed/simple;
	bh=2g6/On3B7na2rtp7Z94tkf5VvL1zcaYNWI9DWKs9kXc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=sLOnUq+gmaixN6Y5C7z+GNk6Xsta/TMKWlaTOzpbXlKQvGbLl++uietp657wkfCAm1EjW+/1UxEI/HAdyir81vNoJMI1VHf1S2f8xKuL2KAATDwvdsZ3F8BlUPi9Hk+Grtoh/kziYGWOAel4cmr4xYXDMhIzHhM7NcIGEshubhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=jeYKIGRt; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="jeYKIGRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767979220; x=1768584020; i=markus.elfring@web.de;
	bh=S8PAWi7A9gg5szwgTY9pKJq/aayXrhLHphFbUHii8CY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jeYKIGRtmrIZtW9PPSxL4fPGlV1ripn35vFcr5C3x8P07nc1AkkwT4yNyP0OrTXt
	 y+3CwZBff2ZKWIt84PgX1bSWSAYT5ggmxjwrKwLqd78GGz7iKmJw3PbPNUVqFKkAF
	 PFJ2tCi6I5+DO4MZCohQJqLNVSkd0tI690kIcAvRafDDs6uwrKhbHe60HBFxdkQU0
	 eABjTwAbb557A5ShqDP6MGRxBhwXCvgKDhdmmpw5wqtLhAyiEsLLzeDEmwcs34aUW
	 tPeSVT+Kz3BSCjMsNCX7gPbdb9g2obKz8jlMQ1REY8VYpmf/UXOKNuL+KOA7LCfWH
	 uoHyPz1u60VLeDJXhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.182]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N947J-1vszlE3mQ3-00vLnX; Fri, 09
 Jan 2026 18:20:19 +0100
Message-ID: <8b7bf2fd-d4ad-4115-8437-32ef3629c16e@web.de>
Date: Fri, 9 Jan 2026 18:20:18 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <gu_0233@qq.com>, Lee Jones <lee@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <tencent_B020C4282210FCEB4C140D22B8A5E7C4C307@qq.com>
Subject: Re: [PATCH v2] mfd:tc3589:fix a potential resource leak
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_B020C4282210FCEB4C140D22B8A5E7C4C307@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t50xfos13EhD7Z0laVsLO5e7id9mbYfSm95ys3uL/JpwI6/sEeT
 u6qo+NnAytFM8JiIFgmRQUbc/Kz0aCy93/P0v5cRmxajnLwJFrkBaRF6V38zT2lf7cAQvAe
 aixWI2L1qpx1FfHV3hqPgu87j0kOxyiyjEU3Pc43dxE6LykNCDPxQ1Tq6p2GfI7gubhIlQJ
 lEl56jxhvqSwgNSyqix1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hCA9RJUUnVk=;2A4uGBA3xxdeNBQevaosnSgPbF8
 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
 6BFgfhVPu/+Nz8uYAVPsG1V3wcwMPxNyPWhyo6

> Use devm_request_threaded_irq to repalce request_threaded_irq to avoid

                                   replace?


Would it be helpful to append parentheses to function names?


> a potential resource leak.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc4#n145

Regards,
Markus
