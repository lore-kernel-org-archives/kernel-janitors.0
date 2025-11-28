Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625862EF67F;
	Fri, 28 Nov 2025 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764367713; cv=none; b=nqZ+q0it/fVQ92noU0hiAh3pwQE1aCYu0AXqad8lXKZI0nKjcimxE5DiRoHeEmKTu5rzB/2a1AlEx0AhXC7CUZKLn8ZJML5wiEfprYmmdsm0yeJo1yc7vyBrr33dy6SNNIpdELT+USKLGUEwuqZ17KqzAWUU8iG5t6EqsiexKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764367713; c=relaxed/simple;
	bh=8v0H448zrgwKHVTM0qKOVUgqMPZiapDbOQiQytfn6mI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CTcusYRkvIvzS6Ey0m51Htz7qVWoGY1jaq/hoDyHTLBemMrT1P6vgp23b4eo5TA0t4hiLLjnUInX7sMAIFmYmzyfuYZ32WMxdk+GUIfX9iEsORlvPEGQ6ou3SwdshLW9phwt4XO6o7CxpsrdJFqrfuAR3NPmtGjYvZwCthMFw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqed/Hua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqed/Hua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E88C4CEF1;
	Fri, 28 Nov 2025 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764367712;
	bh=8v0H448zrgwKHVTM0qKOVUgqMPZiapDbOQiQytfn6mI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gqed/HuaSLVutZ3VErebzY6HOFhjb3GvVqCNQF//0wUcN2J/5BfvsiCwY9KRmxoaf
	 bOIei8y+X2o+FvN2LrWBKXal5Z46Qw+rcO2hbrLz3PWMw7ZpiIgAJ0yw8RlPvgSEzX
	 pfym8E0FUb8+l37xxpiWRMOkQsg3OwqpQFdOVL6z4aTvsn5nr8f/anzV+Y5h3HRclm
	 vg+niUmCgHxYS31USbsgykFxPerocKdFxmjA5brwx1TQg7DAlY6dynC5g4dsUXYskL
	 0PU4/M5nrpr++1WSvozAgndtNVuUBmT8m861dj2LCbUZHbHN1Hxpkmhs7KS5jcuHvq
	 ZjaMegS/BZXLg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251128173330.318309-1-colin.i.king@gmail.com>
References: <20251128173330.318309-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] regulator: fp9931: Fix spelling mistake "failid" ->
 "failed"
Message-Id: <176436771166.243793.18205200780386351096.b4-ty@kernel.org>
Date: Fri, 28 Nov 2025 22:08:31 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 28 Nov 2025 17:33:29 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: fp9931: Fix spelling mistake "failid" -> "failed"
      commit: 81d431130ae1af4e64030f6a956ee9137e6fc1b0

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

