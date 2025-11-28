Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CBD2DC341;
	Fri, 28 Nov 2025 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764365717; cv=none; b=KWQT0cByGDRM4k1vHZtrlRJgGX6kwSV7RC9XsbODN5pd6YnNeOFSuIuqpnlwby9PWsF28F/EYA2W1KPIHTPjIAyDD1OrpNrEwYDwF7cyRZ1hG23e6IVdlHHYwxU6PmxIcEn6aLX7eMKUqrwtSzzvK2t1WYRifHkWAZ9nGGEk73Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764365717; c=relaxed/simple;
	bh=UlSCCVBRr+f1E2bdMNcdOgk2C43LziX+BUQybPPdP4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U+86vdRUFxjYBGVFSudwusXdW4daQNMz4HIyDF3IOArEiR/a1FtNqJo1IgOblORtyShuSvwJnk5Ea/M2nOL8xskSPrmVj88Z45xLHHCg9giPjmYqcAHUO1tLwb/FE5Rptsb/ygB3qGeOZ4MIqn38+uXvFfdigpGB6ylA1dCXqCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEX2aCCM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEX2aCCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB09C4CEF1;
	Fri, 28 Nov 2025 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764365716;
	bh=UlSCCVBRr+f1E2bdMNcdOgk2C43LziX+BUQybPPdP4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JEX2aCCMXhynJpHA58hELvZp6ddkjXUExOqhZfsdMk64gCcukZvKTMFwOxJ9iuE9c
	 CtzwICfJSMJUVAQTuSQRH5+Y/zjX2GPmSw8qM5csJ6Xhr7+7b08j3obkqM4Y5igKYm
	 Kd3xxtD7rUxwa0RY7XJTNhw6Eu6ML/MBcfHsseuEWdzjSbWgit1YdRKMBleKPJhUkV
	 PX+q8goZGmQQSYVNlUKG7HFLCU+0UJ29zDnZz6uShOgvGHzc/EEczr0RkLhsb0eUyE
	 xaWbkA97GSKKaKOPVMD1dP2rzM7WX/xa5HjH1UO57Vop7XkLrWgLhVdHKJtYeiGEhI
	 Vka5IolLewZCg==
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aSlNO0sqQr2A4vzG@stanley.mountain>
References: <aSlNO0sqQr2A4vzG@stanley.mountain>
Subject: Re: [PATCH] ASoC: nau8325: Delete a stray tab
Message-Id: <176436571485.232510.6545700481876587046.b4-ty@kernel.org>
Date: Fri, 28 Nov 2025 21:35:14 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 28 Nov 2025 10:20:27 +0300, Dan Carpenter wrote:
> This line is indented too far.  Delete a tab.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8325: Delete a stray tab
      commit: feab2875893510ea1bde4d3361431cd7ac53e555

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

