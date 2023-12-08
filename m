Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE46D1B
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGGib1la"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32B3C433C7;
	Fri,  8 Dec 2023 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702028184;
	bh=2CP+g0JFWDQiXDkdMQf10ayFgPRTjEJo99EqpGJ8aOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qGGib1lagyidxAtZKdJT5zotbna+a0mat76lxP/Bh9bceaO81OJbA93b9DXkUgsXh
	 lk8R7EENn2x8Ue3sBwDwUEE48g2azhiJMI5REeDUYOzcdCEPyl62naOz/J6o7MT8yi
	 c3Dgvi1M6cB6DJOPl8DMWZ1Fk/HJshGl4vqfGCx6L1lrISTT/BvCr+pBpdLii2AWAK
	 ObS+PJiKulS5b+nxAfXqJpScGIE169Bh0OhExwdgev1q1fCxWlD3BMgi0yVeN6oDhB
	 0y5E1Kozo1vXkaTmOzk6JjJkYtFhVIJUM1d4GFRYy1oXz2J3mIL92tapptGYB8noSY
	 UA49V64VxheHA==
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
References: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
Subject: Re: (subset) [PATCH] drm/imagination: Move dereference after NULL
 check in pvr_mmu_backing_page_init()
Message-Id: <170202818166.16687.13249105887832691264.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:36:21 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Wed, 06 Dec 2023 17:37:24 +0300, Dan Carpenter wrote:
> This code dereferences "page->pvr_dev" and then checked for NULL on the
> next line.  Re-order it to avoid a potential NULL pointer dereference.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

