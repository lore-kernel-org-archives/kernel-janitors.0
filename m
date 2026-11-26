Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714649;
	b=2jQgraDXrvV9EL24iOwvzl64VHK2Dyow9DMgqdO1kujW/mBi1VAVfVUa2TT/FfpTiFqB
	 1hTKitsh6QCJEpar015pQSDz0pESZdAM2Mo4xBckPDaDnRm1XnAfYE1bFQEiQqueiRXO7
	 Nm0usGqVRUeK/oNsOrq+/ZH6OEhrvdM1AytzUIxTgP+FeZq1sQkDLFCuyJl95A3B1Y62t
	 IjVLNWqJWFs6ohwlfUQQwfy6cq3BCJE8iY2rdbWcFlD9CdTp6cVqA6748a0IH8mT1gOCD
	 Nq0aILhXf+Y/YRS9wVbglPtiGUxV2WhGuUaGdzPvv4b33U/VfpIE+tlPyLskbifk1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714649;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=KjQVkXpbZ+ewBe7mGcr4pjZmF5iLc9gaYu/dCZLVPpI=;
	b=NfF0HLSVGgf82+6g6ZSF7dClGCWHx01NcDWmd57bTl0HweYgVY7MNFq/ocmAQqsq2BXA
	 Aqe3NAifgl2VuWVdlxdMw12DxDdAbBkvSl/iW86+tI+xfkVHhjS1bNDlpbkdgd7u6wW2G
	 2pgb5k6Nz12sri8jU14cI4oIQHn/db/YOssZg5dEdf2bGqGxrMqeqVVNQd3j+n02ckVPz
	 S/QjSXDITB87r3EXVpEtbWJ7a7fVTj9xlwnKuHmZbQXbmzYpVMDtLf1D1w0ANi2qVsSpv
	 bOSu3A/V6mAKRZ1DDLYeh+IWcqnABUfR0gnqk96HStUua8KInPX1h11giXsBFFOjdag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qLxOihcK;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A859606A31C
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Nov 2026 17:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A859606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qLxOihcK
DKIM2-Signature:  i=1; m=1; t=1795714639;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:BpRwf2oVY0lRrlIeBYo80UZ6nW7X
   d0MF+AFBycl5rKMHTHIT1FebKaqyab5V/ttEkdeCepfWT5mgb/jVmsDlF+JgwiiuRJ75SO2MnxG
   ZgL33Rd2cOekl1ERc9yBvyHh9EJAdjS7yFG2VsMzrmqJi0arNC3pjMYe51t1B7XQgJSMoH+POZU
   tuTN08eFMU6jG/VQCzXlL+CFzR1EAehz02TQdWBWAslCA/ReeVVqsRhUlHiBdZC/80lBnbv5Fd3
   mi4V+U1IALGd5GnGwEjBV2zDNRyV4zLq36qXq4C4yu+VLCNRQkEhKPkNSTsCPZrOuaaZJkvwXsv
   PvrM0xSSraZ7BA==;
Message-Instance:  m=1;
 h=sha256:
   F7o9k7teInH6bVHyuu7COUvaXdASC8qjznL07oImUH0=:
   KjQVkXpbZ+ewBe7mGcr4pjZmF5iLc9gaYu/dCZLVPpI=,
  sha512:
   p1o6Ttn8hfOgl1MepGefGcwYULkIkDFh75+11wAu9JliM75+u2i0kdxt5mXKxDUkVFw10doYNlR8woK1mfxIJQ==:
   q/ni7vdx06XxQvS5SMllk9e6zH1QKVw3Uj36R8hi5aggZmMD38Rwcurj4Ol11SKo/marQ/q/AQ0nqFEF/23vaA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795714608; x=1796319408; i=markus.elfring@web.de;
	bh=KjQVkXpbZ+ewBe7mGcr4pjZmF5iLc9gaYu/dCZLVPpI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qLxOihcKbTUf1NIgavStxaXWKV0A+DXk3pRYIarNvRAiBgMpgPiw0luUF24QOo1W
	 CzbdCTFuWzf3gFvEuPieoMnKIHVcr/r3sTfkBaOSOIkqdW0rJ/3G2tFdbMif9NpaN
	 Mj3rRbuygiwK3xa3xCGtfB3o60Uz3exrLk5xdoOdPTjbybk1IMIAT3TeC8CG0cEZ1
	 FsoXas2iiLzJ7UpVO96K7oJbnVBWUieWSG/QPg2lpSxsSJtQu/dZVnRuUj8Ceuudk
	 TsEoKElc1UW1eDg2I/vCuMqemrBhIMNlitMi5E7wDKO9nEG0b2NCvr6kQ5vJB1KDn
	 1EAOsiCWj7Wm6ygzYg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mav6f-1y4aN23S4x-00b4UH; Thu, 26
 Nov 2026 18:36:47 +0100
Message-ID: <206466bf-7ed1-41eb-b74d-6f680ab449ea@web.de>
Date: Thu, 26 Nov 2026 18:36:44 +0100
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
 <d11b4708-02d9-4d53-bc5e-734fdb363d2b@web.de>
 <f3de129e-bbee-470d-a1df-e867269522cc@wanadoo.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <f3de129e-bbee-470d-a1df-e867269522cc@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zEkgFKxFLGzECQiqSJfTY7X86X1opUEhpn+ydUdemC4Z2kM62QF
 nCyNaB5ERPqN7Aye/wFRnBdqfgXCFByCKpWuK7hceITb4qgW4dediJiXcqG8uUrMZGfPIf7
 jyKSfyb2LfbvuNNlZJblngRr5OpDMIkjCf2iaqJI5GqD9/+bol1GvNAtNAmCj7RVXF30gZ4
 qxZ3QwF4Ph6FeQIMJgupA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iamEvrdmJM0=;RejA8QV7hcNZf8pruzzZDfU95T1
 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
 yOUmWv/TfXyIrAKuKsfA==

>>> Your patch is related to bcm_enet_probe().
>>>
>>> See L1754 and L1791. These 2 calls are related to 2 clk_disable_unprep=
are() calls in the error handling path and in the remove function.
>>>
>>> Why only update one place, and keep one clk_disable_unprepare()?
>>
>> The ungating of the item =E2=80=9Cpriv->phy_clk=E2=80=9D depends on spe=
cial condition checks.
>=20
> This does not answer the question.
Would you find further clarification approaches more helpful according to
unbalanced clk_disable_unprepare() calls?

Regards,
Markus
