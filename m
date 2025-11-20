Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB336E553;
	Thu, 20 Nov 2025 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658717; cv=none; b=o1bd+KKL764RIwMtNhMYUNkamEg9tjkUVhh1MaG2ClyaKY0TCHhzhBlyVRxuSmdZAd/FX8bHIiuZqUsHOGD//S2QqoxajDtxckV1ATSrk5FgyNzqjHxC+yE2tFhO45+IRtycnJXP5wYjcguX8LM9/zz8Vo7DrffZkIqEddWNrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658717; c=relaxed/simple;
	bh=Khl2Qo1P141T4GRnIaWEBwnUt4cNlNthRenhT5dHchw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NR+CV8Vf0VbuoHkY12f7xQi2KPdUIzVCnFsln4Q/e5lncMRhhhD0GT2ckAGk08P4GhaBmwGE5fs/czlLHDi2POTB0aL0pJGP+kmT/FzJuKXxUArj/YoNKDs6z9cmEzZem7+JVTVY6Sw/6coUizGMGIWG6UF4nvArxgeqBmQF09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWCrRjaW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWCrRjaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BAAC4CEF1;
	Thu, 20 Nov 2025 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658717;
	bh=Khl2Qo1P141T4GRnIaWEBwnUt4cNlNthRenhT5dHchw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TWCrRjaWPkgxrKHr7zV8lxhDoz52A5Remcdn4SMaH74fUenDqGf9lDfKIf98AEAo6
	 V3yXpr2XrCbKCocxmUdYAiGt/VB3mbW7APSjnKdJjqGWyl6tA5ibg8ynO4yQjBbKqo
	 //+5QhFibkjjQjli5eHh83XPIggKIrsedduPSp2JHzAnS3TNPnDbtDB3a/BLOBsrG9
	 jjwOJHhLzR7/PlFau3oR6ssASjsrIgv1DxHA0LNaW3ZC7kjQGG6qg8TdKmRCf+M5h/
	 kJpU3T44mVMicxNFpGy5vrkJEeotMPFp0Us1Pl6FXjqvFQknS5aOiGbuFT5B2g3IVl
	 FuzCmCUz1GPQA==
From: Vinod Koul <vkoul@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, Andrew Davis <afd@ti.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aPJpB-QI8FMpFGOk@stanley.mountain>
References: <aPJpB-QI8FMpFGOk@stanley.mountain>
Subject: Re: [PATCH] phy: ti: gmii-sel: Add a sanity check on the phy_id
Message-Id: <176365871460.207696.15567029347184723222.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:54 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 17 Oct 2025 19:04:23 +0300, Dan Carpenter wrote:
> The "phy_id" comes from the device tree so it's going to be correct.
> But static checkers sometimes complain when we have an upper bounds
> check with no lower bounds check.  Also it's a bit unusual that the
> lowest valid number is 1 instead of 0 so adding a check could
> potentially help someone.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: ti: gmii-sel: Add a sanity check on the phy_id
      commit: 9d3daf9ca3239042c2cf473a76db2a77e6de22c6

Best regards,
-- 
~Vinod


