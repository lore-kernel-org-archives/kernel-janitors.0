Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669022324
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Mar 2024 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149000; cv=none; b=shjWRtdfJrKONOBwYqnN3Iwqz7uHtl7ccWEXb8+YH74BOnryxBzNeaXOuBHMIfOmVbbSMs884n4kFADVuCV4wqSrWl8YsLc/kzgd5W00nvWWPWEwOONb0VM62ObNoj7fLg6dZc8WU9XuI/2RbZqn828fDdndygvNSsolQ5qfwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149000; c=relaxed/simple;
	bh=bmPneYWZYr5xD73kJBuCxjKs25l7SFeaq3285oeFlNY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YnrfumzpIkzMTFw3I9bcNKS8gj/H6TGhrf1V4f3NOW4vMMn3P7O8D51JrySt/+sbXAGd83Sx1VqrH7ocZ/O6nuhmKbGTRfZAjnJKLC/55wrZ5J5WUggCEZtplZMIAaDzMSBgspUqu7F1nPLh7/spj2aQJLkPKfeyAYaQrC63eoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tkS48tPV; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tkS48tPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1710148938; x=1710753738; i=markus.elfring@web.de;
	bh=bmPneYWZYr5xD73kJBuCxjKs25l7SFeaq3285oeFlNY=;
	h=X-UI-Sender-Class:Date:From:Subject:To:Cc:References:
	 In-Reply-To;
	b=tkS48tPVw4WoFzUZCR+TBz6W86Nkp0vUV0fb2S/Nus507x2bhmJ7OzN5BY9oXIGi
	 y6geboloUcVlSkKC+zdC9710NqTMX9dU9E5VOM4SeKlUTQqTYMlcKJe5VtUbg34e7
	 RcdUMscvczHdK4Xhp4+wamb6UEB+5EiLiGUIDEamwNt/PBH5TpH9xPThvKF1sxJA9
	 ViunLG2WmpH+ifqwnoIueEBX3DXk0leY2wutj8IywN2bTnyjCexjvBWa0q02mdQ7S
	 sh1H8YYa+7ObSyHBY0X9ie8BrxQYUD++NbUq0hidmo7HwfVwaRe18p/5FgN0rnd4c
	 RaNNjsfUcPGmoN8yGQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyvB8-1qwTaS0TI2-00vycp; Mon, 11
 Mar 2024 10:22:18 +0100
Message-ID: <1c8532d7-ee40-41f3-92af-33eca0696834@web.de>
Date: Mon, 11 Mar 2024 10:21:58 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [cocci] question about kernel cocci and cleanup.h
To: Jesse Brandeburg <jesse.brandeburg@intel.com>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Alan Brady <alan.brady@intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jacob E. Keller" <jacob.e.keller@intel.com>,
 Przemyslaw Kitszel <przemyslaw.kitszel@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Kees Cook <keescook@chromium.org>
References: <CO1PR11MB49149F1167679926A2917E0997202@CO1PR11MB4914.namprd11.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <CO1PR11MB49149F1167679926A2917E0997202@CO1PR11MB4914.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lIwfRe4HZ/mkWiwyaWhs/Xk6gQAlwmBnyTUIndmdVYuqs+nI8V8
 EjMG5MpnSOuRrG7eKgliN32tpvZbtxYXVgJLXeb2BHth1P7PNJ2xn6JvEkpMzwdOqamsyTZ
 Zl28WRFTqB1QTlNVxwGbc6LcsJ7Ipf7ShHILO9thP9sx4IJuINd9q4UOL8voQM8VniMQQJp
 u56qH32e4hRumHu7kRT4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DbQQtYyPZ6I=;sJuwzBVt1gI40su06Cew3fmv9DF
 0yscvhB9TBPZZaD+hrH/dv75nCECwI+XOn3y+8QVEkjnZzwJM7001M9CD4SM5pKc4E05LPwYh
 Q+xlYaTYX3HAoi6ecAOjcX10XB8thost4Gs+BXNOHAIQyNCweDhIm9BQnRjCRfBBcZJSlK4No
 /BiH1Ooub+CbUikqqxuQJZ3tIBBPPl4j6BJ1mdXquPPTSP4tkgnd0hFVthyeyCaEifFksKpvH
 +mQCrjGMOB7uJT44/cYwbd1aDGd7nkR79tldF/rUxyQQblnhxvPCLWYSY+pzofQbBPTjDMhJm
 BQ3XSpWZ1pOMIwRNk9lC4vFvL/XHNCngRi6agnAuuRWyx0CQczlFj8XGBcpaE0ncK7w8fwGto
 ea+eAAyXxWnoXczTE2O8N6Vm8z7D/V0TS4kLCAF/JUUExkoXiFyMgNHrD382RnWARg/EWMCYx
 6+bff71zpXUDXP98J7FkpMJr9lCw6FVtLpZNjkpzuhgUcsRVrFW+Zvh1N+kwOYTs2zKudZVry
 V/yCHYy86O9vkD9lePr81SPV6j1/59bLDTRU6u8VJn5Q5/+A78J2lEQQsZfQOJYMHC53sZazD
 JAdnBrrMngGTEKWDpGI1CL1twFIxOfCAt/ttGpPEVIHoA2wCB0kjE00rH7wi0RX/A3g35twMm
 XjZAghpSYpBu8JrXiAxap3ejOsRRqdoJJ6NFwjicWB/uwj8aRPecBGKnEzt4tiD3gxEk56oLN
 jIRbWq0yEmqRlaeyRv0e34AAJ2w/+h290ogAo0LoB6nbE69q2OO6DbnQFhgY6+Xk9VwD03EdT
 Lnkpj6Gmaz+p2igqegaRB4y4Pclwi9jRRPr5Jf8UwvOyA=

> Hi Julia and team, I had a question about whether it=E2=80=99s possible =
to use coccinelle/spatch to start to identify functions which are able to =
use inline destructors (__free or DEFINE_FREE()) from include/linux/cleanu=
p.h

Some information can be determined for the discussed macro.
https://elixir.bootlin.com/linux/v6.8-rc7/source/include/linux/cleanup.h#L=
8
https://elixir.bootlin.com/linux/v6.8-rc7/A/ident/DEFINE_FREE

19 calls are performed for this macro so far in header and/or source files=
 of
the software =E2=80=9CLinux next-20240308=E2=80=9D.

I suggest to take another look also at algorithmic properties.
There are different development views involved for the implementation deta=
il
if the specification of repeated pointer checks would be needed for the th=
ird
macro parameter.

How do you think about to compare design decisions accordingly?

Examples:
* device property: Move fwnode_handle_put() into property.h
  Jonathan Cameron
  2024-02-17
  https://lore.kernel.org/r/20240217164249.921878-2-jic23@kernel.org

* locking: Introduce __cleanup() based infrastructure
  Peter Zijlstra
  2023-05-26
  https://lkml.kernel.org/r/20230612093537.614161713%40infradead.org

* platform/x86/intel/pmc: Cleanup SSRAM discovery
  David E. Box
  2023-11-29
  https://lore.kernel.org/r/20231129222132.2331261-14-david.e.box@linux.in=
tel.com

* pstore: inode: Use __free(pstore_iput) for inode allocations
  Kees Cook
  2023-12-05
  https://lore.kernel.org/r/20231205182622.1329923-3-keescook@chromium.org


Will any further change possibilities become clearer?

Regards,
Markus
