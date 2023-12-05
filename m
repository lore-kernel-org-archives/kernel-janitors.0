Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4355B1E2
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Dec 2023 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQvVSKLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1779DC433C9;
	Tue,  5 Dec 2023 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701784110;
	bh=jn888q/UcAkBrUFljQzymmIT9/ky6nNuCImiG8NUxw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GQvVSKLjKBczB0uOh0OW9Ho7OYyhpyloy3cVfG8zhaolDFmLX7LptpKD1mG7K6jl9
	 i2V1rzh5xoX+kaFCN+OxTWpir/A74TGXRBxW2e3sEOYh2h0zScP4CUJqtEOUkIzUq5
	 2HyxmDb1BZj2HOsNmh59Uv506WC0rS2QuSVWtdn3g2UUZqr4zNVSaSV6PLQV/OXVOd
	 Y06UqvN4UTjlFumukuqOt/irhEWxu6+AqSQEOl01ifo1oaPWmbj8Z/43jV9NUxzmTh
	 SNskKpdNHuk3Lpkv45hVE413iKmakzcVKQFL+NrmhK9slFaxxe7Z6FEd+oHnuzw/0u
	 T8htWUK03Qgfg==
From: Robert Foss <rfoss@kernel.org>
To: Sean Paul <seanpaul@chromium.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Inki Dae <inki.dae@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel-janitors@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
Message-Id: <170178410677.683894.16036596185582079991.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 14:48:26 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1

On Mon, 4 Dec 2023 15:29:00 +0300, Dan Carpenter wrote:
> The i2c_master_send/recv() functions return negative error codes or the
> number of bytes that were able to be sent/received.  This code has
> two problems.  1)  Instead of checking if all the bytes were sent or
> received, it checks that at least one byte was sent or received.
> 2) If there was a partial send/receive then we should return a negative
> error code but this code returns success.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=914437992876



Rob

