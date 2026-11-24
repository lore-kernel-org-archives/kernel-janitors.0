Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552138;
	b=NoRdSVB+cAFd1cSTK+RhVhOofaQL07dxN2W77elBKQXoSrnpvKHDHUru9Ev5CalZsln4
	 uSqM/YhphRY9Bu6q4YfuKS8+y5useQh81CW7WqeanaKvXXhy7jDJ06xmTxMJWEHiD1Qfk
	 KC7YnOHvyMenhEFecTNtihoAB/1vHdm35FyCJn6E8EFRZ5jKrvOBzdLgDQVjBKLnqiClj
	 cq7wgAmVKhjioyvPu3R+kvDZF9rD1vf19ymfLiwnim49FM3s1sDwK4A/y9MVcU15f7UNa
	 lTd35SV5HTJMDMCNZJS14NvjDWeqaac5yLuIWQY/aeZIU4GloCcKZwyicvcdZCU4Y9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552138;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=E2PGpUuBykPWhpXaMeZ3+HNEc09htxMLL2pYV7H2q1c=;
	b=a5czDYT+xVkecA0pVD3y9kUjznVF550S5rq3Bd3tvG3kVuaSVIYEwTGBCe/aqCsni2+u
	 +4f6SGsrJ3ISi9vSHvjk4QoG1wbBE+agoLW/zXsMGxg0AakCoqjGUHU9rB5h0fhW57s/2
	 rPuui2uT7VNQAHtVdqRMGgQkbAUFOzguPZzP8zfLLmdbuS4v6JQDh8voPvxeiKvIeYs/k
	 NKyynpE84k0kzTcZpcB5oOZZyxc6PBQgDf//aJnUejjoa5AB6LwK7QPpRSNO3knjJSpyD
	 qe1tsqRW3a1vXA8PfqYWoUFx/KsgjhJD2oe2mMMpToAm//5hDY/xrFLQBBOaToEwFkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=gqSGd5UK;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE7606A31E
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Nov 2026 20:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDE7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=gqSGd5UK
DKIM2-Signature:  i=1; m=1; t=1795552130;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:XxkVQryvlGlcu2mYdIevIs2O1/oi
   3BPpr2VUgVe+TQ149ROujUz5iWVWQYIToJVu0KPqSOR7Qm7eorVBrS3zwOI4E63sQdZTgf/+Apu
   xMA7bcsnDq1qWgl9Qzqyfohz7kL7oQgJsDNyet0VEvNtq7Z6KRLlI2YhfVIKM6WpHyPJuxVho/5
   bF7UXlpomxIutz94oEwL0+fynWxEUR5QaRSC9Ej6skzf6TBJA9sKYyDpvFF49QQcZ7r8NYDYr1B
   mqGOC90TW7kCfKSya70skArNgz7N5P++JedeINtVjLldwZf3DSPlQ1iZTk277pyYghK7nTsrvPl
   kDqDqgJHqWz2mg==;
Message-Instance:  m=1;
 h=sha256:
   HRiK+DU0Ss8R88n2HlfxrUW9c6FDP8TVS3HAwB5e1d8=:
   fZhgWQKuGCiWR07knMGFI916GAUVaUYv23wfLbsufpY=,
  sha512:
   jhCDZWtlg035Py8eSJDtXliWWhfqTjBH2hIM6yYOHVijgkISmL9OYpjVnFpz5Xv2hSJzxmuQFpc+B8PlUa2wNg==:
   +8e6kq5QdwIwsN5WJRWBxHQnGznE9NCAm23frB+mX7jAiPOsBnElWWCBsH6i64OSSmT8tbNbZe99JvxI7994Tg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795552122; x=1796156922; i=markus.elfring@web.de;
	bh=E2PGpUuBykPWhpXaMeZ3+HNEc09htxMLL2pYV7H2q1c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gqSGd5UKmsDkTRJCvfY8caVpBur0ll/jpsVdcyIzSqumiCxcwqnEpHraI/sK+EF+
	 0aczgld1vHNfOkdZiU0F2uTi+9wlyDbzdxAtgzWcavV7hpAOcBYpOlXUMt8Bqoa4r
	 ZhTFt+iJbf1NIOqb3W5MDSw9TTnvfEc8rnCTVPNXipTkR7eyaYwjCPXWxqHb7l1bN
	 ixt+v1fppVbSNhFofau/ct6sg0wZQClhyYppzEOTxxtdbZ0LXze0GpHF2eUaoYH+t
	 L6HlDjGpy6eQpcK9q+QxW4WCw5KNPD0eoNBs3+sTohOrLgCICy7DGBKETmP7MxKIA
	 K+FEbqk45LWdMNCWhg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MW9vU-1y3O0O0PCk-00XDYy; Tue, 24
 Nov 2026 21:28:42 +0100
Message-ID: <5ce205a1-598d-4292-9e2e-39f077e4aca9@web.de>
Date: Tue, 24 Nov 2026 21:28:37 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
References: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
 <awXxloPuhUUw8ISZ@ashevche-desk.local>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <awXxloPuhUUw8ISZ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zYxIUKkWUP8hKnin+sVqIdNS6UQPaio5SI39xhRwi9nqreK8Paw
 Iti511DC2YjT4euCpwpUWAWsxURsfZNJSTgzJK38/ajcIxFUm+eCoLrwGyvrbX2ViGhFjaX
 O0ZxuR9k8FErga8kXv9FpqMdUb4US7AaX9gghtElSNpSvzv3YLhtAVT7bxHts9SU0V4DUo+
 LCfaVmQrsjK56JKQwHz/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YLxpBucjbc8=;M33qzC7GWa3kCCElHhC/TW4zCcK
 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

> ...
>=20
>> -	/* disable hw block clocks */
>=20
> Why drop this comment?
>=20
>>  	clk_disable_unprepare(priv->phy_clk);
>> -	clk_disable_unprepare(priv->mac_clk);
>=20

I propose to handle these clocks differently for the affected Linux driver=
.
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broa=
dcom/bcm63xx_enet.c#L1902-L1934

Regards,
Markus
