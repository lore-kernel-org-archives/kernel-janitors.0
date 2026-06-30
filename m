Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3691466B4B;
	Tue, 30 Jun 2026 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834522; cv=none; b=juPGCUYb5imVmGfjjfiDp4iYCqOhsbcumbAYgUBR7FtCeFnQnWyqo2mNkXAFAy0Ee4YQIKZYtydkfQeUTs8O5Fm6ZUkVAQN/7FJhAN1o0JsNKvYTLqEu3gScc7xPvt/CRnOFZaqZxtHHw+qBKFhYxcwiJYkU8XYCIsDJ8JvZi6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834522; c=relaxed/simple;
	bh=fh0S+5HIm6QAzNddX66SiBe3JHMlziogdxVeM4WacwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pfE+ODFR9EXUO8p5SSqfwfFfwmNYV+b04uzXrq8mRjuthLIxBJu/ydP6E8vtY0dwt2DWQnbhWjc/GupqOKOpp7UuI1LKO2GoIhzkVLAp6EaQlfZTE5VxcegZuyzyDtstbmdQ1ya/YX9Nyx3fmPLXqF/oC0FucHSsk1tIqWGkiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onZb+o/o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onZb+o/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD891F000E9;
	Tue, 30 Jun 2026 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834521;
	bh=iEJym0K7bxvF3FsFTl+WhoRQb6KKr+Ln9LXxZRcLKio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=onZb+o/oRsOkg3JHmL2Kvw0SgLXpJZlXA9ZDPxQK27MsLQO1RxGyo1hChB5zL92C2
	 Qav9dEj4g/PAyhBW6Nd0rd0Mvc2uvSq2XxONUkU/peiyQCHiSr9G236A3vySjM1/Pr
	 kHCn7Cso/UyCjyHeU+Lyb1dgfI91JOc5McX+O6tVhpt1kdY05AjZSKJfIcygVauBnP
	 voNyTof6bGMNfPwyszHl81J6y9zGvr4Jj4EOUUN+bSBHrK214bFckpIgkehD9Y3pZy
	 HfO9gx3COY9azI3X19xPzns6WiEJdi9UboRdASkTjzS67P8dE2Oi5Ft9PJrBHQUYp7
	 okj376kRhab/w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <40b93192-68d2-4de1-845b-9c9ba994a75b@web.de>
References: <40b93192-68d2-4de1-845b-9c9ba994a75b@web.de>
Subject: Re: [PATCH] ASoC: SOF: topology: Use more common error handling
 code in sof_link_load()
Message-Id: <178281882519.79320.1939247511595511190.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:27:05 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fh0S+5HIm6QAzNddX66SiBe3JHMlziogdxVeM4WacwE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+VWxBl3xZ31BrVz8p2Vqh1Hf6S1N3K9/CPd8
 lfQKtwhg0aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlVgAKCRAk1otyXVSH
 0FBzB/9ANMMkl1LMmG6KPF796bwaYwi97VC/pDMJGFgXWT9eiu6q2Dw9vTabNJZj0ofqfP27dtO
 r/6P5bZLqqJ/DbHkI8M+grEiSD4D4HdsJzuPouHyGYpjb7EZAQjh/oTJufUBbkm840OULkrgT+M
 ijqj9vqsBfhL7bV9QrHDvFoUa+a8xVB8LhmqATDiYvpI9vUA/p5MF7nGgHs0UQtBWMx7Y2AgFHb
 +l5hnHkuMiEMbFm+TOEt1qYLPxxqf2o8t8gXOS7IMmNgfghqCbbvDOv+li7T0xqtEr4MahDJauM
 FPAY4ABjMxt0+UCsInj2+ucOdgyP0t/wpuk/yJPTkm+6ZEL/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 17 Jun 2026 09:56:22 +0200, Markus Elfring wrote:
> ASoC: SOF: topology: Use more common error handling code in sof_link_load()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: topology: Use more common error handling code in sof_link_load()
      https://git.kernel.org/broonie/sound/c/a33e6fa400d1

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

