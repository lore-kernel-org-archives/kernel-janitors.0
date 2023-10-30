Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F387415E96
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b90S/syr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC11C433C7;
	Mon, 30 Oct 2023 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698678168;
	bh=HZ3Ha4rMhluR/cnIvD4+pZKPzbOWuqqbVllRMsRZcNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b90S/syrmiFfKANW1rMs6SDRfIVVQqjZZxL7UiiJksBYlm9MTD8zenrtE70wqr0BD
	 LhZoBkxLKim2fybQa9nrVdd5MdYlV2aLs7RkJJ5dpNuwayc7Cl7taCAnM7jNRMqG65
	 FGYfgLunpPsD9xmP8jsRumpV5xXBP3Dw5SwwgHSdVzMqntVNXtvGjrq5ZaxqNiDDaf
	 hAVeFtM+dTqqdhSSHHSkab/Aqzn5PIsqFxwZluHqGFLRsdboDRAiQTXmUmYK8oDzna
	 O8rTWHvU521mPhLxfZwtqqrHiyIYw9+vsEtpHPB6v3OxJ3IHq8AgmRt0issMqOaNQS
	 aUBksnbFS2nMw==
Date: Mon, 30 Oct 2023 09:02:45 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2] nvme-tcp: Fix a memory leak
Message-ID: <ZT_Flc9XuDdB9clo@kbusch-mbp.dhcp.thefacebook.com>
References: <7f132cc47e627d63ddb084f3d0fcad10956d1e35.1698677322.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f132cc47e627d63ddb084f3d0fcad10956d1e35.1698677322.git.christophe.jaillet@wanadoo.fr>

On Mon, Oct 30, 2023 at 03:49:28PM +0100, Christophe JAILLET wrote:
> All error handling path end to the error handling path, except this one.
> Go to the error handling branch as well here, otherwise 'icreq' and
> 'icresp' will leak.
> 
> Fixes: 2837966ab2a8 ("nvme-tcp: control message handling for recvmsg()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks, applied to nvme-6.7.
