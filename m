Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519F33F8B7;
	Wed, 26 Nov 2025 19:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184365; cv=none; b=cqRRR+dZHHwWHMrs7JjOT//3+bLckbkhu5dnIgcvVBwQ3yasBFXgMutzzpBF4o6ETPyt8/PEeeE+/BwJlUkXFpv5OpVAN7gJW/CIlNkijjWgaEtqS/xsJswiHqG5VpQ8h6u5jOpXrfIUgGtCqLWzEuQPZqf1w0HHxevMvtBe8x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184365; c=relaxed/simple;
	bh=sWWXp3sv6vfsWvCEZUjz8CmJ0VK8ViosU6u8p8WK57w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l8yCwXf89V9FJZgpmc3G6y8pokdtft8LhX7yOLtqA/+cKIrpt8HeR7WEsG8yK3/JppA0QwbibUq2ZIGyr9WcECrn2YHDi8am2JJ6viggYkRGMGkO0YuRUVM6LB7kzSDtllcEJ5RndU/F3xXgRrk+FRatqI7TWJ9xl+9s+BklQfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ju2pT6Az; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju2pT6Az"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9736C4CEF8;
	Wed, 26 Nov 2025 19:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764184365;
	bh=sWWXp3sv6vfsWvCEZUjz8CmJ0VK8ViosU6u8p8WK57w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ju2pT6Azp7yo6k1D5f0cG+rlRn5zuLUrevCfMZNmQuf+hzPNgPcMbQwwKwNSgiwc5
	 UaBtW2k2+qFOkRTCxJImD00d+gDOQDBLj4pS67mxN9hNnQ2/Er1zx+dwhJfVJejMtY
	 Q0qODMulspHUVxNjpAYZi2Dc0s91nKUxFPHO5lXbJyAyDcdty9L395tp6j6okow+Qc
	 DBD4ox4lV9U+BMwC4nNIpuwU8Fnnap7QuG7mWXrJj2wdjYb1c8Nunlo2PcmKunIwaH
	 jtUJVfMWIX2oqJhnYkipmt4PWd+BY5h4dFRWml/jEe/OtjlvWzqXd4BxYKCImlvJZd
	 Zrq37EJ3X5RTA==
From: Mark Brown <broonie@kernel.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aScUKqCEhSIZoOmg@stanley.mountain>
References: <aScUKqCEhSIZoOmg@stanley.mountain>
Subject: Re: [PATCH] ASoC: mediatek: mt8189: remove unnecessary NULL check
Message-Id: <176418436269.117076.14309249489407966858.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 19:12:42 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 26 Nov 2025 17:52:26 +0300, Dan Carpenter wrote:
> Smatch complains that the call to snd_soc_component_get_drvdata(component)
> will dereference "component" so this NULL check is too late.  The probe()
> function will never be called with a NULL component pointer so just
> delete the check.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8189: remove unnecessary NULL check
      commit: 9d3fcd0ebe91c2079b4aeaffc7493a0bb2ad45f2

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

