Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C3456E04;
	Fri,  2 Oct 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945923; cv=none; b=BnDFavfoarZ1pKemLs2bU1EXMkhCkdmeXp9BbO18kFtl7fSydsHpW6KvvB72R8ilzhDf0BFhmjMkWKnyptHaxws0Farp0DNXKoEmycT0vFBMvfscANLnRlIBK9oGES/avvBDfvp53ykaGcW31HNMObsdoiFOcmoMwhJlRjjMze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945923; c=relaxed/simple;
	bh=xNzzvSbc51cCr5Fc4km7Ggs6a26Cs5l2cnWUIKJUQGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mCzwu9fMrE+7QuFWb37URC8/brjSEH9XIxsd5BQGrtTXVnlbdbjvjmpWrEs5gLZSQ2eeGCO3DjZWQ5vUYL6nS8Ic+nND/1VKEqA523UxxJUxZoARFxi6IudCOAVFRg85eNQuOBEMfPbX6OQewvSFCU9wJV9x+UcdBqUTNfVlGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcv3L+tB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcv3L+tB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB081F000FF;
	Fri,  2 Oct 2026 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945922;
	bh=MxCdHBRqLiCyses9ZXUhEWZjiuwRWjHs0M5h8P8vfYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jcv3L+tBH3LimxChE1JsfoALkgjn5vqIPZ7ek8Qstx2qOMDc+KkaCsUx5degoPI6d
	 ZPFHynWLCrXwk7s15eMcUYvqAg69MYMAXiFQMU81A7wK0u1TarW2E4Sn0EEB6oJZVQ
	 APf/nmS+KmtZgiRCDnaSjEEeXDn8J9wt98UlCvtqJdIDCgYMEhjol3nn5cfd90JWoJ
	 3haVYfWnY98vNiB1KO8ioWVznqQeodY6NqUje11Sv7vd/9viWTIj4EPthMJZlPNXAd
	 sNetjg1SZYZDJAjZFRrzMNFHWErrUmbzQEi14seC/4cIjlmOS8rEx8NdolN/Pj7DgX
	 /TXB8mc9b6CFQ==
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>, Dan Carpenter <error27@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Luca Weiss <luca.weiss@fairphone.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <ar4C-0NIYXiAvxvv@stanley.mountain>
References: <ar4C-0NIYXiAvxvv@stanley.mountain>
Subject: Re: [PATCH] ASoC: codecs: aw88261: small cleanup in
 aw88261_set_tdm_slot()
Message-Id: <179094041583.83544.1416484005770287015.b4-ty@b4>
Date: Fri, 02 Oct 2026 12:26:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xNzzvSbc51cCr5Fc4km7Ggs6a26Cs5l2cnWUIKJUQGo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqv6p9iCVzPsQAYRcBZG43XkuEdlepHfR94eKnL
 mH5W2v9g6eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar+qfQAKCRAk1otyXVSH
 0NDEB/0U8ja5Bsi7wfRnXsmzlTAoCXRy2wVGPTCJGZuMySVJ4nlyzQx1Hi54dSD200WwX5g49aL
 FJC5xSlCweDFvdNJZXeSiWVzSNt7uEfc8GMm059HzIVf85ZnpySALGYs2vgSaSfWDq1zH/g+0xd
 +D5zY4z8OOHm/TqgQaTwygy2XEJ6nKdIHmaD5eJFhPpL0jhFqwi03STEXfadqAt3IWP0ITudaiq
 Nk9LqTdywy6M5F+tCbKYVOnARxXOO0YXrQcfQizY7qiTRf5o84Hs+BrdUIFZqs6yP0h1MR6zVG+
 ReseQzfjvYpZgC+RCvSSN/fyuLw7kT+zmdxDwDkRNZ/AMn+Y
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 01 Oct 2026 09:51:39 +0300, Dan Carpenter wrote:
> ASoC: codecs: aw88261: small cleanup in aw88261_set_tdm_slot()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: aw88261: small cleanup in aw88261_set_tdm_slot()
      https://git.kernel.org/broonie/sound/c/015f14e42b22

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

