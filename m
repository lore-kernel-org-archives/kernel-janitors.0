Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790053;
	b=v58/K+pSQADNmzV3fBttHOkEczylDbehoPy+xlS6GTAG+O3eYQKX+O+0TrKj3sN+J4de
	 UIiXbjdR66nEvUnhcHBMBLIx0OHwEPSuV+oFKhBrzY7ava1kV6Iuq/U3lEMLJBzG1T7dc
	 Gu7KzJq262NYrC/dlGSMzZo7ktqdWhTMRfgBeJJTsWyltCVEhqwlSgIHtJIbsfa4SH1rb
	 QUBGwfpCLBRc3b0n56F60qM0sefylwWdDP1pHRM+VUyi6CmMaZaUOXHbPtanDmbPRUloC
	 7WaKI2sry4vtjFPuatiVs+rz18jvd73U/krn+YyHU0LPA7KtJz/V5plJ7qnB7a6T1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790053;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=x2ron61VPHU9a6vzwmYZaosQIzY1zhgVaDgd04IhfVs=;
	b=zD2hTzHk46e2Fhj/qTUW/4s7CVexK4nArPN7gAiM0ryH9yIGO6ssVsZMSXNc+9ovhqwp
	 Xa69axLU/zbS8ZvZiHtSYxtpqZ084eC5NnNE4U62D5zz3hzsv+qtuI3kHynJq9r1f5ii1
	 q+2FxzHh/2liMDsq11b+5UBzRARa2t5FUTLURpf7XrNWpuXFm+mKDjoxr2y1cR6kTg62Z
	 QHhIHx8OEMVxrUQQ6zM6OIvJZH+Qx0/7N9pwHQrtPl6tYPwkvJyXaVJXXYjR+5CkRNn4D
	 Xs5z6KpfXKQNL24F6J8U4eGk72gPAzyIX/v5ZRDKenzUizNcB0Jh8yplVsulNWncOGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ahrhBRoa;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F1606A326
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Nov 2026 14:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58F1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ahrhBRoa
DKIM2-Signature:  i=1; m=1; t=1795790044;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:G4Tdc/+xt0bZTybYIFr+jSrXroJ/
   uAkKXZXvaX5QJtpm9O9KxuH6Ln4gbiCzGXS5bK8ac9Dzffi1AQQr01jK9IfylLKSqHB5stp/t1L
   s+usKO0/pNgG7VcRm19E0zh5hJmLFyOlIBz8UatN8UIGp51++SsyXPxzL7nXzdhLeKpOLv/SZI8
   FIQp0LAz1sh3uQvexYgQZtSM90ykP6faTxp96afC1C+BgtO9534Jksq5Yi4910Eok+CzJ9iJk2z
   HGpa+NL6zG5tbpa6Pj81gpONKzAmdBI4pLqBPSgHtitLn/7fVVO9DzBnEceap3LWY9ALpJ8WvIh
   2ZZYzVg4dcYSww==;
Message-Instance:  m=1;
 h=sha256:
   kffCLkKB81aFUhz13GW3UR0gZ74yzG553N39HkbO/jA=:
   37o7756/H9wEWUIDsYBF92wkbH840h+d5ZK6KqL5Yws=,
  sha512:
   I14mB33HfWbUyqpEm5lp4jWmCDodZ8myJg+W4Ju8q/VfWWjN5Ev+xDxPCeSnuYVANUtkqQVEWDYiJX9dHedeqg==:
   uCBGQChhMavAkL8ZH6Cig53fB9jvYVQI6ipTk0twMZGKRVRQ/C9iVH2VJm9+L4fwIu23qdVGuPrLG46z+5PfQQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795789992; x=1796394792; i=markus.elfring@web.de;
	bh=x2ron61VPHU9a6vzwmYZaosQIzY1zhgVaDgd04IhfVs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ahrhBRoaLRtfENV3vy8JFYtsUqN9J6t6Yc13be6Bj3xYwbc4vN077tmuMFogR88c
	 jwU1x0F6BrWZQRilizaMe3uA3KCM3WOcvZ8giRl/Z60sayJJRXtJ6iP2YLop7LeXd
	 Wbf55dCHuSclikkyAdhTAbELRfyABmUBWw1K46dh0ZCOQxFxj79ojB41j0iahducd
	 3vJDEpq88ib+Ap0Eu7Dhsj6izhvthM/JPxEZmX2G4GHW5N/Vx2lpPvdwgzcFwQC7T
	 Iui4vsxVsl7VSdCN9geM5l7k6qxi9C6PMyhMLAaW7GdX3R0FTriBjCD96k2g5sySP
	 IcKYckBaEjnSReBe4g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3Gkg-1yX42c11Wc-015j9j; Fri, 27
 Nov 2026 15:33:12 +0100
Message-ID: <fc0215cc-0f27-4af9-84dc-34a134174063@web.de>
Date: Fri, 27 Nov 2026 15:33:05 +0100
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
Subject: Re: [v2 1/2] bcm63xx_enet: Prevent unbalanced clk_disable_unprepare()
 call in bcm_enet_remove()
To: Jonas Gorski <jonas.gorski@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>
References: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de>
 <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
 <CAOiHx=mX7HYFXt05G_cH+u3uu3pVZEF5W5j2M0tRs6PG5swd_g@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAOiHx=mX7HYFXt05G_cH+u3uu3pVZEF5W5j2M0tRs6PG5swd_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1B85dATc5fm5Et/FI1YSZNqij4wi3eX+0eV2ilbPAUDmEpfYOl/
 MF2a2r4vRRdBGe6bF8Z5TSU0ry2C0zqdYMWKTzKYA8RrXd0coFQl/TUqhlU9y6TXFasDJXw
 fyBT/ozIeyodhoSPrZiJS7E2vYafvyLAcDyYtU0eoF8C1+i6fMo4x1OYrjH503yEWMHJbPc
 4A6BFFIHoNNQh4gYpOmhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Mq4ex4HGZpc=;xM2gra8Iu8AY/xX0OvhPorEX4Et
 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
 A/gnSIn6PbWdjrMvQ9bV+IqusXCdW1FxYQ5UKvU=

> clk_disable_unprepare() is NULL-safe, so it's fine to call it
> unconditionally.

Where is such an API property documented?


>                  This change fixes nothing, just adds potential
> breakage (disabling the phy clock before unregistering the mdio bus
> feels risky).
Will involved software dependencies be clarified in more desirable ways?

Regards,
Markus
