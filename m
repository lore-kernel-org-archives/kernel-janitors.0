Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68E3A8DE;
	Mon, 27 Nov 2023 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XF/sdnis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7EEC433C8;
	Mon, 27 Nov 2023 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106382;
	bh=alHx18ub8WTEqASpWQ5inqB+lbZ40Y9nPQczGy8nvOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XF/sdnisZg5P3UdX9lpfV8/unxqPZQmM/dCGAeIDzbVSZaGt4AVio7waFnEI04Trv
	 D0Ud60uSK2DvLDNRs1XzgQ1ZohG7BhA7JFTmUHbQlcDn7qgrXL+b28CWvqFYX8wsgi
	 5JOa/NkIo2rmk59YxfwX0VOzi1bOw0oZAzN4rq4sUqsEuaDBjUpSeTUfyP+HwkWXFD
	 p+BFx+EYdcuhehek2dqrWL/wXE92yj+nQdMxf1BBuHOGbr8BsmoIyo+P1O5iNaF5Nt
	 ALrpJfB0+RZujK1i9upWojc4lPe+ITYNU5BR59GmYnLDr35TlklihCiUuQEhgajDE+
	 BO8RJCUDlQ1TQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <1a837f96f056fa3dcb02a77afa5892d40b354cb1.1700417934.git.christophe.jaillet@wanadoo.fr>
References: <1a837f96f056fa3dcb02a77afa5892d40b354cb1.1700417934.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: sh: convert not to use
 dma_request_slave_channel()
Message-Id: <170110637716.2700573.7780212475414653746.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 17:32:57 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Sun, 19 Nov 2023 19:19:14 +0100, Christophe JAILLET wrote:
> dma_request_slave_channel() is deprecated. dma_request_chan() should
> be used directly instead.
> 
> Switch to the preferred function and update the error handling accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: convert not to use dma_request_slave_channel()
      commit: 076357cd57c294fb185ac452b9ce5536b2853839

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

