Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550DC2EAB83;
	Fri, 21 Nov 2025 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763744262; cv=none; b=M3aimYds92GXZEviZMVslRKVj43XWdjy9H+CILG86y37gUvHiwdku4zdyFf4hGvTrDT4Fdg1NcjCiGNH44WrjjQY6nf+PCMVoB8B96xLcTtOZmxMHLnR2V0PpYl9EiCvJVeH1tL2RF3lpkupOFGu3b9FYJN22RG17PUgirbTT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763744262; c=relaxed/simple;
	bh=DlZOHkcpXcRWh+NM0JN5OLbsPjgZ+0ytXl4Ves6fA6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oRJMNN1TnB9QSHm+NUVh647BruhiFhXs9AlRSV1JlwMBBurpCLuqvyZD1fZsRAQU+7a805UUGMZuxOwk9BtH+BRV1SoAntIEuaSRt4bIxdZG/enPPUT9DJVAlSKFXx/7KdxFoED1hjUOvg48qRuDxUxnykMrvtVwxnM4t739isM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/qApolX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/qApolX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F364CC4CEF1;
	Fri, 21 Nov 2025 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763744262;
	bh=DlZOHkcpXcRWh+NM0JN5OLbsPjgZ+0ytXl4Ves6fA6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A/qApolXYeB0QxWM6ZoUcKOYn25LM0lf+AFlmF4QaHbCsILsq0n4IcvnkiB+RFflg
	 sZ7/SFLT7AtSAEf+oQ5UuKCTSn4MH+sMYxvTrPDUKY5kAIrlHrMjnzIPPq2eInHXEt
	 tcbFdUzILwZT5xVFpuX6wdiPladm3r3REFB4ApdLnj+EMHFMVO/RSfsnANKneMXogK
	 GCAKN+tkPbauUjyitg+rmIioPr/fwISmEe41B0H6I0ttWktpqOraXDWkBUoVebFwjT
	 8RT/wmVbeNxlpnO65s/AVRlUGIGGOboHwz5xqsC7NoHsd7+Sg6uVoJVuujgBMQdraW
	 VtAvbSpAcsS9w==
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aSBqnPoBrsNB1Ale@stanley.mountain>
References: <aSBqnPoBrsNB1Ale@stanley.mountain>
Subject: Re: [PATCH] regulator: pca9450: Fix error code in probe()
Message-Id: <176374426071.58658.10684772136547845874.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 16:57:40 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 21 Nov 2025 16:35:24 +0300, Dan Carpenter wrote:
> Return "PTR_ERR(pca9450->sd_vsel_gpio)" instead of "ret".  The "ret"
> variable is success at this point.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pca9450: Fix error code in probe()
      commit: 670500b41e543c5cb09eb9f7f0e4e26c5b5fdf7e

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

