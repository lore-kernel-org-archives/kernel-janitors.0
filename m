Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177142;
	b=SjcF0tdETu9MnXDq6kcLmZ3VskCMFOFS0tFPyFYZ+7FPZOC0K1ptenDY4sFFeQ3JZfWv
	 IKN+2c4zcsh8QbZAzN43yy8ORGBIdZxt1ohlIOfxsF4kvblU8+NK4c5u07fjQdj3UcYnU
	 5shjtAVuvLnHPz79vLKL+FhYdhUL8veUqt1lBr5hUUDk5EOuJbrdO4KUNzladWJvr8V8c
	 XURUFqwE2AM6eY6tLCc67CT4poDNnrIbIYN+hlPcebBfgGVA+w60ekQQDvWNki1i/iQ8l
	 scifQVPTxVfavxWIbF1in9SvEQlVxokTIVWxUlTS8AypyBxIRaBGmw9o04/GI14sM6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177142;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pfIaaogQQ3/aizXTxNoLej+Z34965WnxG3DwE7wiv9w=;
	b=NTOkDjQGQ3wm+1wwzPc/O34RF+Oa7aqNvMmV38lpMRWqVJzEUwPkrPedY7uUceqqTFZN
	 5HASoLaTg1PSi071XZF96hxRKsv6QUChyNpJg+cWHZxodbt/4ruyQXypwXb0IS/5bSTiu
	 pIarz2gB5MMH8ZS1QXYEUX4PDCt20YrPmifMJoSuHjCCDXQoS+RK1VFTVBAPEPQvRajyp
	 b63K8wQSGxbGGBfYSflQFxHB2q6o1T/uibFCuApBA/Ts8STc8F2duV1faiW876E9Ihtgd
	 W98n+usx2puJSVHNzk0BvGDEopp6Wuyxy1IQmy1WHj2vkuChzk7h1SITp2eoBXiHZ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H+GlX//N";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE61606A326;
	Fri, 20 Nov 2026 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+GlX//N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BB01F000C6;
	Fri, 20 Nov 2026 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177142;
	bh=pfIaaogQQ3/aizXTxNoLej+Z34965WnxG3DwE7wiv9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H+GlX//Nt1Dc5Lvi/1Wlza+n0CaorwJRQuHMX+5f8dPbgN+nuoN9sp+1ENqWydN0y
	 MbLsYqnriL/BL0Ut/4UySPbUdwgGOHWnInA5JAbDxSi9tiuhhqBeLXR6PwW/3FTIQU
	 nw4ep8/TRMtMlJn01J21ZUxTvbXR9x8//EHiLSMVYe5kLSFEDLJD/vUXRw0x1YAVzp
	 1B5Ay/itHQBjR1USXy0HDGcH0SpRAf93fZ5egn27xvvgnnXJtEnzemquDrfcfZa1S4
	 R2oLINIGFwXEah773+i4mZy94DSxNg+1IPljI4WX+qSPfRzdlnDMC5Zv3Hd7StKyd9
	 NSGeM+R/LZweQ==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261118214431.2752768-1-colin.i.king@gmail.com>
References: <20261118214431.2752768-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: cs35l45: Fix spelling mistake "indductor"
 -> "inductor"
Message-Id: <179511156592.116416.3383551508026976274.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:06:05 +0000
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8sz/QUa1towPvGfQzU49JPVgPA29L+cbk5+8bOLutA0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrDbzP8xXXDV9fVWgmP9lEXbeCX8sy29MmMS5V3FRw
 KkbDSIfO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR3U8YGRYeWnU472bZ3bXs
 f7TfSbq7r94rzVp7Kk67Kzi7uqw1P5iRYUuLHJvInhTLFaJGuw7tlloV9Ex+u0bkzF5n/T3mCec
 F2AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 21:44:31 +0000, Colin Ian King wrote:
> ASoC: cs35l45: Fix spelling mistake "indductor" -> "inductor"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: cs35l45: Fix spelling mistake "indductor" -> "inductor"
      https://git.kernel.org/broonie/sound/c/0aa294970888

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

