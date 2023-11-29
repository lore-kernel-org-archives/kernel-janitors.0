Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69FE13ADC;
	Wed, 29 Nov 2023 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSNOqpD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C33FC433C9;
	Wed, 29 Nov 2023 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701283984;
	bh=+VD6UkfC+iyI0rWTVDs/Yc0qsEfofTjJTPu75VnwKEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gSNOqpD41Bn6l1qlcftUsRAsAHI080qqo8imWX7vdQMoItgb2h0kq5LgXBN51hr9Q
	 oLtwSPXoPuTN2euP4eLtQoDRPn93Vgjbsqaw81IegJbC3HJWcZOQyJuwKkkHV3PN0h
	 AeCjsBA09oh91XBwcHXBrpJVTIEeyoIQ6reKOA5z+3o5dBqKF9cRP9p0Azu0CQh24A
	 bQO7uDjv3t197dENpiD5s3q4fEQHvQKtDKyob3YOUsqHl5Ew2O7vkMlu2TQj8rQNwA
	 zEGj5OvFXQ/xISNDwK7jcyTc7liYIbGAqfYyN9AaLSkHYdVL3XSnOG+5N3pU7SSaFV
	 gNATZovnJE6JQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231129090958.815775-1-colin.i.king@gmail.com>
References: <20231129090958.815775-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: core: Fix a handful of spelling mistakes.
Message-Id: <170128398283.290371.17199524750105077840.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 18:53:02 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 29 Nov 2023 09:09:58 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message and several
> spelling mistakes in comments. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: Fix a handful of spelling mistakes.
      commit: e9a92dfc8d4fde6f7adb978fb13d0b0834567cc5

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

