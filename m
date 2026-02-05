Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5AF31B10D;
	Thu,  5 Feb 2026 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312521; cv=none; b=deV/Fe4Kd4dZXUCpIn1dPC+mQr69S/sllOe+ZNZtSk3wgV+WlZAq/VFuoJCzaXLp75XRQaEwJ9VmZD7u2eX0Qg5cMftpZjWAE/vT0svN0LdN2fJWmCQagnI6X397vDBuBVb1VNn88oJ8lm1+9nyApc1dOWQ8QTTk6IC1QAZ6gx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312521; c=relaxed/simple;
	bh=1US4AEkxgJLekWaZD9MCfcTX7fP8TVAB/Nj49TVNjPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QQYWQK7iGePLk81b1VD00ua80Xwx6S7GoSH1iwtHg7wa3RAbX93O/7SIjoaKuM0UU3rl+yGFJeknJ7JewiiuZnl/3aEaovYcL4JtePtR6ThG3yhDORu2KQQ65sDhjOX/vSsKS+5ZleN9vFvu+OQ8MG6Tdb3ceC6Z/wTC5gk/i9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJLx9T57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJLx9T57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050B2C4CEF7;
	Thu,  5 Feb 2026 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770312520;
	bh=1US4AEkxgJLekWaZD9MCfcTX7fP8TVAB/Nj49TVNjPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nJLx9T572Jg3PRXJbtwyTFk+/XhuubO5OjsVDTO8MY/8PopAuaUa8SN4NARduDdzd
	 c9iUgJUHTPNAS0uSHmcF8PDH7GJt0FGsG3L25XFIMLuU41W61O86JCBO0ygL6PaZ/Z
	 uT5yXymXEluPPChESkfa1cnNHVj/EcGKihgMCfkptiaoGQvcS6XjccxFDxwY1jf3HL
	 4oAibM0HKyrFbbVr7Pf7EbXKCzHhwlmifTwtOYPXoaqmZtH0/b15o3A1DAwu1jSRhB
	 BrfQrf/HnrdcQ4AOf3QIGJYjfqBm3Q/7TP/WCUOsnHXu3iuPbdgnKU0rZfcc1N6gDO
	 k8ZuA8ILl+Dbg==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Herve Codina <herve.codina@bootlin.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Pascal Huerst <pascal.huerst@gmail.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
 error27@gmail.com
In-Reply-To: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
References: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] ASoC: cs4271: Fix resource leak in cs4271_soc_resume()
Message-Id: <177031251773.127114.745142802569517839.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 17:28:37 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 10 Jan 2026 11:53:36 -0800, Harshit Mogalapalli wrote:
> Smatch detects this resource leak:
> 
> sound/soc/codecs/cs4271.c:548 cs4271_soc_resume() warn:
>  'cs4271->clk' from clk_prepare_enable() not released on lines: 540,546.
> 
> Instead of direct returns, unprepare the clock and disable regulators on
> the error paths.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs4271: Fix resource leak in cs4271_soc_resume()
      commit: fef1f756155c30511397bbcd9d55640ab2e44d99

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

