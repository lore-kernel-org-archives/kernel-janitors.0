Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83452DA77E;
	Tue, 23 Dec 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511239; cv=none; b=CuJA9Dt3mPee5ojmkp7fN0k+4GMzGbX4AFbDO1ONtnI+ddSMmYpsAehr9DDiHNQLxm2XUc/BMY3JF69xedq2lZXgmPIhahWhgQFcjxNprPFa7bIyXYs+kgB33qoo67i8NNeYXG83AD8fmLpwwL3cceCdqzPPVzK7TY4qV5qfRkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511239; c=relaxed/simple;
	bh=Xhadf7WxNcbHexZkIdejQDCjOzzfeofXi1dqZAVER/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JN5Pg26HL0Pwz8r1MXx/Bcu3aAvkthuRzb1JR8pva9cAzT+CD6/tQ2iIv9/fFGN1BwiyTPHJWK4bt1sj8jwEoIIM9v0LnhiNQEyPEoC1XzyBSehhF1HA20FSEU1Sn6bU8CRR9bYMrCDaj4IYS4S+bn+hAhCVIpPhGR3tCLimJEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoXUVWJc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoXUVWJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08883C19423;
	Tue, 23 Dec 2025 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511239;
	bh=Xhadf7WxNcbHexZkIdejQDCjOzzfeofXi1dqZAVER/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RoXUVWJcWo5rR+PJhTILIkGMHhVBFPBj9jxUcbPpmJDrqsZnNb1Dv9Uravd+RSnom
	 HSpJPfeAbyx0c2R41TgA4HZDueCZiHayXBiAYKhmtsARsQl6XpZRsAjOCMEbRcAj+J
	 8RQ2Kap8hqnQvv1PHjuTih2H64AigYb5HbVsOwCw7fuPwtekQ65Pb89qd44gJfmHq5
	 vbgbnrAB2mivdHNJtA1oz8yAk1NP/x6y5AvaKDBg3qvlPyXqKrcyPEr7YPwMtuxhWh
	 LZFUmdvUL+uvCpLx8af+lzQzIf70FzjXZ7p3DmA5ufb1AQn8kGEtk/fTNYYWOPcL0p
	 9uPGD2xuHJiEQ==
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Fengguang Wu <fengguang.wu@intel.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aTfHcMJK1wFVnvEe@stanley.mountain>
References: <aTfHcMJK1wFVnvEe@stanley.mountain>
Subject: Re: [PATCH] phy: stm32-usphyc: Fix off by one in probe()
Message-Id: <176651123567.749296.7003388912771665169.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:03:55 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 09 Dec 2025 09:53:36 +0300, Dan Carpenter wrote:
> The "index" variable is used as an index into the usbphyc->phys[] array
> which has usbphyc->nphys elements.  So if it is equal to usbphyc->nphys
> then it is one element out of bounds.  The "index" comes from the
> device tree so it's data that we trust and it's unlikely to be wrong,
> however it's obviously still worth fixing the bug.  Change the > to >=.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: stm32-usphyc: Fix off by one in probe()
      commit: cabd25b57216ddc132efbcc31f972baa03aad15a

Best regards,
-- 
~Vinod


