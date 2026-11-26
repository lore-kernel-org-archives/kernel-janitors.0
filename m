Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719672;
	b=ykzVMptec74dQ+dQoFnNh1yYNvnBnB+gJBY9nquIZEfcChfWi7ng+vAf5y8bf5RYaZDS
	 72kBDUmqYoqi2VDkz9pj7lHxpUhIjE8zGhKhYd2gEon9EB4w5V4rP5EJiFEUxaV0CNNB6
	 XiZSmIblTlNlZqxA5WnRsRpIVrMXE5Byh906bhCeQ8a2kWlcg7mndVVXkZk2na5iEdiWT
	 JMyvBeRv5DZmTdfrtXfk9iHsLTb3/a0/Lut9o3AdcsQ4H+/t5Hni6gKpMa9f/U9Z2ccTg
	 hmUKqgi0o1/uQAeifzg4bKVNF9LBMHo7k0eilfw/Oy2OorJzjs4KCLebgqO9d5gDtBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719672;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=789Q52claiK/V7p5G0xQQy6ETw5KudJUORliHAaj+Nc=;
	b=5pFTZqfnM6K0nMJN7V0g1V3mDtLQe1Wl3H6vhEaS9CXm2PZ3XFRaOC1c7YJGIPxTPx2Z
	 ijtWqeWrO7W6pA0umNthagFX49mRr+5U3TXd85zB74NJrKJ77DjoczOEsUFPBsRqEFTkw
	 WDTk+7QhOJcc5fERlDGzr0Zxhwstgf+4If7ZndeFVpZVU6nYWS1TONrijv8/6cTM7IhI5
	 3cW3K/CDoHI9zjjaeY9PTgGiCadFf4tXnsD7zquJNil5qzEwTd8riGZDcpkKhZ8AkawW4
	 vfE+vax5BkLJBFZxT4pGZE5zCVYcBPNyL8n4Qxu+3M43TdgPBwzm2usUe4k5YGKOEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lQF7nG9R;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828BF606A31C
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Nov 2026 19:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lQF7nG9R
DKIM2-Signature:  i=1; m=1; t=1795719669;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:HmkXPAeOwlu4Ueclppn5yLIvK7N+
   ze4jF3QjHTiPMw3IJz5SYE0uS5KGIAEh1Xvn446tgEXnfJ3ELiBAlQgV8VzHgQgEQ7+AKF+dXAE
   /4B3nQ0dSUM8D3XsHduFkzBvGtc6UOJvbARYetpnIpUiNHL9s8gf5McLpwi+VXEJ7/atSbLz1Fe
   0icHHdrFcr94z+NFGCM0TF4ipKC0ZyQclgeOfadNF/D2OczsBgnVofngCYpCsg/Ci05ZpTeRXUq
   fnDiSDbEPxWnPiMUymjFLG72NIc7mfKnoC5DRrOh7r9rjQe9YxEPsu/Kxm30CUoaYzbhRNjZRoZ
   1ZYI6YwiOORRSw==;
Message-Instance:  m=1;
 h=sha256:
   2EH7BI7WoI8wIAQ31q350EheWcWFfN4jCpyWfry1Tl8=:
   789Q52claiK/V7p5G0xQQy6ETw5KudJUORliHAaj+Nc=,
  sha512:
   3osmhfTDI1UsCpOrAN+kxeqRwQ4IKKbWn8AXDg9hGNxfHSTYnYvP3Aus7MluMYweLGQ86echi1yH1BJf+EUegA==:
   4uaLJ5jynDMQf5g8RmJTv8eUQDbezeMaF7H6y9NNvk8NEFYm2ZrB6Cl6B3b2E/C0YCdvEArk94CDoOvKJ86D+w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795719659; x=1796324459; i=markus.elfring@web.de;
	bh=789Q52claiK/V7p5G0xQQy6ETw5KudJUORliHAaj+Nc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lQF7nG9RKS4evax7Blu1Sx+f8yPCW2rUq/RXNk82QgZwfE1OTTDAG2ExoNveahqn
	 tzqLgbfXCYL6TQn6jtOzKsdfpevJkEB7zBTD4SjuARkGT6ZblmkYlvcdggEiNGX4S
	 MEaVy7Q2DUkDL1CBh1AyoGsTEBcSXRk8p1+qA0fiOxv7FpwUS+tP8l9M5g2EC/xGP
	 OxOmjy1YKYpjnmiydoGbxsXpPiONZx8pKPN5LEPYz9X3iNxhA1AECP6ZYYg2vK+pa
	 Nb+9ANdWlp2ETCECCZVUHEiNmv9j353TP17VclAfS/bx9lRhVsgkwn0rIbuNIPflV
	 clCm5HB8W8B9qQlq9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5j5k-1xZQw43LWU-002tI5; Thu, 26
 Nov 2026 20:00:58 +0100
