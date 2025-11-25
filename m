Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA992DF6F8;
	Tue, 25 Nov 2025 20:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101075; cv=none; b=rbSD4lhbcHmdQjKSqPLNb/rrWgUkDL8MMBXiWVfh+BOsSWPpy68hAPI3aDeD5YbMNPJAKYYyWM5ZvYWw20BEpzVtTTRVYuNni321PhvTI9XhWOWWRV5gw3sgPsrVj1xyypo25t2+Qim31Ri0bPfGCTyHbERIQfTsNE03iJ09xe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101075; c=relaxed/simple;
	bh=s3OwkiUygWqkp2XV+p98wy7/crwoMebdN4qr+pxto0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bEQ3ReRyfucIw83/9l10YQOWee0ArgyEtr5fAXHdwC4Z5yvm6n2eYreseSMl2oyyGqCECkVK0EmAFIXpkP++MI91c0t9l9Pt8BWqT3RSV8nboPV0eSgIlQew7CRfHmVbRnoYNTQMOe7B2PYHwJsTIyfa2V6xELoBt5KgmiarjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cegwzniZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cegwzniZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D4CC116D0;
	Tue, 25 Nov 2025 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764101075;
	bh=s3OwkiUygWqkp2XV+p98wy7/crwoMebdN4qr+pxto0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cegwzniZgVpRPk6OmHNiV8BbnzVI930hoBC2ScGOULPsaGXp4l+0YY4jwc0PtHjRw
	 tQtPkHJS+gmr2eaJnerfmXSMPRgYk9J5RcA9r7SFk5y9pmZjs/B4gGUNtsCMepXRWa
	 OcvV44gGka+gA9QPq5wzgGdEvCW/OcZsshAPCZQ7evRZt0iKP+SMdk1hVFyUZFlqN/
	 5XVXr5Jx86QX0YvVgL18gnmT7d5rFtRXr8JD/ZYpi/ceUlBcczrZprnm+SCLpWZVgg
	 2Sr0hSv4VElQj1dM7y4OQZd7kxKRG7ArTkWg/L1j62FrlSXgVjcgE7F6WB26aTeqdP
	 0Kc/7plAtqbCw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aSW1UOgMCiQIaZG8@stanley.mountain>
References: <aSW1UOgMCiQIaZG8@stanley.mountain>
Subject: Re: [PATCH next] ASoC: SDCA: Fix NULL vs IS_ERR() bug in
 sdca_dev_register_functions()
Message-Id: <176410107279.92145.4201490086454262320.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 20:04:32 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Tue, 25 Nov 2025 16:55:28 +0300, Dan Carpenter wrote:
> The sdca_dev_register() function never returns NULL, it returns error
> pointers on error.  Fix the error checking to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SDCA: Fix NULL vs IS_ERR() bug in sdca_dev_register_functions()
      commit: 80339b3823bb76d383c82186b55ac836fed3f586

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

