Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B625543B6C8
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110921; cv=none; b=YEiM4gjdj2ferjj5o9OXg0VHtzbc9/ve70iD7vanjcnpAnXR3zWrIRo39V1OfvIF7ZBh+cZOpOrE16jcA/rDacnpAFC/RBcxTLhv83Dwx6nsFNDpc7V21FcX7Jj0vM8LPXSKyi3zHUJxZrOflAZQMffv241Nhq9BS8y4Y/veTfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110921; c=relaxed/simple;
	bh=507ibyS8Z3GKmWQ7RpXtj6AHZPLDMJzsl3fDfFbCD7o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=i8rj2ECd0MaTb2tw1bDg9JcVd8nXvh2eSVMfEx0ypUGHhf6LraQpefo1XrueQe9MlfV1ShFtFAC+U+TtKj66JlY07R0kkvs3nxCfBJ8iGpLHdQvP1X6muiVfXS9fMbYJ5pbxRcVVGdroX60im80bl/8uE1vkWZmb6wUKOuFQmvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VoFozs/j; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VoFozs/j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2C44C2B9D5;
	Wed, 15 Jul 2026 10:22:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED1F56035C;
	Wed, 15 Jul 2026 10:21:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EACE611BD3BA2;
	Wed, 15 Jul 2026 12:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784110916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=507ibyS8Z3GKmWQ7RpXtj6AHZPLDMJzsl3fDfFbCD7o=;
	b=VoFozs/j8aKIYiqgFhmpvH3JN2l61UG+xa2lWzy+okrXr745yGOpiNc4bj5o6wFYAhW1lQ
	1ZDuIQZ/LvFRxphK1fj2XR7k2Io3TePna0kOVYuwX81sNJgvPRng1aJt9kXOj8dqQbEFzf
	K+gN6AX/jaH+K0884g5WDXkMYOZqH/x8QW0OE9wjLQHw1dnLHCxiltnQrFnCFCxHvRMosD
	oqvClaRo2h+ngBdCNI7N0ok1lPybGXblFrn4/UJFZR2UsejduPI2clf5gttPwXUX4hG7+W
	5lHPbWuiGseiylz69uwnX1pCN/84Ax6lF+bV3VE9AFZgzScb7NBEEQf3yLs2dg==
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 12:21:48 +0200
Message-Id: <DJZ2J8Q1RQ5V.1QE5NKGZC9NQF@bootlin.com>
To: "Colin Ian King" <colin.i.king@gmail.com>, "Francesco Dolcini"
 <francesco@dolcini.it>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH][next] drm/bridge: lontium-lt8912b: make read-only const
 array supply_names static
Cc: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260714190400.194605-1-colin.i.king@gmail.com>
In-Reply-To: <20260714190400.194605-1-colin.i.king@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Jul 14, 2026 at 9:03 PM CEST, Colin Ian King wrote:
> Don't populate the read-only const array supply_names on the stack
> at run time, instead make it static
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
