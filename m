Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7B3DAAA6;
	Wed,  5 Aug 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925422; cv=none; b=OJ9u6LZOrxBDaGWnmP47XbDVqYAC9a/rme3bKM17hfh1JkUcfbszwVnkepBDgZ79y7TkBXM4m2E5TDJK09sKnVsmdjsfM319Loqqlv00x6x6095a8e5Mtvmp8ORT5lnYbuOkLnWIXvsl8tIGPwNdpSuuOiLvohyKvgnAnBZU1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925422; c=relaxed/simple;
	bh=d+6t34ZTncpH31KtRJcj0eq81Ll26mjzFlGAOyY5dtg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ONamqoxnBz+6IeybLUhIcqBdEHOG+N6+n5aEbxJRtvQQ/k+5Qd/vF+UonUmCvL+ABna4ToSr2w4VAjKh4/u8La16pXfTgYOY4b7r0ByiaFU3tv9AnKysgQ7Mt69Nbe/Iky9b4VuiEkrvXI+HJx+0r3oHNQXE04qvH++wIWd+Zhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMxI7OpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMxI7OpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20111F000E9;
	Wed,  5 Aug 2026 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925421;
	bh=R+ZFMtIuzPeZEUZ4JcJ/ougwoDdYyFPiQkSgNBVZWTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IMxI7OpRaYKQcW8F9CveMDT4Br8+u87MkcCVjSR7dx8X1S7ivELRnB414XKeONRHu
	 ZFoecaUeX1Q/jG6r4S8RDu380rhaYoIMFwEDlbMjbbR8Tvaa1V6GMdYGMcMt/xlWKb
	 7IHTKMGPnH4PsjVKTFH/+nI7K364noXytsaybOLQjgSEruw3rZ2oAoLls2j/E4dHug
	 1bKEZaR2Z4KhQ125U0C98YoUFbAENyZ7wgFEYn2/yWfpDSuxJWHaukCLEFCjSW+tqG
	 +5dVaAnBuzgILxT5ghtwYqZpe3ZScAtsqnYlwCmeqpftamstA/g5yONJ43zvEH2knx
	 BkbL9M+mE9ZJQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260801191002.1383835-11-Julia.Lawall@inria.fr>
References: <20260801191002.1383835-11-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] ASoC: wm8940: drop unneeded semicolon
Message-Id: <178587630281.111355.10169472897616343402.b4-ty@b4>
Date: Tue, 04 Aug 2026 21:45:02 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Sat, 01 Aug 2026 21:09:57 +0200, Julia Lawall wrote:
> ASoC: wm8940: drop unneeded semicolon

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: wm8940: drop unneeded semicolon
      https://git.kernel.org/broonie/sound/c/222e8029a7b0

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

