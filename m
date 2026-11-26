Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709743;
	b=KOfOqN16IT7VyjACrfecNRlgekCQ7xn/Eho/6tYwTKotf6ynFF1zUNgNRcVJT8S8Q+Mo
	 IckaORX2gWwOCpTiK26LUFr0qZ/h/yN5RHYAT+hiKJNH9gP2rsRnPobTnqamy/enEwSPI
	 twJ9xiV7Fuhu9IYXmB8zdk8m+EQ6YWTEQr4aMxKkhzwVaNbcoGSHAvSgV1t77KFHrMvG2
	 42IFmD+/eokUQExMXusfjQg1NFqAzLqz+diAB+Uu3Gkin7OJSlpiDnbQAfeF5xUiyz/V6
	 bL79S7l0fCIbACJ89LZJSJjLNKSusOsOpo9QWhMi39CvyaksSg/7T4c4K3fqBA/9kvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709743;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=GKuS7nLZ3oMQ2Nkc8HVI+BxFOyzbOxVBIuQcZG1z19o=;
	b=0NHNKMyJsiX/5Bv6hqvYoQNLUigNR5gac7UEf/SzvbQfLKPy4Z3uqs7F9xBqAMI/LjO7
	 Fgrhxo8ZG+TfNgiWuz8Cp8wZsU3EwC/c3NDmn6OF2LG4v3Ea7oXrTCiHetUIcwAyVxH2P
	 udM+0QY30DZIztp5u6nOpa5+a4ve6t7hy9ywQXarRINcrVeuxK3fZaNJnizW5KavxbM/U
	 VSJ3T0nb7hrqUwiELQI4nByrQcMwusSCKyWPu9tUXjQf+rpyT8zgjs0ZJLIltlqTfNpZm
	 gEobL4pHD1g7cV+XBFZ86FM7oNT/3LSyzfrbvLpHT7S1Auj50Nnm0xoqs2aEu4Q5W5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=hMJci5ap;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40D606A331
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Nov 2026 16:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF40D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=hMJci5ap
DKIM2-Signature:  i=1; m=1; t=1795709735;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:bkEnLHTaj6kF0AKjPtGUS1VLVnkp
   Fyi6P0N6vScbkdWECNTGmZEHra0wAwgrhiQU+N8mH8EAo+yQlcRFCik0SrjmQr9/FT/PfDp21YL
   nMiwuCMCOidW0SarADwWxtgDocMibvfpEOSh70jztQ5t7EShjymXWiwziQsYfIF7+MV+yFmtl8i
   wZS67yzGYLI1Tvpc7uHz8gFClqXQtgkpAMNgFLvRsRHuUzyoN2S5DWx7Jcm/ED6P6weqdtQ//gm
   lzGYkYoRMbeaTDweDa63IFclimfUET99NMEDvdMVYw8qADfx/NarXEyqx+ggCbuCxka4e8GsogO
   0nNF17OlA75ZjA==;
Message-Instance:  m=1;
 h=sha256:
   Xu4s07prBiFQoCMjTHbugfcUsi9xDwfkskt73zzUPWw=:
   lYKjP3NlDaBTyJZVE0VCLhdWFb7V/zbPJUWRMvW4b1s=,
  sha512:
   Ng+Y8qLQnijbr1PqewoRTXjzYGtaQ9Rd6iZYo64NhHnqxQccx4Fa0OYNf2h0C0Eh6lN/Cpe6q7ACfNEV/CkO0A==:
   DDcdi6+yNjPPYwYfkU7hMggaAhoUN83CywhImhoC+qW46kfAJT/QtT07CjoAARptGAs0NngmflnsBWirTtoyWg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795709732; x=1796314532; i=markus.elfring@web.de;
	bh=GKuS7nLZ3oMQ2Nkc8HVI+BxFOyzbOxVBIuQcZG1z19o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hMJci5apK+B/8Qf2UkOZVb+fU4hdBzJ4xY+WRJnleVUetffseiMpA+6wxAO/eY8+
	 yL7n7CCw2h9jHgK+fQ74EeziecsZGHDh97/BO9kMX/ZE2dUjXy2cRf7/4yOLGXyuu
	 5JgLznZ/73PWjDIUwlf3WUJ8qc+MwWsbXpUJIM/rj3TwTuK/oLaXvHb9culD5ENzt
	 6P+DzP0QzCu5q/ksvWjErF9VLxMDKzhw0heyrglyi+ZprC8mF/icL3SKSPy0rCv1+
	 Ak88vrGJYcluwNtYbno1N3G8gIGms5zr/F+XRsenTISqVt7POcO/h0PvTOtHrg4sA
	 yZkOHI0qRAO5Tl0raA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbCHy-1y3k1k0YnY-00fp1C; Thu, 26
 Nov 2026 17:15:32 +0100
Message-ID: <a526e002-c8fc-4935-95f9-5943cb557e99@web.de>
Date: Thu, 26 Nov 2026 17:15:27 +0100
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
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9c26b213-aa58-4c27-99c7-926c6b4d5275@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3TBkhHz00Ppr3StysJ701/4TtJYA0mtUQu7GicKK8gG2dvf4nYC
 pcKI2pSrAIihQ5LWUNcjZV4KkhZhVLxxOTu477HTvOiVY5aeQEHy80drKq86akmURppm2nJ
 wp/jbkuZUfjbQzzsgiuYsbRWssuwETWFkDktemsxS8x1leYlNRCzb60kUZx2OwArWE4IKWH
 BwQ44UL/IzzWqKuOWEfwQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/4WIJLFraeE=;YAm0QeD5TOdCWGUZXGphFYkoj9N
 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

> Your=C2=A0patch=C2=A0is=C2=A0related=C2=A0to=C2=A0bcm_enet_probe().
>=20
> See L1754 and L1791. These 2 calls are related to 2 clk_disable_unprepar=
e() calls in the error handling path and in the remove=C2=A0function.
>=20
> Why=C2=A0only=C2=A0update=C2=A0one=C2=A0place,=C2=A0and=C2=A0keep=C2=A0o=
ne=C2=A0clk_disable_unprepare()?

I got also the impression finally that implementation details would need
further clarifications and development considerations.

* Conditions are checked for the ungating of the item =E2=80=9Cpriv->phy_c=
lk=E2=80=9D.
  https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/br=
oadcom/bcm63xx_enet.c#L1789-L1800

* But a clk_disable_unprepare(priv->phy_clk) call is unconditionally perfo=
rmed
  in the implementation of the function =E2=80=9Cbcm_enet_remove=E2=80=9D =
so far.
  https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/br=
oadcom/bcm63xx_enet.c#L1930

  Is there a need to adjust the control flow any further?


Regards,
Markus
