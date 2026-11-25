Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610965;
	b=JAsvPuHSUO8OxBNf7IM515L0Kckq4fSGEERg8aCF/IZyYTIc1yhBlZglLsgr8vpNLcTE
	 yX/+GmtKbEYf2mw3KcvV8dLCWc07OvCbBY7zryae/iJCvgFPDz3SNUiDejtiSmKHniwOi
	 7S302f/nDW9k8MtVZjGNxrq6ozd3xTQ54fzgui4UEOaomn7ppBwO6Psev4aAmiIKZZf3y
	 1nt5T6E14ul5VIRVYm5WeAy+HWBB/jZhPhVePrFUJn3d8eE48gwzvf29nuy8II/gEmlC6
	 A1L4QadJTjAb/mw6Kjg1Y7ncNBV9Q/L6P0G2Mp/IiMRcESy5A9Yx/Cp4z8QG0nPasHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610965;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=35dBQPZTjjQf5af2xzTsWfDP7ddSRYEMw3k72A7SADA=;
	b=ORO8EWW9rgBsNBnpdY40CWNOAqT5R2O1g9uHi1DEWZnDiABQYH6L+M0PlFkXONUxoN7N
	 UWbNwpYrR4Qq8O1izDITzoB4I9dq6m2j4eZx8IwjVooMWpRuVIpsvF5N5xVnSizRuQeZI
	 K4aRfjoeu5RmLGzNRmkbnToZ0epHn05VCdQcqpZCUm0F79mGNU7GBGacZRWXBJIQVw0V2
	 ZnfnHXvEGzGpaHPguqr8f0XaSr5rqeAQxUjRjQ3TFkgB4zuBpwG/PLG1MQhdWwP3iA33r
	 bfdXTbQKdGEb5cWcq0jXw5Rm6UOfGeYuKaeZ4sySxC8FDAqR6AF867LakJszBj2ivcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=SVNFITyo;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64BD606A321
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Nov 2026 12:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=SVNFITyo
DKIM2-Signature:  i=1; m=1; t=1795610957;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:ed1GvA9q6gBYqKjrrUtTFZDhEJqp
   UKp2C/yFj3IDZ9UMMrz5xOGkuU4RDMwGXcZHwhgz9PfP/eSGlMiWnQ6eO++qMBopKgWId0IB55+
   gxPEkHrMmOcBahNjxAca2gmw5YO7GPFzvcb/32xNxR9Fi36qhAbF6npl3qX81G54Toe+DF5BecD
   LP0PfRUzQlC/78uHl4xjdaOxc9IOIlmVsSDMc1WRhDBT1J+0sGBNtsM+JzZQzQFWlqFoLV1xDo6
   DiVFfZkWBQ9fNVYeLzQZi2/keEPuDSu3YEijhxcZ5AhrQQO9wJl6/QXMTdfzWWbyY+ZhhL/7CW8
   idxi/r1cPju+cQ==;
Message-Instance:  m=1;
 h=sha256:
   3Y4acA60L8j/Ls37yZjw4+Dtxax4B+cBGgrJXjY8BEY=:
   oBYtqVPVTHPhFOIkyXy53wFgR2bgpbEGNGDqWza2bYU=,
  sha512:
   R7byuF72kdLF2D+qXMvu+W4gw2sRz+XvXltG/myLd6tZ1V+nc51ULR51tHXufflwQm1Nr+pKquYf9RUzL+PrvA==:
   Ws5R6L3kKvMZoNhdI26YBX3FU0GbaHB2cE3nTSRTKANY3eRpUFlgnSxM5TQO4Q6SRrVRcCkE4zDfUIgIrqHcuQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795610903; x=1796215703; i=markus.elfring@web.de;
	bh=35dBQPZTjjQf5af2xzTsWfDP7ddSRYEMw3k72A7SADA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SVNFITyo7+eT4Pqf27bobFyTc5pz+zuvJUpjo8EO1zFbZ7HDeHNuVOx8l4tk+lR0
	 ALcyEbm90uf0+XnuJa7ISJ3HYABcBY3F8MXaSrvQDG1T+gGQBCvEuxDkKQ7rTcbMW
	 1dak2e//QJo9QdT7XHiAzIMMtMWvrcOI8x3wbG6r8oXBwl08I5/tW4AOgDmY37R9X
	 O+iqoF4RILOV6QleAkHooEe5FerYx0j9mX5WXLRZKtexVNTgHmk0+CXRM+BNMdQq+
	 PBh/dmaCjCDvlG3ANPBnFEHg/nxd+lQsfq+n1aadOi1LcT0FYr24F2TMVhpoS7tyU
	 Jjeto6C8jxJ42qReXA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d7i-1yXodi3Duy-016K2F; Wed, 25
 Nov 2026 13:48:22 +0100
Message-ID: <ff7e007d-e4cb-40c5-935c-91a2f3ba0224@web.de>
Date: Wed, 25 Nov 2026 13:48:15 +0100
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
Subject: Re: net: allwinner: Use devm_clk_get_enabled() in emac_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
 bui duc phuc <phucduc.bui@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joe Damato <joe@dama.to>, Julia Lawall <julia.lawall@inria.fr>,
 Li Youhong <liyouhong@kylinos.cn>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
 <awXw07bDd0bX4Mas@ashevche-desk.local>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <awXw07bDd0bX4Mas@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vY/qI4YW3Fw9IRs+81/TLreG3lX5UE5u1+4zPYZSPa7wODjXVmL
 eIIncbv8oah9amMqO0dHzz1B2EFo3rZO89VRstUz1Sf/EhurzqoafH0MKJYG/BPckHgENIM
 +pnBIr4OL5abL8jU3gpEPluU00vKVTkZWE7UpvYXokaF9ycfd5d3/2Qo3Tm/aofge3rmF8W
 MBaxEw0yvKL0mSgGqObLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tCUAQyUIF8I=;QEyCNaArGIt90WFSbvqLe9CVP1q
 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
 L0f6n

> This breaks the order at remove and probe error path cases.

Would the proposed control flow adjustment be different from a =E2=80=9Cbr=
eak=E2=80=9D?


> Note, devm_*() at this case will keep just a clk object, but
> the actual enabling is done explicitly.

https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/allw=
inner/sun4i-emac.c#L960-L1082


>                                         W/o testing on real
> HW it's hard to say if this order is strict or not.
How will the support refined further also for collateral evolution togethe=
r with
devres programming interfaces?

Regards,
Markus
