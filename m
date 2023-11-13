Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234192375E
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpBa+rX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A35C433C7;
	Mon, 13 Nov 2023 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699904439;
	bh=gzrsBuaaq7Ias+HTVjBwYIEOSVwB/9IrgcrQUdiriGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WpBa+rX06OyELpVg6hWTYXfcQyMZi9S66lVJvk0TRBPg2CKFE+4Emb61IfX4W2h1K
	 Zreo0uyfm1CrZKXal7GlHztFwz7eAXQih4xji15328MKeKcKMM5lgp3qvPm3WYLlOs
	 BI9ZKnBprFk6RrPDqboCiUSpHIq5QQENBMJUe1nEFH2kIeObPQmCnn50F1rRBEIpep
	 C6GlmAv2tALYrOpucaSFKFhwC1gPnHHc2KnTUSzEcNX2d+daLiL9cBsaY4//PNUfXi
	 LONDxbF1/7LbGde+MHazELjFZSk4fL0oIeg4SL0V/x4mrD235bJcPP+f5LfWIg43e4
	 M7/QkbeSmn9NQ==
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-omap@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231111195330.338324-1-colin.i.king@gmail.com>
References: <20231111195330.338324-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] regulator: palmas: remove redundant
 initialization of pointer pdata
Message-Id: <169990443689.3294075.9581324276633996428.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 19:40:36 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Sat, 11 Nov 2023 19:53:30 +0000, Colin Ian King wrote:
> Pointer pdata is being initialized with a value that is never read. It is
> being re-assigned later on with the return from a devm_kzalloc call.
> Remove the redundant initialization, cleans up clang scan build warning:
> 
> drivers/regulator/palmas-regulator.c:1597:36: warning: Value stored
> to 'pdata' during its initialization is never read [deadcode.DeadStores]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: palmas: remove redundant initialization of pointer pdata
      commit: 1fc2e768ff28f096e9fb6438f0d01c3851c7cd68

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

