Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25B21D3F2;
	Fri, 13 Feb 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970235; cv=none; b=VJ536jM2X7V9rdBANNAbM0KR6TG8cpDlhIx+ZVh/eeczBvFt3NB0fGWux1BIz5fU4Njx3QA8ELixZzDY9hDmTK0KJyQs+e6KD0ZAO+AVLyrYGHrJL/q0kAYiNC1KzihybJ4LX5NSR03Hq4LO62WwfVI4OpCqpy9ZGqXcujkG0ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970235; c=relaxed/simple;
	bh=2mZkXwAQe0aoxNW2rm71dAQhJhiXYyPuCzVX5RdPlcU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=UCAt9YMlfcm55c7QfXP66QDjJ1SghLx2iXQpp1Q5U+etA9KtLUtktqxiA4TWqM5TrCjOAdnGp7QIWkSCR0OjwSRTwwp6QQShJ9ylx9EOI4VlXGF4Ws6OgN6tbeIYZuQWPq2++iI9ZhLSjT8ej+nokC5gTfplbAoC8XJW5UB1mdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OYBLKvC9; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OYBLKvC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770970208; x=1771575008; i=markus.elfring@web.de;
	bh=UEjhHh6Fcvlu+HzIkHkBKi5Qqzn3ILfK7/QXjC2ikGY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OYBLKvC940xauY8R6lGHRiRTd0HBZc9V83EUPyCWa6t6pODJwYyQnoQIb4qsiILZ
	 JEexzrIgqYMTg12xlm4+ZY40mE4r/zDlMUKzC6PlFUA4ZTo9tzC27B7EYC0y0kNbg
	 RobXLOSLT5mr3puwUt7IregCTtDHmVd0fYl6lPL8Fw0rzrg92P2Y7/ER+Ejuv3s1N
	 zPi7nhV9L5l/AA+Lhj4cc6lESOqM890tMjCuLemohB0E08CXBU/vrx5GA6pg7FybJ
	 tvGK2I5PQMJUoo2+cEscxx20dovLOvIogRmJqkVeU57fS1FumX6LQt7v9A0IB8Qa3
	 XHjvGcYMmvYxWaRJQg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.207]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MALeR-1vxAAV0bZT-005ivR; Fri, 13
 Feb 2026 09:10:08 +0100
Message-ID: <ffafec42-8d5f-429a-92b5-1b92c7643642@web.de>
Date: Fri, 13 Feb 2026 09:09:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-phy@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260212-wiz-v2-1-6e8bd4cc7a4a@gmail.com>
Subject: Re: [PATCH v2] phy: ti: j721e-wiz: Fix device node reference leak in
 wiz_get_lane_phy_types()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260212-wiz-v2-1-6e8bd4cc7a4a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:70Ly/JfCzAnIyZ1updGPCI07IT3iLMNtkQkx+p28EKqxpyh+Ph8
 mXSxmnz0mxOtPe9JR+BwwScuHlmHT512AI0Um4ngWLLIDxCtdskpyhwXcjWRMg50zDC9I7H
 81x5KG9i1sOSUg7darhWNv66ObwCF0AV3JPixzyVKXXY62osZPJ8rAJ9Q7UAHTPQc4MU0h3
 DnK/4ovpSTqkOHLtq/LCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MdR26s9NANI=;ItUBG4diUPgZpElMVp4n6i3UDfp
 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
 2WEY2Is5HAbPs6P1ZyrA

=E2=80=A6
> ---
> Changes in v2:
> - Use of_node_put() suggested by Vladimir Oltean.
> - Link to v1: https://lore.kernel.org/r/20260211-wiz-v1-1-fdd018d02f33@g=
mail.com
> ---
>  drivers/phy/ti/phy-j721e-wiz.c | 2 ++
=E2=80=A6

* Would you like to complete the exception handling by using another goto =
chain?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/coding-style.rst?h=3Dv6.19#n526

* How do you think about to increase the application of scope-based resour=
ce management
  by additional update steps?
  https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/cleanup.=
h#L157-L161


Regards,
Markus
