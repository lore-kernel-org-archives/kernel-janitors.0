Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967732C954;
	Fri, 14 Nov 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137736; cv=none; b=nD5ouf0hssyd1+N4p+a5ZxhQ9xwi6ORHHJzeLnFLOOEO2pEMwAB0QT28T+4lC5e/popq55mZhj9+X6q6myXHGXQO1l5vjw22QdaNFFu/shqFSsF78bdjhsif0tBx5mZYCrmfCxUMNlzDko0HAemmVWJiyjZ+izeAG/WxYBCQmV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137736; c=relaxed/simple;
	bh=SLDIwzA9HYZFes2YBFtEOxEYLpaHeRLAdrEs6jk+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ls6QShURK4kGpG+zsS9juk0ATM7g6SfKLrRtUv2aBLJ+ypC0OtXAj0l58d5/2anpXZFX530SrjMTqg/idbzqS9Q9enw3dT0G80gGHQVcRdWWiiWWMYskRX4sF+nT5WCce+8FWGqeBqXdFcipKIOpe4DpfiVvgBd9YbYcXJHTMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goUhTe7x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goUhTe7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A89C113D0;
	Fri, 14 Nov 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763137736;
	bh=SLDIwzA9HYZFes2YBFtEOxEYLpaHeRLAdrEs6jk+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=goUhTe7xL19Mvu98KPP6DT3iGJWuwB56RCEaVyLGdKWUjkAB60dLFV0A8KqdR14sn
	 cUu29XCgPVDkqz59ysrF1eRzkJGRFLKNQWhUUMhajn34JMWKlYIM5Rst+R38r27WuQ
	 45uR+K+STcu7kF+KfAGhSgGX/Tcyb3xW6nzzd6Idq5DrSXSNffj6Y5QGLlk3WauNFP
	 vZN0k8Nvn2aq0UwD4QShUzsi4FhzacqROqkwIKBuy8hx1VploUkhuYSPnanFzg3cYU
	 zVxyW7uXSd6Dq0MYjbk8ESvY2/U+HUd5sjd5Cjq925VFm247qmX6Wo8bJDo6PG+T48
	 sZKc8FyN39FQQ==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Peter Rosin <peda@axentia.se>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, asahi@lists.linux.dev, 
 patches@opensource.cirrus.com, Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20251114113713.231513-1-lukas.bulwahn@redhat.com>
References: <20251114113713.231513-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: refer to trivial-codec.yaml in relevant
 sections
Message-Id: <176313773331.173018.5617582229167638951.b4-ty@kernel.org>
Date: Fri, 14 Nov 2025 16:28:53 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 14 Nov 2025 12:37:12 +0100, Lukas Bulwahn wrote:
> Commit 4acbfcf11cbe ("ASoC: dt-bindings: consolidate simple audio codec to
> trivial-codec.yaml") aggregates a few sound device-tree bindings, i.e., txt
> and yaml files, into a common trivial-codec.yaml, but misses to adjust the
> references in ANALOG DEVICES INC ASOC CODEC DRIVERS, ARM/APPLE MACHINE
> SOUND DRIVERS, NXP TFA9879 DRIVER and WOLFSON MICROELECTRONICS DRIVERS,
> which refer to files removed by the commit above.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: refer to trivial-codec.yaml in relevant sections
      commit: 6402ddf3027d8975f135cf2b2014d6bbeb2d3436

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

