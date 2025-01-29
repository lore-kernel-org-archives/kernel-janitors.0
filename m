Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3589198A1A;
	Wed, 29 Jan 2025 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738139825; cv=none; b=H0RR/XXteB05W9e60n/IVDdVkeX8YkcPNeJrJe8fhO0d+gpKsha+rdawBlfYjypNsJkFA1Yx8MH4cmn9w9y581aukwQgW3Cxsa0ohygVjezNEGF1W3xbKe+6aQoFblMbke8VUSksQzANEsKufK0IqO6b/uAVq8gl7RCtCe3yu/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738139825; c=relaxed/simple;
	bh=Q91aViWKg70H4cuVslg+icjMShEtQmcifiSI57zvyQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=teNpBQzwWmFKUSLLxbIQJ4GB8DlxzKLQic/+By21uAoz4cuQllxT3gLEvNylOKY9PjyBw4p1nhjiRsaEwllVkT1lLr85vuTNGyPzxQvUX6+/9L7PbT6QXoA3yAJT+uVnhR3CwwYDfblD8nPv4iXL1Qd/IFeQtIOvZTdNodHDFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=cxUpFm97; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="cxUpFm97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738139808; x=1738744608; i=markus.elfring@web.de;
	bh=Q91aViWKg70H4cuVslg+icjMShEtQmcifiSI57zvyQU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cxUpFm972FDDsMEkEgb6qfloDGubAKcA3I48oLsRAk6cpwL54ehpAA5IHa4mxAni
	 m2rXoTnz5CVGdi+gbb8DNXJMxVwLOA7IdXOXaeHS4c3ZPouRs8Awvu69V+zcP4QYg
	 mwh0bKI8duHLhFjR/bujC1B2usIiixpboIs/D1dl6Pp5zFvsmP48LdTlHHiHsv/3o
	 GoxidTPntbFggnbFh1zlvPi9xzboIWMPDI+cdR5+dYr91F1EEjPz4wZKHwVqEMBT3
	 NgxSlrTttcBXVAJtL7MvFzpAMz5U6fDDYbFt43+qGWyfUjEDwlyp8g6ntABabvN4/
	 /MVLGYs+N/cnk9DM4w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MaHWx-1tzndt1FgL-00VFnP; Wed, 29
 Jan 2025 09:36:48 +0100
Message-ID: <fe13604a-2626-4641-908e-87eeaca53288@web.de>
Date: Wed, 29 Jan 2025 09:36:29 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coccinelle: misc: secs_to_jiffies script: Create dummy
 report
To: Ricardo Ribalda <ribalda@chromium.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Victor Gambier <victor.gambier@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sbMEtNKmAC+/Dgfy0WZn6CojtzpwVpi3dE3XLNl/mi+YpZgQUU7
 L9Fp7ycS37/73tPYivccO0QDZjU3/mUArXAiRdV41FeJWjvcnTRCRbI6AyRgiDMSqItV7il
 X69UlFTgWgKDEzktnUXjEFojkAhujOXKaMpG/KugihBFmlGjafaflTD4RreAFJ8n/pTz8F3
 B/ngZwGtJxdGDc16SDjjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vV5ucOm6pOo=;mRZoVb5JGrGWHThlDqwQ0qNcvsz
 bHl61NdasYfxtjfghCCMjBJeb69oqxPyW2lGMogkhF8pZu+UNBH32oSuMubTb3cn7o55rhs6F
 qp4NepyfNiqpEkqkaHTz47avu15TqiQjrnq4jtB5zezThta7xhnoI4zfUCV4quKeI6i7HkA8t
 HoEGi7Y3RYuDqjqbI5QYd3H4Lr4yT1okpCDlBvSIWJEOhoiUVKid3/ArPL+BUKTdimhKTny2a
 BmvUCpgtpjnXdvmbWyXS8N89IgifkjmwxmstUHCTwib/RJyRS8xEqNaaiqSY5/cEY+nzLY7HG
 AOaLwsshS98ODJAwYO1z2GpWUnaHDwrcyHGZtpMszsBZ37HGp5MaTMRIKHpfmlNZCiCrFOxpg
 ASregLLRjcuydykWbWEfBVRHEOHGEg0b71XjGez4yEhfYGvSuOq2rqDQUBZNu0AiDw/S8eMLI
 EaAz4DRHtTAQqkpVmbyFM5Sb/PjW8UyDg/1Ws/SB6VX4txc89WfNuCo048vrf0VWrq6hZb8AB
 DdXVXlkeJx7XFQtVNKZJD93qrVRI3PvZsjJFVsXpASAkTi82Idd44ArYEB02+XKLlItKUOInR
 +o1HvAf0iVCiQ2kieewaX3vOfg3OzHMrSzm7N+plr+6BidbpuPuhZyCnFwnwlcW+lbjDSuJ72
 EPu0lRhin+DsSMykfBwTGaBkytF5EiKa4jcSWBfinKMpZPMDL+TmglbIO5Qi1m1tm0S4TRMBz
 vXKp5ZxHe1JGuf5wmNEfUN5e1YCKJhAZWeM7j5FFGMqKIZyyvWAV5vLZMwa6Z11WMxlwYF0Me
 idrkyqx7DxKNqTA9ircXF6Zc50jkkh3uS9jgGsO2ZwGnRaVJknKgo2RaZSNe01T3XMn75Hm3g
 TP6uI1pyIOoa1E1h/H1ICNcGVPMbD/aSw9pHzJ6sabcXLOZO3hRv3E3luNmPAwXLPFvBRuSrO
 FQ5kGTVNX5/AO+txauvereyK0E1pnpNAOaGfKcbyQDQemq9rV1rhiZHX1Z8n57GjUIWsejnva
 R7xNh9qfgjprkmkKSTeyIqtN8fKlx4AafqEbu5Uv3Si49HLtzl8a2RlaNaa0rxBAjLCMENNgL
 8UaMRvEC291EIZtrl283KDzApaWpY6luuK/GQ3Ag7Q36rqiPNKU+HcHnA+3IKXNYcaTHYD+2L
 66HOnOB/JJBUL67BNoYsPxYNwTFkBVgTi97bF6MkT2Q==

> When running cocci in report mode, eg:
> $make coccicheck M=3D"$dir" MODE=3Dreport
>
> It returns this error:
> virtual rule report not supported
> coccicheck failed
> make: *** [Makefile:251: __sub-make] Error 2

I hope that more collateral evolution will happen because of such informat=
ion.


> Create a dummy rule to avoid this error and run the other cocci scripts.

Please add proper support for operation modes around discussed source code=
 analysis approaches.
Will it be more helpful to work with function calls like the following?

=E2=80=A3 coccilib.org.print_todo(p[0], "WARNING: opportunity for =E2=80=
=A6")
=E2=80=A3 coccilib.report.print_report(p[0], "WARNING: opportunity for =E2=
=80=A6")


Regards,
Markus
