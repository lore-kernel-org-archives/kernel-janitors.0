Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F345220B0D
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="je2fBLML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D12C433C7;
	Mon, 13 Nov 2023 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884323;
	bh=/NaN3JhhTLKf35ns0Tx2hua/FjlGBaju/kmmbE88Qng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=je2fBLML9l0iiFDcvV13EtSB+5+EZpaOZSLolhDMyUZh8bDtB0mwJfe7UJkuvhoMD
	 vQfTAGA/lSjEnS2PWclJw3NnJs8hLztfI1+luETZe3bQlwspOBQ+ft9jFE26DG+n3Q
	 3VByj8qpDKlclWwMqjvwjd+92h4atrG729+d7NpJ9bDC52WuQxQZOy8tmaZ/i/t5CN
	 tyDPyEIbA6bzrv8fLS9fIYtEYe3Wy458jK3eQTGEREIk7UQXvMpiyyEtFhY/tlJUXg
	 IAtDR2IJ60b9doxF6UswlanSTjOyNEeBo2vHneOQBQSnxj+Xh7YhCtpsLSI0p1/tkO
	 X6yVM0uoZ4q7g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Yang Li <yang.lee@linux.alibaba.com>, linux-sound@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <e376a712-e0c6-446f-9e0b-c444dd795cbb@moroto.mountain>
References: <e376a712-e0c6-446f-9e0b-c444dd795cbb@moroto.mountain>
Subject: Re: [PATCH] ASoC: amd: acp: remove unnecessary NULL check
Message-Id: <169988432049.3280890.18390269348281971784.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:20 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Mon, 30 Oct 2023 12:03:51 +0300, Dan Carpenter wrote:
> The list iterator in a list_for_each_entry() loop can never be NULL.
> Remove the check and pull the code in a tab.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: remove unnecessary NULL check
      commit: 601cc04c9d73ed728b29eaddb29ae13b48b03ce7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

