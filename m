Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157707;
	b=Ta+mcZWkSFXxELYQaIb8eDfC78QLx+ZTGv8MLM+ocSVhIcNBrhYdv8ncaZBFnmrfvt1V
	 uqC/+JaigCzDJXdZdBQMhgQ9HHwnMAtfkc7l3VgaUS6bsxR3tql6NylthCtPLTZdJXhFe
	 hP9H2ThrbsHmpzk1isATb+/pjbU0hHuE6Nux9sLqq7wKV9qcp7LiK1mWooOxg80lJIPF2
	 4brD2XfSeDNhwwJ+0jRxpsS8R4CI7dfgdw8epJwnt2MsrKyDFaeNBYuf7fROoF8EQ233P
	 tFsttL+wZC7h6cZGujKHlXW6uai/gJ1ArcG0AFvsSSy6b9XXERlAVxtku0tcsTWVaVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157707;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=JGYVv5X5EdaO8ajWAQ/WkQ5bESiVSYqO0gvf2ejkaFM=;
	b=QwqgGUbytwQyZgP2RjVYMX0lrFtn/ujnDJG6xX56fX/2TjF+shHidCgOx5LHgI9Qe2tz
	 bxOKUq8C/BzjLxD2dsHnkgKD3yw4BhR+zL5nwhDJNClBfG9yydvDULNIK3t5IKBtz60jg
	 U29nR1nPEMOj7vU6yU4PREXMuIeuLCPtCudRaIMadVDIX8d1URvaCQKvqjFsSoMGkI7ul
	 tqlYqVwfNaHMWlwyLNlCav9O2ptZHim4aYPxwwwrqpS7ni4EyvSaOo5uo4Moio56SN6Wu
	 E2H/JkpGWK4gubb/leq9/wm+BNS9xGAs9xRj4yBfi5lR22krDjv+oT76Hw48vWh8aJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tF3FHFEO;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D9606A325
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Nov 2026 06:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19D9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tF3FHFEO
DKIM2-Signature:  i=1; m=1; t=1795157698;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:kzb5OFat2iuOd9zEjQCNM7C40qo3
   gjRyjqv7a/KlHvD6oe5Vlros03fy95+FbUah4nVQHnUI2x4z9Bgt5BxV8UVatHYVPD7cuVtxVq2
   cGU+QPhnWuHNZxvlFwpPPJroxejbAOVNoZ/KIxjKP6s2IH8aZAFE64coTnLe6Ah8mTfCm3g37p2
   kJuLnAGec8B7k5uROX/wgk6Pmx+lghfnU5slgmF2MFNGZjGsroEo86OhQIPj/8BC1+ovlRlN1T2
   qdSednm8Edr46oklbCT6RdnmSpITH+z9MpeM20ccLoqpDZ20BQn0o816y4FFfE0KX+znlDk/ZoM
   cq0pyetgl4YmZg==;
Message-Instance:  m=1;
 h=sha256:
   HLFDRTFUHXR/dpeayiExl2IQ7o9Tzg8XcnwePa2ikzE=:
   JGYVv5X5EdaO8ajWAQ/WkQ5bESiVSYqO0gvf2ejkaFM=,
  sha512:
   IO7sQGiiD4HJtXnJoQU06f3MoQ+RjsrBvZd2eBAWUtX2pJPRrz41xJjS3g3V9oLnW1rCYnPImI1KuLiGVhDdZg==:
   L+GcnNy0z+haaNhmKRwr9Vmmy3PFwnP2C5FTabSBoR4P5ES7/LJuAPzQRXYb36uZwjfYirgm2rl7iKDw0zbyUA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795157678; x=1795762478; i=markus.elfring@web.de;
	bh=JGYVv5X5EdaO8ajWAQ/WkQ5bESiVSYqO0gvf2ejkaFM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tF3FHFEOzvPp5m2qum25obsWM07M2TG9Qal7rVPk1ltip1Y3hodYyUKzmwe2hZmm
	 SpzKF3kjFHQZ4eFHnFvC5zUM8ewxkhfn0c6Z1VEXUyLyCJ4Sqah4RqP2qhL1dp3mm
	 VnaY7QD97/xBTfvxmUBABq9ZL/G16la8JMG0kv9yEZ+bZH7oTJR9ulOGuc+IwSPKJ
	 N90nE193wBHmIj/V34Z/Ye4/cfml1ogxRJVB0esDJeymY4O5Wt6Eul69kQstkkjFN
	 b2yNhHSrc8+yrYJa40Em/6rePvUgJEC6PdtJEaItMu7mqf3P5ZhaD3FGvEgaV38WR
	 qp0oEzB/JNUS1TGvIg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHEbq-1xH56E1rYe-00DtTD; Fri, 20
 Nov 2026 07:54:38 +0100
Message-ID: <676a1461-079a-4ff0-964d-2c394740cf85@web.de>
Date: Fri, 20 Nov 2026 07:54:26 +0100
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
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
 <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EHkQZ441LUfp7y6yYcACs5WZLJstzB11wnpOhbME0Osp+Qvamu5
 7CcYH6WK8ofbb//ZTmGddL4VlvimKzd0T3PwOQdmH7llaS1X17tpSTIdwYF7oZoI27g0c2o
 9u9n0lOgPGvzW2fminYmCZIgQCc5V6xKf4RzG1x5qzwLYBQyY6XIrtKx9hO+NFyy5aTQXXq
 TrKQbcwmkTC/Jpzo7v5pg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jjR36OY3Yuw=;877l3ieR9nzT5AjVnaeR8Wh2oHX
 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

> NACK, this patch is wrong because the remove function and the error handling path of the probe need to be updated.
Will further collateral evolution become possible?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L680-L699
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/driver-model/devres.rst?id=d220c9443db6e5f20a60cad55c6a0ae7a75c63b8#n242

https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/dsa/bcm_sf2.c#L1365-L1568

Regards,
Markus
