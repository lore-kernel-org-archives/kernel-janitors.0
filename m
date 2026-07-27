Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1612F30;
	Mon, 27 Jul 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153540; cv=none; b=IZPp3Ic0WZCOamAiaAP3gpt1K8mDstxSHNWdNbfcjfIHIXmGFEH8CItzccWJA9qSYLl2bfgSPUQjq6gETRXb4+eDLF0BOA5xF06mbm+Bat3G7T2L+Eo/fk/ukmNZ9sy6MGh5Oy1GPqgoCaBIVjYGU1+pv6Z17aQGDi7mO43Z8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153540; c=relaxed/simple;
	bh=V8MVswdu2BGMjTzJoM/J7WnrG5yS7tD9pbDjHZKxriU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TTE326CA1kcV/yAkgsTdcrNmZVziibKTJ+T1IZp05CQfUHbG5RdeXCNK2WxRSSDor0SW870xAtSLfHhstoEU1X+7ORfYv3WH/l9u6YJr0zvFCoJcqrBzX/hM6exvxOUQTRZuEgyFud9gFaeKCOCRhCSdoN+4oba4AyibE7xLX2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d/YPVHg/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d/YPVHg/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 095474E40F98;
	Mon, 27 Jul 2026 11:58:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CACDC601BE;
	Mon, 27 Jul 2026 11:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5239011C132C9;
	Mon, 27 Jul 2026 13:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785153530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EqAKzk5xrvg3ShN4Sp8KGmU5+gQ8oVyTyeq5VHw9aXo=;
	b=d/YPVHg/5akuNLMikiiUX2CdtTFLGwwabngUj84xvPEM1ucCvYtC+JhCwwXLnwelNfEW6Y
	RA/wR1SUF/BgaXFWNySovgMcRcH4tUyeSBuGBX52LWORsBSTkiAGrhtUNtAqkfr83dmaiK
	7yDug0ady+c9m0QKjnO5uh3co/DdeBltjZTqM0aY2yppqHKCvc+Qf9Lpnkws0JBPk2687X
	dn7f6+nzHT8ulT1tvbAJTToM1/TOdWH9l2wBaSrQHqO4zs6MS7rV9SM9ss+QuoCg0NmRxY
	L1kVWCqh6BDkq33oJ5jQVE/9CLFian5MnG7M3ezntgYWTMsft4uz56gWsVVqFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260714190400.194605-1-colin.i.king@gmail.com>
References: <20260714190400.194605-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/bridge: lontium-lt8912b: make read-only
 const array supply_names static
Message-Id: <178515352609.889997.9096824578679415845.b4-ty@b4>
Date: Mon, 27 Jul 2026 13:58:46 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 14 Jul 2026 20:03:59 +0100, Colin Ian King wrote:
> Don't populate the read-only const array supply_names on the stack
> at run time, instead make it static

Applied, thanks!

[1/1] drm/bridge: lontium-lt8912b: make read-only const array supply_names static
      commit: d767cc461fb8d1763d86a670dd9c9f1b3c4579d5

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


