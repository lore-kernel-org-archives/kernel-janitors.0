Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007E9182C3
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Dec 2023 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2d41aRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50267C433C8;
	Wed,  6 Dec 2023 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701877763;
	bh=+J1QdopcvWpX9zfxJIE8u/JzSE7fFRVzBYM2a7CKdXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2d41aRpP78BtGO5A+ZqppqUNq24L9RxjSDmHvlgFX2vgeXyTyAZHVXUESWvLQiGj
	 7NyrI9V4FwSH2s14/MJWFedHMoU8y8K+2UZB3v6aRlgMcwfRlvtzd0cY3UkU9J4Fzj
	 uCES3fjJnxyMNRLgFXZG78O42SFZXr2MK49uzZrLlbxd0XxRbLu/ZFIuN5QhAWqP8I
	 3j+JmeZddkPH4Yp1VMn6eRvw+7hZa0AiB9HqEEXD3z3sguH1jPKaVH1GWkRMSszpMV
	 zWStW2xd8YsZtKHuQIzE3SaoN2PrUzDX3pnXVmFtEZdSUhBVYp3mzoqvgHaB7FbFoU
	 AKkwkO5aIka0w==
From: Robert Foss <rfoss@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	kernel-janitors@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: simplify some error checking
Date: Wed,  6 Dec 2023 16:49:16 +0100
Message-ID: <170187770273.918857.2541227849014994026.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <04242630-42d8-4920-8c67-24ac9db6b3c9@moroto.mountain>
References: <04242630-42d8-4920-8c67-24ac9db6b3c9@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 6 Dec 2023 18:05:15 +0300, Dan Carpenter wrote:
> The i2c_master_send/recv() functions return negative error codes or
> they return "len" on success.  So the error handling here can be written
> as just normal checks for "if (ret < 0) return ret;".  No need to
> complicate things.
> 
> Btw, in this code the "len" parameter can never be zero, but even if
> it were, then I feel like this would still be the best way to write it.
> 
> [...]

Added suggested by tag, to reflect Neils feedback.

Applied, thanks!

[1/1] drm/bridge: nxp-ptn3460: simplify some error checking
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=28d3d0696688



Rob