Message-ID: <939911a6-2403-4a7b-b359-6778c0973b25@web.de>
Date: Thu, 26 Nov 2026 20:00:54 +0100
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
Subject: Re: bcm63xx_enet: Use devm_clk_get_enabled() in two probe functions
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
References: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
 <ac10d9ef-b193-487c-b4c1-6126aa770c6f@wanadoo.fr>
 <603d7ea7-5d7d-49c4-a01b-a7805e88c361@web.de>
 <9c26b213-aa58-4c27-99c7-926c6b4d5275@wanadoo.fr>
 <a526e002-c8fc-4935-95f9-5943cb557e99@web.de>
 <d9061bf1-2445-425e-a254-0b33dcf4db8f@wanadoo.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d9061bf1-2445-425e-a254-0b33dcf4db8f@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/Hqv1mkCHmCvVSQUtgfM4r/vwMUZIq08Ba8XtthZDcOn4SQ7bES
 GnCe22CLCGNV79Wgwco8HGjw/TFLL37+Y3khb72xAvrtZvXIe94vPygSSsR2NMrjRHcqTKG
 niHJliyd3zhElvaeGRThK757x+IkLTYmcS/2aUnXwZRZrn4m6pPfXtnT8xqnfmvW3p0kYM7
 WTXRQIy0HtxvbAcUVXK7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LdIxgs1mcZk=;qqd/lDHGUoBRH5ZDIL2FmcWraEz
 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
 6Q==

>> *=C2=A0But=C2=A0a=C2=A0clk_disable_unprepare(priv->phy_clk)=C2=A0call=
=C2=A0is=C2=A0unconditionally=C2=A0performed
>> =C2=A0=C2=A0=C2=A0in=C2=A0the=C2=A0implementation=C2=A0of=C2=A0the=C2=
=A0function=C2=A0=E2=80=9Cbcm_enet_remove=E2=80=9D=C2=A0so=C2=A0far.
>> =C2=A0=C2=A0=C2=A0https://elixir.bootlin.com/linux/v7.4-rc1/source/driv=
ers/net/ethernet/broadcom/bcm63xx_enet.c#L1930
>>
>> =C2=A0=C2=A0=C2=A0Is=C2=A0there=C2=A0a=C2=A0need=C2=A0to=C2=A0adjust=C2=
=A0the=C2=A0control=C2=A0flow=C2=A0any=C2=A0further?
>=20
> You=C2=A0kwow=C2=A0the=C2=A0answer,=C2=A0it=C2=A0used=C2=A0to=C2=A0be=C2=
=A0one=C2=A0of=C2=A0your=C2=A0favorite=C2=A0pattern,=C2=A0so=C2=A0why=C2=
=A0ask?

I am probably looking for further background information besides
the commit 4e78e5c5d881bf2d6267545a554c1baf245257b7 ("bcm63xx_enet:
drop unneeded NULL phy_clk check") from 2017-10-01.
I hope that some software dependencies can still be clarified accordingly.

Do you find the handling for =E2=80=9Cpriv->phy_clk=E2=80=9D also unbalanc=
ed so far?

Regards,
Markus
