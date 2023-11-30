Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76FA134C3
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Nov 2023 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oT/IMeHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01383C433C7;
	Thu, 30 Nov 2023 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701335931;
	bh=nT9nGRfMfU4zgEHa6fXZDXZZdiT3bkcMygf58AsjxvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oT/IMeHMhtHPp9SwiakrtnQOomaEbeQQ3MX+Z0Sn3gUXDHeHrtiLnSG05innsBON0
	 363PAMnvstx3bi1dB/K428ltGi+X4HJDHPWZ2U8bPNz1NpU/oPhyS7xlcS2eVCiR7w
	 0IQfMIvRxEXO3tLgM6McOwxcOG9p3UL0gMHmAmq+f39el5JimFxEgunEkftfkrtWIq
	 ghdz5FAwkmw9XUSPCuguHbXn04F/fHy1cjDeYjcvVof3wZ+ABgVqpJQau1xJFG4G1z
	 QHhd5pH3d6vzWwl6p7r1cFWG/T42/PYOciAtLMXkL9fj7LzilePHbLXlNdJwAZZkYL
	 b4A/R6UBi7lOg==
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
In-Reply-To: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
References: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
Subject: Re: (subset) [PATCH 2/2] drm/imagination: Fix IS_ERR() vs NULL bug
 in pvr_request_firmware()
Message-Id: <170133592874.3076107.12823287713812257230.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 10:18:48 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Thu, 30 Nov 2023 10:27:01 +0300, Dan Carpenter wrote:
> The pvr_build_firmware_filename() function returns NULL on error.  It
> doesn't return error pointers.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

