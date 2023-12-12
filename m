Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28D7B3CC
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Dec 2023 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GL7Cxije"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88ADCC433CA;
	Tue, 12 Dec 2023 17:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702401671;
	bh=5E05OTck5q9FmBYGpl4V5F7c+f7l7TcBKvljuUu5T9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GL7CxijelPXUYHUwP/G07d4Dv54xSud8+XusGtqMRaqTmf1mjVf1YCVuRe4SwOLwN
	 iWj2dJiNtim6C21vFsfi2V9oSxaRh1sDjfpoCVXOCwziQ9LckJ8q5QhH8u7YWq3d8+
	 49xdHxff+m1AT6Eay8YtakAR+yIO9NX/1Pz1gySrZ6hWN97V4gYziFqYHY3L5JpiKP
	 RftUgpkvGA7ngOcXTK6o2rAo9acMWx5Fbo/Ce2IZazsihWbBuQBsYd7/bZtpG+UEnP
	 OHfCKl7xk3zqPpmhrBXWNvP8CF5ovgkIEpsX6nD/cJDBIPYNERa6VhSP8uq7hN90c7
	 s7k1/GW+n0Oww==
From: Will Deacon <will@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: Remove usage of the deprecated ida_simple_xx() API
Date: Tue, 12 Dec 2023 17:20:52 +0000
Message-Id: <170237283916.1645846.8049910363792099274.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <85b0b73a1b2f743dd5db15d4765c7685100de27f.1702230488.git.christophe.jaillet@wanadoo.fr>
References: <85b0b73a1b2f743dd5db15d4765c7685100de27f.1702230488.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 10 Dec 2023 18:48:18 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] drivers/perf: Remove usage of the deprecated ida_simple_xx() API
      https://git.kernel.org/will/c/79c03ed4b896

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
