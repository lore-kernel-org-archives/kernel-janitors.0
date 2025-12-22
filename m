Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621E842AA6;
	Mon, 22 Dec 2025 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766425848; cv=none; b=Mml8YmCBdXtGoKcRxFgGg/fnFnyN3wzuf7FeOT7LH5T/vo7PXrzvj80nZiU3ERy3OnLkfH7qIO76j2QX+SqzYiZLdJE5DjIRomtIlQcs4r9wwt7/2qT6b06mZz0W+ciWAieBKTCqKBwJcpn1xLSkwWvhgY3A4zjxHkoknsklI4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766425848; c=relaxed/simple;
	bh=FudripN3n0n2bcxwD8M0wD5RpVbdzTfY/otGyjQY0/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ry1132ykJTrNuFHRpJkZrBfk18kbhMZ/xaCzoz0Sf7flzFc04H1GwAYPFMhrplVLz2WuLowRrrHt6k9BwgV6EM8ALdr7fryiJQqFKJ+QAWmtPszvx8EjmJZf4e4qASw9x8xKfnkEw1axC15C4VSCrasmg3UHtymHk0JKsqkPsZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8oDGZK+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8oDGZK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BC6C116D0;
	Mon, 22 Dec 2025 17:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766425848;
	bh=FudripN3n0n2bcxwD8M0wD5RpVbdzTfY/otGyjQY0/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D8oDGZK+8AgONTGfHKjFALDGI1LiA9TiA5BGlMJWdbxTs/jdsIcf4edPS8oRclnz/
	 ZjdvfhLxWW9wSpgl6PCuaqclILaYyvHD/Wi110e4DPOnRT7Fol7BnIgWwnl35m7f89
	 gRnXL5U8OE45c0ChkCgdFB9aEWHstKE9Mz8fJnm6aFGvzJ+qGAd79+hMocA4seoP6W
	 i0Rfsi6RgUP3/BUKAdbHSEDF5y6WubOjmK+HeS/UO5xEU3pzZZ87jZT+RGPkRWVppw
	 w/5tZ+ENrG2mNqSRdL6ccIwsw4SAE/r/CgtRnAb/OcgcbtXIpM5AGXHjgrUWnoYz+Z
	 pA6euCiQldwrw==
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aUZiNJ7pzuahXFYE@stanley.mountain>
References: <aUZiNJ7pzuahXFYE@stanley.mountain>
Subject: Re: [PATCH next] ASoC: rt1320: Fix retry checking in
 rt1320_rae_load()
Message-Id: <176642584614.925274.13974919096126577279.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 17:50:46 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 20 Dec 2025 11:45:40 +0300, Dan Carpenter wrote:
> This loop iterates 200 times and then gives up.  The problem is that
> currently the loop exits with "retry" set to -1 on the failure path but
> the check for failure expects it to be 0.  Change from a post-op to a
> pre-op so that it exits with "retry" set to 0.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: Fix retry checking in rt1320_rae_load()
      commit: c6bca73d699cfe00d3419566fdb2a45e112f44b0

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

