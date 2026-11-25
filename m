Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623088;
	b=aLtdFttmrAtmlCcEaqI9ojzSwVDvNnE1llRpTb0s4FDMraiFCiHaUuJhk3dNqlggsO3b
	 sYerflsw9v9aekeKSMx+X3l5HCh1SHDssf4wBke7C5QS4rGq2k+cM1/JtPMToaVGbNwVD
	 Qyo0SZ2+xM0PFUKhOm54Ka70TNISlJW4GLBVs6GhwYLarV8Phjh6VyDN9v0FPk12MCPGc
	 4wWqZXkhjSjoKBKyTXqP0/rUACECTov31TCOtN8BYipgmr7LvUwKmvVBQBqruti2GS++5
	 Z6RvGvenv5rHn5PHpGC3m8lDDUqetNRFMto4hzUFAoBFAxQGkpLVthvxkf7x1Rmnkgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623088;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=shMr3VTsq3XeQkoO9Ln5izMtWpMU+7APEuFdjKZvMdY=;
	b=BWTMCQYS21Tbmqo5ebiQo1Pn4V8oYokesekFnukCxAyBsbQjmIm5W5wG+yH6AZwkx+it
	 CHhpO3i/GakS093Eqoe5BqJmFnWU8mcYtsIlflpXChCf/Dkx46N/3u3+8DP/1K6/WnACT
	 jYXKfel2ThCRBq2HJdu6Li8gDGpfbAIeomPO1kiKG0fmQCe8XukixSO84CJFjCDPDb03a
	 Jm1zKUagu206yGA2K4QazzuJmxqAdIfQ9hSqb8aQlOTGRnczOHxIhlYpIE+9A2VAN0g08
	 jUDvelLVOk6EH5cnL9NRMo9pc+C7Fpm/t4dFvNNl1F8WO1B6EeoUwJTYxprsbPvzY8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KyKHSlK5;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8EF606A31E
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Nov 2026 16:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KyKHSlK5
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 69D6B1A17F5;
	Wed, 25 Nov 2026 16:11:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 345CE60480;
	Wed, 25 Nov 2026 16:11:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47C3A11E6ABF3;
	Wed, 25 Nov 2026 17:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795623079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shMr3VTsq3XeQkoO9Ln5izMtWpMU+7APEuFdjKZvMdY=;
	b=KyKHSlK5Ey6/akMaHN+c+uAv7NDQWG/yMqCI9oHkdzOeFbzRpfp9AX0SGw1K3164JB9OmD
	SBOtdiMH+BGgUgF2ct0BEaPwEFVq/GAtFqSZs0LarGryqPr7NPXdYBiOv18ORWOyFNKDw/
	rfUe1p8BMVELflNxh4NBO6aqhw2OzQ/wmafCV6jLdu1BO8GxEpYkJUDmGtPPEZ1uwFGMHn
	iSAxv03Cb4YalrORtMHi0FOmZuAqIud4DNo5mZFLr+YVVHtkCT24lJ73yd0ymz+CCnaIjF
	cR10/N5EuLjCMv+Ee288k3V7r1nHhACNaNtZpjOt8gJyJQTfe3yNYM412T5HWw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112162127.1592210-1-colin.i.king@gmail.com>
References: <20261112162127.1592210-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/bridge: tc358767: make read-only array
 ext_div static const
Message-Id: <179562307394.731258.1793421800570057727.b4-ty@b4>
Date: Wed, 25 Nov 2026 17:11:13 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Thu, 12 Nov 2026 16:21:27 +0000, Colin Ian King wrote:
> Don't populate the read-only array ext_div on the stack
> at run time, instead make it static const

Applied, thanks!

[1/1] drm/bridge: tc358767: make read-only array ext_div static const
      commit: 632586bd82b0158a97c6eb6830375c1efda6e0f6

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


