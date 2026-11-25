Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632169;
	b=fMnQSIh6HBqwB9r4KpVxAul2MrRWwy5NXrxpWUkyIWWvWc8C6NzmHcEOKqQm2izep3S0
	 cPucr6p2lT2aWfNbqnLomQO9XhXGqRXF48zyeu1xaDBSMun8AA/s6IwtYqG3B/e/xUOhi
	 BUXNtpL31RKw4hfLnNJWIYQ7ln/5WtpmOFDpCVuuV/jHQVBubS8V1ohpQie34ZMM1jvvH
	 i1Fz/r7vLL2v/6sOztXXvm8kKRFRN2/s6OvrtDfKBsYnOsSH02scOO0Z7UYfSdPxDYoct
	 BUxELXRqaY/pcJ4qJoJsgdB3sJYmW6AkzhxYFyBJIhMeuDkTRM/GOKkZdpjR7I++f/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632169;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=IB2lwa7WvNvoG9z9IadBCcoIMefx+fUjaNxbR1Kxkj8=;
	b=MADuYgSLk3elUw0VITbLF3CM0vWTLck/ml1L6QtQnhI52wh7c+xjqjxUoQ2wWCY8i5s2
	 MGhiLd2Ec+nGefdqx+zPvDDzBIprZuMKOGJNch7mv9xpgqhUUOlQ53UL1mhgrMHs+BLrh
	 ESP2/spHZxvuPFFmgqhQVr2ecf7e2BtUASv5vl8T2LAcuPyiPoh9nYFfxKJhhbgMEg/B6
	 1cLNW8RTsu60wzL9SVzViPsTyyJ/LoJi0mBpI0xPuSLa7uuDGmXsaHGO58FV9iKYHzY8B
	 J0uiKYZjEnx1lahsdSodXLRX+5Ea2rw1AVmqlpJXFQn7OGlvein/JRJB+87XSIxjorQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b="G54T/iOZ";
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294AD606A31E
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Nov 2026 18:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=G54T/iOZ
DKIM2-Signature:  i=1; m=1; t=1795632166;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:WALJSAXf45PtDKwMDJjXse447F79
   6JrBolkfSGwOBjxNcuu6dj9L1A9RFOf71s3sFTfnPUerhHEe3FhYuSE8k1M9TQmXZDzwj5+vIXU
   PTI3MAfBeyHAPq8pYJDEmxALlRuFLKV8jlp6tyjbglx0bByRqmBNMJzW4+o1k7NFiz9NeN/gpY+
   Ycuz5uPBKCXP3zg35Cf+3qOI1JUCszUBMsyyyI0XsfIpycJ3czZwvyMpVLDoqewCRwwb5vx4SkO
   Q0Lo7jKbByoiu4uSdGEFhQFdKhXZ/yeD+A9uxwJSpRbcS6SqupURpxeqOSEE+ZWVyMtesEi1J2i
   kkRJ10ukthEJUg==;
Message-Instance:  m=1;
 h=sha256:
   8tjnvHcz9CmVzT39u5FWT40v3xMpM/YuobKsHR+W3dI=:
   a6vevOUFkSKjdXMBzoczSgb50Q/dbAJFCj8WYjznb9g=,
  sha512:
   bV3vDaHNh07LJAtWxScRXcGgM9RKmph8S+p4hHMc1qadkM0iBcVTj+BEuOtFYIWBPnBUDC+hJ3N+zvMQDs+jGQ==:
   EETQgeSIyxdTUToQkxA2DwToSjvr0XCIAZj2FFg+di0GWdXe/Jtk4+X4C/vc6fmvTo0Us7xUn2HgLfin+D6q7g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795632158; x=1796236958; i=markus.elfring@web.de;
	bh=IB2lwa7WvNvoG9z9IadBCcoIMefx+fUjaNxbR1Kxkj8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G54T/iOZPdcurlE6QQWM373/etY8J9HqefNT43043lKlTWDlbjb2z3+ybumaH4sb
	 Q3swOwRJIm1VaaYul3iiGDYuOfJXs2WSI46f+WfuMgsCyWGLBVHYjS2fPtImkI+13
	 snmZpevXPRdXa0sOUJ8bdapJpBW/MURTMsovyCekl5zJjddRYwLtFrJBEZUSI9KhM
	 XCVtNKSPDXVUgMqvp7gadKed0CU5pqZdsPxOoOxhrgS0rAcFXZ5gL/h7twtALPKxk
	 NWqALqu63y/Pccs4BZrlnr0kS8xQx7qCpGYJpqmI88O+EMu87fE7CgW4Vhfo2rdCr
	 TbovTu3rZDgl1EFUxg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0qvH-1yQKZn0HZN-00xXzO; Wed, 25
 Nov 2026 19:42:38 +0100
Message-ID: <603d7ea7-5d7d-49c4-a01b-a7805e88c361@web.de>
Date: Wed, 25 Nov 2026 19:42:34 +0100
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
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ac10d9ef-b193-487c-b4c1-6126aa770c6f@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:pBjU95bL9Nv78KcixB2UCyXmEAx6DB2xhcHC5X99A/nzVrQvRb6
 9ajTTOLdkzXgHVnMSZ/3e5fkPIUByW5wNB6diY9xsH85Z54x7uXJoP80akx1m9A7UY1ZiXn
 yT2NZThnNJgUdy5Fz5hcCXilI0TMVfp2EtT0WGZNIz6Az5tVGUDwwKDOrC3TA6vlt5tvX3A
 +oRZsK2u7G9BZ9W4nkVQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qrVNhEYuEPw=;28y+kiyyebpZcEpkpRuxoj+Aq1g
 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
 yT2IBE/8i2Q==

> Why changing only one devm_clk_get()?
The change relevance is varying for the involved clocks of the affected Linux drivers,
isn't it?

* bcm_enet_probe()
  https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broadcom/bcm63xx_enet.c#L1711-L1898

* bcm_enetsw_probe()
  https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broadcom/bcm63xx_enet.c#L2641-L2735


Regards,
Markus
