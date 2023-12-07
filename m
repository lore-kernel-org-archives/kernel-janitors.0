Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D264E1D9;
	Thu,  7 Dec 2023 18:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olqtFFoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E55C433C7;
	Thu,  7 Dec 2023 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701973505;
	bh=yMiS9Pe6kPLbOYqn7iFPTCZx0Q1lRHoFloVf9IN9Jg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=olqtFFoT+ryYEmbaNUq8qybt/oVXgscQwzGWvY4Kh91GTZTd5i/AfPMpivNbRnelC
	 f6+Xkol1pnMHUM0yIfcBRbTXNd8afSt7ioT/8zZ747++Lx6zkbUkBgcQLCyRN3H6Sp
	 m9Ujm/9JAaQGn3VbAj2NicOJCJSWmqcDmeJnNNVpLd0fsFYMORDH6PX85HggRjNJJS
	 HSEugu6GeAo0/L55hCVOI+6V97zQj8PbWBculUrgsnwG4EAa2upk5ZC/ekB7vqD/7c
	 EXWu//OjctE9a4jzi6nQK8N7qgDOVeI4I9GPd/H3pCxGuhJ3vUxMFi5hMZ0v8cW2TL
	 +k4jjR1CqzBkw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <1032216f-902f-48f9-aa49-9d5ece8e87f2@moroto.mountain>
References: <1032216f-902f-48f9-aa49-9d5ece8e87f2@moroto.mountain>
Subject: Re: [PATCH] ASoC: audio-graph-card2: fix off by one in
 graph_parse_node_multi_nm()
Message-Id: <170197350337.327814.15048120756650243468.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 18:25:03 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 15:42:07 +0300, Dan Carpenter wrote:
> The > comparison should be >= to avoid writing one element beyond the end
> of the dai_link->ch_maps[] array.  The dai_link->ch_maps[] array is
> allocated in graph_parse_node_multi() and it has "nm_max" elements.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card2: fix off by one in graph_parse_node_multi_nm()
      commit: d685aea5e0a89b66679e5266320ab2ba4378c754

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

