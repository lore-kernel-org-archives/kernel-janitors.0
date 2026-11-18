Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029625;
	b=DnRtpu5TavV/cZO9+It88QsPoB7vSjBhZhi/YckMCGGgwOz/2N0cYsKwDdlJ7KUGxUg4
	 kTLgzPsSMKtF9P5EAFgVgQGaCBD5cFW5yT9Qx/OH0ZfrhtJyQ2royDkegvWgMdzv5xbny
	 qRexoj5PtahM8cMlj06EEodUa/aNO99D/pnJCG/xHV5dJL98A9fR2+HjtbTHZXPT2KT0J
	 y+S6nbBtYOxFqiWfeLXKYUDVw+BB6KK6h2QdaghZpoQl9MhOsaj0OpB+CXw129aVSwreM
	 B9GD3xnacFgaW5ZJUEp/1CIVJP6v/2/sGtF+baS1pMlPxFhkluQijKp5/Lztehaspdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029625;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=YsPXUafpeavaQIQHcvKk7V2uSuKpK9mdIGN/IVszc0o=;
	b=hmpxGzCISOET7h7G0cqbCaFImSSH+nmDO5Ud8Z9PAC1F71o+KqvQA7qrzdBY7KmsLoPL
	 vWJyDjMGQR747oEU4dODYr+YWLPPCK15yINly506g3hjX2RXO1SAgSJCns19YZIv+xuQP
	 UJRu5qtkp539u4uW7P8wh7VnMpr1gMuPiWFlu+lUSKF7Q7+WYVPAr9TuJBqk1doZkUqia
	 zEq8d65iUx6Inn0C5ZmszqOPcTV4gbYCTorJ6FJD1PEhTtZTHpqd33qsJEFSROxEFWxwb
	 WNMuqiqKQZ3/4VwVfoHnOmY8Hs0kBi0Vz2OYfLoLkYlksVYzQxfKuu8z+QvR6IwGDaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IZUbuWCa;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0410606A32F
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2026 19:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0410606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IZUbuWCa
DKIM2-Signature:  i=1; m=1; t=1795029622;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:sjBMztACch5GoA1c1QwW53ShiMxa
   5RbBIOu3I5fRQ0pM1rMO+Ri04W67AJsWARxi3HytMb0OUfayW+eO+AABNnHvorrkugWXhAG3urF
   gMfPkXpZ328eVdrVwtJqCNH+l9BxFtMpswGyyqoemrzzKgpjAvjltxf51Xdg7G+JfRtl1DKpDGm
   YqqvE/oiziXJ0w9QxI2jz/bc7DvU+mtLmxYmWREu3wzWCJIZExQ8xOjBDxYpH4VFNSTlnNzpe9j
   JDrfLskYieXzu2UDEO2YKPBDncdtAnsA6rybLqYXm+KSZqXzGF8PZzuHvvLHpXiCVv5UFtWdeVU
   u6ffGZ8rhGnEAw==;
Message-Instance:  m=1;
 h=sha256:
   aaomKyIFMfWIzg7ueKo+fLQMD7KOlRp0nUVG2KeJiFE=:
   YsPXUafpeavaQIQHcvKk7V2uSuKpK9mdIGN/IVszc0o=,
  sha512:
   ueQf/S6du8jvZvrdDTmZpeJWArJJXDJSec6m/g2iKKrTNlgYU6QrMvJeV5QYRn3hV5ZiEg63Xzyo6r9s0itU2Q==:
   3AClPa2AqlEUfJBF6fSQ7go/v0gYOO7ufviePAieKxVDRspl88RpfRWZhD+4uMH05yGBx+Z70IBuyjtWOO4qZw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795029612; x=1795634412; i=markus.elfring@web.de;
	bh=YsPXUafpeavaQIQHcvKk7V2uSuKpK9mdIGN/IVszc0o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IZUbuWCaf3EyDigJAklO7qcQ0ZfPz7+24cTtB7+8NEQ9FitzbnzyAKHj3a7dK6BB
	 SGSa6yeA0VzvjTLpPCbJepPQjiNBvZ/SlZFpkpvIR2uBRL+BkwPznv5QO8FvTziZk
	 AYcTKnuMr2j7p5CVqjwwoWbRuco3mhxasZvVLG6JjzEcyK/EGq4UfW6dfkQfSMr88
	 rI2bHyLLbhvWIqV+kDv/wcYYUbA6YrTRiZOgnkTh9aqQj6GhTRza+o0c3oaXoBI+F
	 aRIVx475nalfqL6BqS+5t7Q23sbRU5FMbnpirP8wZQyvmosWuf+hCImte69dQ+GAm
	 s2yXGSUmc9bfpiQVyg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqIB5-1whRsm3HhT-00nxIC; Wed, 18
 Nov 2026 20:20:11 +0100
Message-ID: <8f54d634-ba46-4433-a60d-3c995f15d57a@web.de>
Date: Wed, 18 Nov 2026 20:20:08 +0100
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
To: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Guangshuo Li <lgs201920130244@gmail.com>, Johan Hovold <johan@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Miaoqian Lin <linmq006@gmail.com>
References: <20261109072450.1005-1-zhaofeng2@cmss.chinamobile.com>
Subject: Re: [PATCH] phy: ti: omap-usb2: fix OF node leak at probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261109072450.1005-1-zhaofeng2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yUL8maxXRC97rYFEN0uyAcf5aDeupVq1VC5b8Gi/yy9MU8OdHRl
 POnhIaQi9O+NhUl7qi/Et4o0j7CJ+Rk9IQgfNBBGfSMPl0LeZ1oq3Z8wuLcqQD1tqkIl6eI
 myDL45Py2mybPYLRJT2VUTzjaKVafpfllPyDQscMyMPozfcV2xDHSKl/+UlQkACkuQeL1hl
 XistXRAxM//m7yTXynQ3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SuMvMHw3/qk=;Vm+RnP6uYvVuoN9XmLRjLkxwR5q
 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
 fBpGDUn3ett/nPGttdiWHdaHsPw==

=E2=80=A6
> Drop the node reference right after of_find_device_by_node(); the
> device reference taken by of_find_device_by_node() keeps the platform
> device alive and is released at unbind by the devm action registered
> below.

How do you think about to reduce also the scope for the corresponding loca=
l
variable =E2=80=9Ccontrol_node=E2=80=9D?
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/phy/ti/phy-omap-u=
sb2.c#L373-L515

Would you eventually like to increase the application of scope-based resou=
rce management?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/of.h#L138

Regards,
Markus

