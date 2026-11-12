Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505179;
	b=xZTU1NkJgiGbRBPWR74vAHnBAvzdJEFP5E7BnzXx06G30JRELDRfxyDlrd4SDjPb+NW8
	 UznNMODXeYqpfYKqvhZiIYAlV3gp8zmzSSodq+pxzzIyxCiS34UdryOcNYzpzaVIynmTY
	 5zvov+0rpHzwWsIwZIOcLj97lpC/BQ28glhm2tJ6yz8l9dOO94s0ZvMwVzD2eN6j6Ef1Q
	 iDcwpCyQER33s6ecCuiNiuxGLC9CtPbBQu/H7wYqrusixxAs3bVR/UVZsucv1qidSj9Mz
	 dZUQXPZ8mxOT4pgtG1Fb6xAFfjtmYswA0jL70IEOTVDCwENeQdTRPdcIwEIx6DNBKDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505179;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=u2jZcK7Wj9UhBcZRbPziQwkmCc362+R71+IxAnGwCHE=;
	b=Pw84k1hJsfj7KtnD/46ZekGiePpeow5hkVWRpKzsnwNHg9XWkMc099cRCoWEZL9sBOn1
	 hXovkfNvFgeNmsckG73BSvVcB3STSMPsy76QjBZIgl9nyq7BYvoWIVOkTJNqJVnvIs8lR
	 2uu1Yiggkj1NAH4pRwHGRSApHvPM6aVEhP91ezZWYBBKrazDcyCtKE16ng6IDSWc8Izbn
	 SFOcQk0yuUW95xgcyJ5dUvdoNtxsZPvz/kSvTXs+CYfPPLf/fI9dXtGU7DoRUWJfUBKBk
	 dFdgs0Qee/cOmQSry47CG9zfh3pK3ainZRSTZTTeUnRYxUCZToonUKZx4tEfPQmxWgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OIp+F1cv;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B8606A334
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Nov 2026 17:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8B8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OIp+F1cv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B3ADA1A1639;
	Thu, 12 Nov 2026 17:39:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8771D601AD;
	Thu, 12 Nov 2026 17:39:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68CF311BC0CAE;
	Thu, 12 Nov 2026 18:39:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794505171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u2jZcK7Wj9UhBcZRbPziQwkmCc362+R71+IxAnGwCHE=;
	b=OIp+F1cv2PtidDaPvQBP2de+3+8Q8B3yCZCdYxXMRGUSQUnS7ceMzjA/pEyjEQ792nA1Ur
	6mkEFUT/ixtfxD7fhpGaqrlrWGP5I4ZD7+Jd2LdCJCWvWWWXxbZxzaQ+3s6J/+aODJmMSW
	PTN5U2SmC+7OncJmY3OQflaqVByjZGUD2e8pi1HISH0YOTlbmDOWPfWLe/Q8vLxId5uLlW
	Znuo9bWwuKoQHjCEQ6oHYsL0hK+JWeVZlHRLXEBWextbGcwHYtfe4I40Dm+VnqHCj73180
	dxO3Z4exklU636ZwWLgLhOV5SEaBGU8eWD/IHlA5FLR7Rc5TpbrrGCSSuS+vmA==
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 18:39:26 +0100
Message-Id: <DMTEZOO057WM.1VQK936FVSLQV@bootlin.com>
Subject: Re: [PATCH][next] drm/bridge: tc358767:  make read-only array
 ext_div static const
Cc: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Colin Ian King" <colin.i.king@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261112162127.1592210-1-colin.i.king@gmail.com>
In-Reply-To: <20261112162127.1592210-1-colin.i.king@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 12, 2026 at 5:21 PM CET, Colin Ian King wrote:
> Don't populate the read-only array ext_div on the stack
> at run time, instead make it static const
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
