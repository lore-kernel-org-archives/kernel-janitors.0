Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E36134C3
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Nov 2023 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8wRZOhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F31FC433C7;
	Thu, 30 Nov 2023 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701335928;
	bh=2DEa1oTeYKzcAD8G7sQTs3Ut9U8iyHfVccBu5egHOjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o8wRZOhEkeRvlklnE4tOYqWrtRs3q162YaAbPlJInXH/gblUtFqSU9ZX4j9Pw5LxC
	 r4WdQ8NrZrpFTrypDvOoMHiaaxmbte2641LIsXqylz5noP7Cw7azIWhAOSq+ae49dy
	 Lj4PSYlotWGs5klPsoL3LWQJOkDXU90iap26FZiImBB5m2PsF7OM10WrtbBflOPjIV
	 Z7LGjjNVJlnWmFrbcjSSHmg0xJOS0hhpfwXPz5oq3plcgySXhk2ytwkID3vtbhc8dp
	 JLceUBMAkcgOuT7pnsND6OgXAtxSqrossnpU5qq4v6Ap5AP1AnBR/7CeFxK3QTiIgH
	 GbtYIh5g/0xVg==
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
In-Reply-To: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
References: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
Subject: Re: (subset) [PATCH 1/2] drm/imagination: Fix error codes in
 pvr_device_clk_init()
Message-Id: <170133592547.3076107.13433304764452948026.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 10:18:45 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Thu, 30 Nov 2023 10:26:29 +0300, Dan Carpenter wrote:
> There is a cut and paste error so this code returns the wrong variable.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

