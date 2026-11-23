Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426537;
	b=R7yOGX6OZs6LJQvgClOx0eWAOuXDoBsOmPYWj6mdA4+yDMItIiKwz+FjtraHjHwJNUUk
	 wZLYQT61Gnj6iZ9KHm+0wyS33DxiUDJlI3Uk1UaIb/AJekei8XbVB+m2unUzwgV3w/9m7
	 aertQ8wj9+02d9kOt1pprrj6KyejxdtRICargsWwSJa0GeeQG1uY3PrxKxPU0bEFbnwDZ
	 c3ufLvNunKkRmUSAIBjw/GnAXk1168EKLMIe11wIIm72Y5hsWCUFIz5TXb3wsbcBAldfQ
	 puC0GzANIb22cSRHU/IL0CCrKPO22xzcRE4nstjRJpn8D9n+ShBSi9/Qeuseqe8EMmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426537;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=WCWVJvGsHTf7p7hpAY9CtAad3mqMtNmd1EDqnENxKo0=;
	b=T+FO8KIyRlZfgycMuTogdCf8I3uHH1HtEVKh0L+LUj5vD9s9JnJHFZVz7RYvrg+14BSb
	 apaJer14QuuJg+R+syEzms4I9ym01M7t9vL6tKTnAHgdFJRUpU7rU8n8mKyaB8YeadEB7
	 9excSleV6BVWq6lhxBq0dZ9Z6xr6eRoo4cI/08Da6jXUBmFe5kwfTiUBnqTo5luZbu2fQ
	 nkZsxPF2tgeKeDyLwOJU5HJKWxvQ2kwdDMng5gIbbxQxbNEwxPYb4YpAppzubLbnpzIiS
	 TFgGcP2jKq7DWDkq5AICo8UlRwSzykXIdRn4qA1FSqqBAjGFi+b0+c8ZM89YoufoFdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w3Fh5oLb;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E31606A31A
	for <kernel-janitors@vger.kernel.org>; Mon, 23 Nov 2026 09:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E31606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w3Fh5oLb
DKIM2-Signature:  i=1; m=1; t=1795426534;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:c/ScWQAGHPWLqirvnCZzJ68TG0kA
   SNPev/sIJMQuME5aJhjX3N94N2gnJRNxuTe0K45quET4ocqqWb7qEZidk9E4WNL6MA10S5GwhK5
   IT4SFlh0E0MXx8nwg0kB7vm+2EYKUVMWmRUqjuNkUR4z4YB43s3buLQReesMFqqXxDlaOapNii5
   qRceuzKUaMscfxdS7ZxM+4tUZdhsvaatC6UJaCErGMYI2rGwBaRHqRNiIlfvLfp2XqZKVKCJCHZ
   HZ9lc5XOg6KUdtNUdUnuupeny2kMyykmukKKSaDHxsWRRUsAc+KyFexGqP5+mgsabk+QAsWFuON
   lkCSFuNzg8f1wA==;
Message-Instance:  m=1;
 h=sha256:
   FKVqVj//k9mFH69+49dexD/IZcr02CfG2F1j8DUxmbU=:
   JIWVznqsNjDSX1TA4LMH9J6+op0Z1/JN8m//8K59XEo=,
  sha512:
   dnx5k3luolfAko1jynfwX86UBjQ2hWlbpiVVhWKflJymJHHfse0oq1MwLcxSPmqf8q4iUK0vw2+hSa3+TbS5kg==:
   UjEKmuty0XZSTCpzbGwgeWibGzOPqqIORJaPTiQ86DYirCWdR3bURLItEc35J66/NHDqRgycd39osQa6PCfPyQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795426527; x=1796031327; i=markus.elfring@web.de;
	bh=WCWVJvGsHTf7p7hpAY9CtAad3mqMtNmd1EDqnENxKo0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=w3Fh5oLbu/s6KNyiuPrTGtHqGB0nAu+mvIGfep4woykTYQ4ChuJDGqzPeO9OYTxn
	 Ul8OZelWlVFoKK9eYOXF3WRkr9d1MpAbyWXmOOFeRsPhh0365e8OIbalow56dvhKJ
	 uKM8oBwNQwhccREgSuTmgOhsx2E+o6I3NEbuBMVkwbYSf/Vynbqz3mjJCbPcmDn2y
	 Oky0YJiQlgz9TEboCEh/FYV2feWF6Y0JGBA8G5FcdcHPawWkwYpbB11j3DvFHYI/E
	 E56uboHIsbGariJgNSUsD6TcqiyN2iYdILjnRWNKeGGTahjuf2plGnbEFwindoGpW
	 ryKY+aeQuCkZEr/7Fw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjgX3-1yGc7B4AqB-00ehkO; Mon, 23
 Nov 2026 10:35:27 +0100
Message-ID: <145a48ef-7652-4ebb-9c5b-b0e9e5b84c09@web.de>
Date: Mon, 23 Nov 2026 10:35:24 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Cc: Bjorn Helgaas <bhelgaas@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Michal Simek <michal.simek@amd.com>
References: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>
 <awP9_l7UNqElhewY@monoceros>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <awP9_l7UNqElhewY@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sr7n+6Xdx+8g/LPRtGn11gktALIM31LAunSWSqDg7gX3RTYRyd9
 xZNhV/tzcLIBDeQyHHGUzINApMdPjsI3PznawUWDHKnX6HpuYXkj0t6bpDTZxUl+80w19mT
 24gwgAflMqxxC7BfbhQYFOnfep3iCZ35DlU640dM2NkV3rfl6kAsMPF59SteBINkBDTRF5j
 VyysgR5XbtllFiVQNBoag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ed+VVTdrW5s=;4PP1HVCAOoL0kdy9XckLj3UZ8J5
 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
 aLr7gVNxlXSq/1pAHcQUzfF

> Not a big issue, but for me the commit log is too detailed, most of the
> things mentioned here are trivially visible from the patch. So I'd just
> write:
>=20
> 	w1: mxc_w1: Simplify probe routine using devm_clk_get_enabled()
>=20
> 	devm_clk_get_enabled() combines the functionality of
> 	devm_clk_get() and clk_prepare_enable() with an automatic
> 	cleanup callback registered to disable the clock in the error
> 	paths and at unbind time.
>=20
> 	Simplify accordingly.
How will the wording preferences evolve further for such change descriptio=
ns?

Regards,
Markus
