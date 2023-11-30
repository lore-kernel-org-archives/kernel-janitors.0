Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353CB1F61A
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Nov 2023 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGHM3KmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C120C433C8;
	Thu, 30 Nov 2023 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701336386;
	bh=Fo0Pio3QZLXVJiyMZvAR93mM+9bLzpr7O6m3p7tFXVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JGHM3KmMqmQn9ypX6vtyIaO67Rg22LUUwJduPHMI3VzXFwh9INwXPoy7oCW61HxF1
	 fCy898LsZu93EhWv5YHrIPb8CHsjnfZ7UX4aLQ9Pyr0pzL8TCB3JGNSs4+VPrOJgRg
	 wyX/zby9KDyvEkv1/sGp5GKV/dOQdeB2jRBpaaAxUF/L1nFaOzLOB1i9dBI3il2DV+
	 8N+sXjHQz44DzUEwBZzewj7Lf4nVMqXOnyPmYXo0nRPBnH/8kg+Ynbv3KMPElmThcl
	 ba2U1n61pmXsue249N3mysSWdtbkMrP5BOUDmce3SPr4wBjxgOrne0T83HjE+H8Y0N
	 5x5pvzWn2dVVg==
From: Maxime Ripard <mripard@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Binns <frank.binns@imgtec.com>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
References: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
Subject: Re: (subset) [PATCH] drm/imagination: fix off by one in
 pvr_vm_mips_init() error handling
Message-Id: <170133638383.3077649.18368811865734250360.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 10:26:23 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Thu, 30 Nov 2023 10:27:15 +0300, Dan Carpenter wrote:
> If the call to vmap() fails the "page_nr" is one element beyond the end
> of the mips_data->pt_dma_addr[] and mips_data->pt_pages[] arrays.
> 
> The way that this is traditionally written is that we clean up the
> partial loop iteration before the goto and then we can say
> while (--i >= 0).  At that point we know that all the elements thus
> far are initialized so we don't need to have NULL checks.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

