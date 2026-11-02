Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725420;
	b=Eo0NSHuJT3Mn0hAShbPLikCqAzMCm8S9uNOzPIczu3ktG5nelzyr9YZsBgtnb4K17q5z
	 9CBguWJZeJL/1dzEMskMSO0IMid/zarU0hsVPTZ2jC2HkTbkUl0Ot2CB9eWwdB+w+MSok
	 I8pj+HCiW0zSfzTB/roJgbW0ads2bDQMuDfDXxb9OxeXw7AuooOWIRVGcPFwLT2LmBDO0
	 +LbmGNG0LR9MA9wcaR4LsPUa+Y4vx6rAosnZ+9M3j82ZC7im14/ZcDdawL2O5DqcohhZw
	 e3xk6JSFwbU/Rm8Z/bu8PCzgiUC70Z0UuJEobgeIgCsaohG3ignNJITJUNxEg3kRNmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725420;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JiCDgwVCg16WXZ6ncpwAPeYjziheuaMGPWgI1mJbVCI=;
	b=MMA5192O8ZkEaqbJyWOFsmulh1x9Si7jdahcCizzpFn64oCmQvnHGNRceZaAnFBpjl87
	 46NhHosMkicIKLiI6WpWFnuUSRsRVeTEOOPiXTtpjyeAjl7lLaUGE/Cm3b8g42dl066nD
	 jUriecTa0BG4amsSCHMUdVYf/fN/p6MJq/Txkb6uzQGEBZcNGT7piOST2vOXGvfmP7PsK
	 er4yHCRY6igBsiQPibSlFhVDcxLsK4jR9GUOkQuLvZ21/PA7sRhR+ndmKBL282TzZvnRG
	 lH3QuHKePlXfDMc2kVy3rrSrI2XBQIwNYYRqBbPdtQLs2zAF7Ft7bJhuZjGHp18oNDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhZFB+Zl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449C606D80E;
	Tue,  3 Nov 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhZFB+Zl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622E21F00A18;
	Tue,  3 Nov 2026 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725419;
	bh=JiCDgwVCg16WXZ6ncpwAPeYjziheuaMGPWgI1mJbVCI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EhZFB+ZlAZtEexaZ41u1BcOpHkR1LAdk7bMgqtYKjQiltXJ9NbZ1XzsPDmv+JfU1A
	 lns0XvpIVuzH0NREp4WNbpMZgie5FnOhCpSjwwloyatn1o87BDwwcyPaS4yOmWSrjK
	 +kiRuKEfDNAh6OdqqhPTooHYmDUXoAP6eW9U2BZWE2enWRH9vSBzeUBgePRW1dsbO6
	 hR3VLXiMHofRUoORbnmuYbuNxUiAMF67+/G++8nFc5dU/pOYW2+ZGdndEkHdljQMB6
	 HTx9MxgfL+mHDApsQ0xdNW/HgbxWz1B5bP1ipi9v4o+qOClGAOdTdI9kx2NwSiyAd0
	 neVLM+S4YUcrA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7CF4A255728F;
	Tue, 03 Nov 2026 17:03:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <68e28df174c8524bef54cb437e568afcb8a82e1e.1792834312.git.christophe.jaillet@wanadoo.fr>
References: <68e28df174c8524bef54cb437e568afcb8a82e1e.1792834312.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v3] ASoC: qcom: qdsp6: Add an error handling path in
 q6usb_component_probe()
Message-Id: <179366030216.2186205.6039386182230232762.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:58:22 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qrYCBIgcfstxVxCGu//w28qjj1a4OidLvGoGVX2VXUc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeCb/ktORIdw9vKVr0weVm6pTahbXHvVKX8LmeEmE3N
 Tl7UlGso5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABOJbWX4Z3/nkK/oihdT/ocd
 FPe7drb6l2R4kXVPQUHWhoy1Lgaz7zH8U73zRUCFPcv62/r7EUnrT7tKr11t5fXOflfwIcU9Iur
 PeQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 24 Oct 2026 11:32:09 +0200, Christophe JAILLET wrote:
> ASoC: qcom: qdsp6: Add an error handling path in q6usb_component_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: qdsp6: Add an error handling path in q6usb_component_probe()
      https://git.kernel.org/broonie/sound/c/789a11cc2f98

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

