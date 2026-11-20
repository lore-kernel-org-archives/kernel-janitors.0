Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158042;
	b=GolE8tAFzTMfuWouEzdoEZLREp0v1td9NeyqGrsKxiqbfTwJPPmdOcWgREZTMBpE62rO
	 ZLeQCvp7GkeRqQRPjx9xR1zk8EEnXVnpQ/TK6nuitQ1rF6l3ageVnpV0DqJUcHInXpzQl
	 KGte0/clGUYigHmUxhsYB57lJLDqlUYLf94SN+cMNlk7RGgmXRmW4q/8XqdrN9yEV8vJU
	 iVxucjRMqJDZnlK/jnTRVcpa+ELP2fcNEciI6fE8BxVUmudi8gRsj0rLwDJ7efHmV6dOY
	 BgiD65WmkD4A67R3o03NDN7leJdJjPl8pFNTOz6rKZrQsvInaQZCopkECFt3Dw9ENug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158042;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=3C3J7sJpbSPskeA5sqVDl0sDUf7twKvsyiVZ33i6hEg=;
	b=iJEFJhgVemfjk2Lh45iynRz7hoOlhgXJKDBIKV0bOpDjDWsmAndD+84sXgUgJfFvjgAz
	 1AuogO4xi/hq6lw+aYYoP16ye71IbUzO0g+d2357JuRBuosqZWp6DThx3P/38n57Fs4sf
	 IUohMUNZwggCj7cIumMkU1YnvUpCgspRH0IGBdjI0LmRDtEM0yVyM4qrM8R675Nzotd9U
	 DjwRlp5n8SyHv8i+ZBGhpN1YxjFleFI0LW8Dh+5WuC6sCqgKBL83b9otDCf73jRpLPdet
	 LQATvaXw9AIFEnh1H/+So8QpSeTXrUZLAWn5QkciAVPn+TgsMg47gVHc5MSD2LDvEPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=GXwJZo+b;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC0606A33F
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Nov 2026 07:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0DC0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=GXwJZo+b
DKIM2-Signature:  i=1; m=1; t=1795158032;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:M1aK3CH98vcAKmkDEt6RXtNp3cK8
   12QLdk3bVxDAw/dFLSvpdhzUhBP5rdso3Aa3bs5gVQ6JuyQ4Ulx64DUuQH3i/EnjLCD8T7SIv8e
   PItjRvi7KGd4w5fTcIA6XOLtUHvWsyle+LYOJq0EpNsTOgrAOSAaNL8BoheKjgoQYdYUp9/EAtA
   BfzJ6EN3NIX7LZ4TZ8KVGbKCrwWrANabJ5te0jHj9nQ/L/0Hphp+XLHQ4mFenSk+ix4adiklur4
   bpV/2GkmGArk/EW3BTOc+9GQoa0fIWGEJQC2GRmTG0499lqr7flxEjwww6LbzUyzE7VZtS2SNii
   7G2PrwbLQtOWIQ==;
Message-Instance:  m=1;
 h=sha256:
   y/9jgboQbNCHQ8Vi1LqdQD1L1TQSqDw723ieRIQX2yg=:
   3C3J7sJpbSPskeA5sqVDl0sDUf7twKvsyiVZ33i6hEg=,
  sha512:
   bRWayZntM3v+eX+m5XlHb3kstfufe8WNkGPtEKoolIDfsMv1rglzBEp3j757d39juFHbQHIXMTh/J023F0OE3g==:
   yAJwG0gAlfdcZFqI7yDU1CzEeT3o2xwjnZcL8paAp3KsGfY4e4sYxStY80BILLBZ+mAzGE4PMTSRk4y8LThjeA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795158011; x=1795762811; i=markus.elfring@web.de;
	bh=3C3J7sJpbSPskeA5sqVDl0sDUf7twKvsyiVZ33i6hEg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GXwJZo+b8NU9OmrSgYKi2T4If/g0zkyRf4E1YHGba9XKzJQr9dOjTcKSJOtDBg74
	 cYHFvCS7XssFc1+zg2byEQd0ANQ58aMUm4A6r+spU9G6aokzYVG45wJ4JntAkCbs2
	 32AjNRRVrZIUGXy0ARjxEeZD8B7mnf1Xpq4jrtKrkLWSX8Uhr2lr2y7SS7LUMKsnA
	 ZNDTX1X8MBDUbx7QLYMxFkYdQmnCAnWNGhFEfmZY+Wod+EurNXxFQNTSW3CJYiC9b
	 Pm2j0tH5NvHXCwLDjA3eGKc193Z4UqD9RY5auqjcDK1C1dARxiVDtfVYZ0Z8gqFoJ
	 vo+dOX9/W9wwOlljXA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlsOP-1wlIjY0lzX-00guBt; Fri, 20
 Nov 2026 08:00:11 +0100
Message-ID: <ab5a8304-9976-40e1-bdcd-161cb3f81ab3@web.de>
Date: Fri, 20 Nov 2026 08:00:08 +0100
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
Subject: Re: net: dsa: bcm_sf2: Use devm_clk_get_optional_enabled() in
 bcm_sf2_sw_probe()
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
 <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
 <c4715b1f-c2cc-4b4f-8610-dd2e0ec71c45@broadcom.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <c4715b1f-c2cc-4b4f-8610-dd2e0ec71c45@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2iyKVOoxy9+0uTtjduT98wHM0wAtR+FNw++GOtVhX+3RsoRawZB
 h0dfLsPtNRuKKZY7ghuYtCf6BBNp6pErZsqWSsmpHwaaLXWzs0GD+C+/h1UdGlgEsM6H7xq
 W8tr+WyldVpmTWOlDUcT4xvNUo5bQO3zKG/DTD/eKNvCg2LOtdJuZxHUK/bt2zWMOLEXdcD
 87Py0TxY2ffVuuPVKK4xw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fqVpRTvuna0=;cSgfAouELmMoJiWh/bt1f5Kf4r0
 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

>> NACK, this patch is wrong because the remove function and the error han=
dling=C2=A0path=C2=A0of=C2=A0the=C2=A0probe=C2=A0need=C2=A0to=C2=A0be=C2=
=A0updated.
>=20
> My bad you are right this creates the following regressions: devm_clk_ge=
t_optional_enabled() registers a devres action that calls clk_disable_unpr=
epare()=C2=A0on=C2=A0detach.=C2=A0The=C2=A0patch=C2=A0leaves=C2=A0the=C2=
=A0manual
> clk_disable_unprepare(priv->clk) in two places in drivers/net/dsa/bcm_sf=
2.c: the probe error path (out_clk:) and bcm_sf2_sw_remove().
>=20
> pw-bot:=C2=A0cr

Do you expect more functionality from a devm_clk_get_optional_enabled() ca=
ll
than from the combination of devm_clk_get_optional() and clk_prepare_enabl=
e() so far?

https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L680-=
L699
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/driver-api/driver-model/devres.rst?id=3Dd220c9443db6e5f20a60ca=
d55c6a0ae7a75c63b8#n242

https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/dsa/bcm_sf2.c=
#L1365-L1568

Regards,
Markus
