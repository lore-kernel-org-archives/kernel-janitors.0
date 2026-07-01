Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570F3B7B84;
	Wed,  1 Jul 2026 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891038; cv=none; b=r7GZwENNEGJfkHAwJgxCUyXxfwgXMxiuEKxE7V4eQAw933HE/XpN1HwU5yR3Qn0ug4FmySLCFpNAGrIbn7mJppZstPhy8XwOZc/LGkJJd8VpkzEwJK9YcoQaCOsJOt8TLKzhkV6/g0BzY8vB6OMiDBHl6j9+7smUiZghHd6TwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891038; c=relaxed/simple;
	bh=N0I6J160K+5ExKKrUj97M4iwuMnS7WPEKdrVJdNkhlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcZYGb2NeiUbmROoXeo/kyyBeiOo7xTlV5qudpgQZSOchMTi5JfamwrR+SU/cgGMcKONfCXmL4/F2azY/NRHQPG8U1GAOp7JWDFwBxWzfn/VLQ5fTk098G6JBYd94MXesUzjcMzMB9Krt468j7QkB3cWcVw2S7hIWOs4cCqGL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WmE+HoAt; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WmE+HoAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782891017; x=1783495817; i=markus.elfring@web.de;
	bh=sgLbiTi1LVVZ4wsZ4kcyM+8tmekf7TPrI0d8WGqQT64=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WmE+HoAte1UJ6Gjs86At0Z9EeAujKW7y6lbhXlOPbgzHHFFrhOtTT48uye81jBws
	 H8Y85iJ393j7ptposuBG65ZvIg0SW/BU/dPd+2QRHHpWdxZmrqRN/Car7OyRUdQx2
	 fkqiGTpo2WM+IepkJn+vxenyLXiaAPWJMF2f6Q6JMRcGaJhU6xMP4GoN3HtNVA4x9
	 CCIa0LtQJCd6LIWCILuDmy9maAkKGTkartNXHUXEuRAZHDzG/+5eOER7rizFiARGk
	 or1i81eKdbj7e0Cba0Se9GhHAc85cGK5l+TOdyUJGEFg7UyDjMVaUZZkd7syB1f/O
	 Z1YwtS2jZdXK255ngw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5Qq9-1we0aK0Qdh-009Y96; Wed, 01
 Jul 2026 09:30:17 +0200
Message-ID: <aa402cf5-6c7c-479b-ba0b-577ed10a3e3d@web.de>
Date: Wed, 1 Jul 2026 09:30:13 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: SOF: topology: Use more common error handling code in
 sof_link_load()
To: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <40b93192-68d2-4de1-845b-9c9ba994a75b@web.de>
 <178281882519.79320.1939247511595511190.b4-ty@b4>
 <2811c5cd-f2a2-418e-a5ba-b1c68ef5f1b9@web.de>
 <b04d8e4d-3d13-467b-841f-262204514377@sirena.org.uk>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b04d8e4d-3d13-467b-841f-262204514377@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MbXnXvxrzX/+OZaZjCx+FQDpWTIpyn7kitUQhi6UNWNoDqWHl2W
 XQGH6/gt6NmWkVm7e8C6NP2hNbSuV3UJIw8DddCnZyF2bL/gF7qjBi33m8b7fuiPbi3dtln
 bUUxXfMpBcAPmWrrOe+qK8u3qV0OooxOZWKSETXGYKHsp7uYTT2rg1pHNNHhrK99lVetYCu
 O2jmp+wvt6Oo5UJReHw/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pXllAXmQ6y4=;+UF3aw9ilZBdZA/tpq5pGA0z4sq
 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
 Rp8mYWx4h8nFIMLQnK8PPCJI2o36IRcvPZe01qJ

>> Will the chances grow that further development ideas also from my chang=
e selection
>> can be integrated better?
>=20
> Please don't send content free pings

How did you come to such a view after I dared to present reminders
for two concrete patches which can eventually be taken better into account
also by known patchwork interfaces?


>                                      and please allow a reasonable time
> for review.

Some years passed accordingly.


> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.
I hope that remaining development ideas can occasionally be handled in
more constructive ways.

Regards,
Markus
