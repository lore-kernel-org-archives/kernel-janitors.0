Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160F037C0EB;
	Tue, 21 Apr 2026 06:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751517; cv=none; b=YtZ8yt+GLsxRpg/X7RNqxd1zQgUAQlwquSeR7GIte7wgJwlZXGBq4MovwBu65OUsgNBv1sp2V5kMy5bP6wBegsWpluF6uae1SFT7y6p0dZkBe33tcXE2wapC3DgZ83asn7OffoT9jg/iyQ0W/5lPbW7EPkOFX6iExBIjEEDPMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751517; c=relaxed/simple;
	bh=m7plOuqyK9waRAHk13D03gu5JMjZcUILXL4QLwUhM3A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s9IFB5j6UG/u77oKWJesTLn0NHtoPGs0cYD8Rhl9SaGPiqUwGVhtpekgqc27KEfoIVzNDwAW/9/AQ05OcgfkSGGjXLuUzhCWMVuIrCH3ys2ol5C06nLwngHzTa4u1xUIxnwNG9dVvO5nxKQ07rb01ae8VKTLVGao49H28fQOKNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=b8P5W5HZ; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="b8P5W5HZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1776751484; x=1777356284; i=markus.elfring@web.de;
	bh=m7plOuqyK9waRAHk13D03gu5JMjZcUILXL4QLwUhM3A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b8P5W5HZ+GK5xRDC74Zm6Cu8z4ObTJofbuLw/VycmfGCeB/vN09uwFrB09GGCgHR
	 h3DHYD4G/rcAzuvOb6vtNr35jln1V+8rrFza8Gx9rlN2axfSpQzChVyNMADLLFtiW
	 FR1KMCi2IbB/sLDMFQWvd3gFQ/d674wXIKbKBqXtnW6/BSOBERIOZqbWLHvkBRkB7
	 F0JfcRSwGYNnKU7EbCUGOds+HGBEs1HtQHx7NRP9O2qH/V4kkDvLIWXxmTGOTlgZz
	 Nn1JeWpHWrlxp/SqugOBov5iXFe+Gi238dyHaTu8VfiK01qPErbIb6WphgWhklHlg
	 wPa4RIAhoadJemAfxg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlLE7-1vY4xS0jnR-00dlFK; Tue, 21
 Apr 2026 08:04:43 +0200
Message-ID: <aca6d545-ccb3-42eb-a667-dcde66325a05@web.de>
Date: Tue, 21 Apr 2026 08:04:23 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_Coccinelle=3A_api=3A_Add_SmPL_script_?=
 =?UTF-8?B?4oCccG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeS1kZWxldGlvbi5jb2NjaeKAnQ==?=
From: Markus Elfring <Markus.Elfring@web.de>
To: cocci@inria.fr, kernel-janitors@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, Alejandro Colomar <alx@kernel.org>,
 Felix Gu <ustc.gu@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Hahn <phahn-oss@avm.de>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <4fa1cbbe-506d-4acc-acd6-57700d76d0e2@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <4fa1cbbe-506d-4acc-acd6-57700d76d0e2@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SVtUN/Er9RN6YdmbXnvBDCIwT95M6XBhdkXMQ7KgP+vUQKJJGZG
 GkEz4U8jk0kt/3IQ+9+wEpS1sEDMR1vUfPn/88QfS8iMmZVUnTO5kgwmXHvRtyQFKUusqot
 ssXFFPGaycSSswCnEDrWjem84AEYZ/II7YHG1ZnWoNppT5ivY38bSTIab5+e2vMOLMtyn2k
 Q21Gh2ncQX8k7kUm0A4DA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6qtjceTRXEE=;At2bYXYMTEhxbgnA6tx0V3F5Onp
 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

> Date: Fri, 13 Mar 2026 18:15:11 +0100
>=20
> The device's last busy timestamp was set in a wrapper function since
> the commit b3db492e8335417dfd66c1fa2ea08e1d2f7b6736 ("PM: runtime:
> Mark last busy stamp in pm_runtime_put_autosuspend()").
> Thus delete pm_runtime_mark_last_busy() calls before
> pm_runtime_put_autosuspend() calls.
> Provide design options for the adjustment of affected source code
> by the means of the semantic patch language (Coccinelle software).

How many contributors will get into the mood to achieve further collateral=
 evolution
also with the help of such an SmPL script?

Regards,
Markus

