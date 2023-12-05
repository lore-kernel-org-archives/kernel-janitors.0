Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60AC5F1CA;
	Tue,  5 Dec 2023 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gk4Blx2p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24464C433C7;
	Tue,  5 Dec 2023 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701790876;
	bh=vjrlfMihEwbG4vZyrXSqd2uLeidXw1bqUTeh6X6XMdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gk4Blx2pzponzHlpb6XMYi385hWWRglOstEEcWEC7P5Vy9bkm+E0bb8MbxMv7EkgY
	 UvZW7nRXYh7/ELJlu5aFBKhXv8HQ8lad7Rh/YHSCUGEb5lnAZpa7lePSvlLSy0Nts7
	 M6v6ONHiwr5ZK86lP+oAr4mfBMZAJxBHGmBVfWyHd3JMj7/9PizhkvPKCTuSOmFYCh
	 h04zydOhe7OAfpbG4sO57yml8m6wuK60lkzht9dZr414oSArn3IGoMfWN0HsR6FUDO
	 hGpKXGk5qOCycNn0dXTC69W0fnXtk6bLtDG7/AuaEKuTgLg9x9bmpIrvDN7ilZe9CC
	 0gy/oaJy+2LIQ==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231205101740.2820813-1-colin.i.king@gmail.com>
References: <20231205101740.2820813-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: cs4271: Fix spelling mistake "retrieveing"
 -> "retrieving"
Message-Id: <170179087386.845405.2039286765455444557.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 15:41:13 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Tue, 05 Dec 2023 10:17:40 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe error message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs4271: Fix spelling mistake "retrieveing" -> "retrieving"
      commit: 0be9595d8a1170474867b8ee2caf14394db45d8b

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

