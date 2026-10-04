Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85500330D25;
	Sun,  4 Oct 2026 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141437; cv=none; b=mtC2QTNTt7AcP5L8UT+KWULIrRAV3yYAOZCIEag8LtgfcnhYr3Ol+U1qN1+yKJrKGYzuCM+dKOYF7YJKOXa8/dnn1NrYKkVjvwOOSU4cjaY3nsgweVYOAOt+DZu5JfsS/ZL0ipGGRtDkKNcr/Bkk5Vppy7d3QCQdeiG8c2jgtLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141437; c=relaxed/simple;
	bh=3Ar2x8qgMH6kt24ve/xtWcLygI3njOIiKKqeY2EbVaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WxijkbOXiPjmsGn+J0ggLEbQuuzbInYyF1PdwIXm6+14ksq/uF8mK9vsDgepV3z+UzGnYLKEYQubh3j3QaATh/ooi6PqCrcA4c2WyLh+/xy4qFIOSjxb+M1N3XFStYAVFr/AlJUfssnkDRMx1wOwm5tO15MiOvJfn0s2gDI8HGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjzJgyGw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjzJgyGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144A81F000FF;
	Sun,  4 Oct 2026 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791141435;
	bh=iyBsmxhBIYjLVuF2+AEHDozSNWnMvFBobkeqCwyHVIE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KjzJgyGwTtI5vrWvdVaPjKb7TYF93Qu2dKsGKKZb5nAyvEVS/+XnQZKgo8vIdXh0q
	 8aLyh/BJ0Wp/fb49Y3RcT0FDXF7L0Xc3RTX78Q0BvKvOymqPAG05xWUpO1PMR14yEa
	 5YwYApPmE/3104pOOv4f+KFzsr/jaJiBh5ntedp2tiPuirLawlq9Z8toohgrOXtUEj
	 RfjTSvDV9KvX2M43SGfa+3jyokfycIMC7Ym6bBd0xwsFLLa2zbz8dAOEYmVn9JMGsD
	 l0lqHe9EM9eifBT91+jCeEGB9/Dx15CNBTw/awzf1RkU1bc8jdA+hDPj2Sd2EVOYRm
	 OUGhyBwFazv/g==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261002113953.1782731-1-colin.i.king@gmail.com>
References: <20261002113953.1782731-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: tas2781: Fix spelling mistake "config" ->
 "config"
Message-Id: <179113127609.150114.13801161604243660987.b4-ty@b4>
Date: Sun, 04 Oct 2026 18:27:56 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3Ar2x8qgMH6kt24ve/xtWcLygI3njOIiKKqeY2EbVaA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqwqY1TpEkaXx0Mmrcj6KdiDRSjQP18mEqPEYT4
 rU4TogIVweJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasKmNQAKCRAk1otyXVSH
 0GiRB/0RBz9fLBveTKcF4mMP7iU0446SutT6kDXR/cpxsUWG3vO6YhUpfoiUTHOakVDWcbXadqs
 U282TTYfg8jly4u0C17uiMVPw9QBuarxZlWqeTCvzW94z/S+80fkZa9S9uZ5QRS/BtxwmcwMKK3
 uorkYnxEjjqmSmECa42LWp731hF3vWqUnzW6lhRwZLpxc01/2n5xwh9jluO3bQVgY6JyLCt2ihd
 GlwJMbAKaVB9SwTGJ1SIVjq1cfNRRJDMwGeRX+6uXIHnNb80VNVI4MYJiFDM3RSeU7R/B/ELeD6
 uxH1FlUgsnPETHvCIu7PQnu5IyTpCMH4eanTrlw7CvgiZkGQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 12:39:52 +0100, Colin Ian King wrote:
> ASoC: tas2781: Fix spelling mistake "config" -> "config"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2781: Fix spelling mistake "config" -> "config"
      https://git.kernel.org/broonie/sound/c/7d6adf283a83

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

