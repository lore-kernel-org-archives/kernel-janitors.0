Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D441A2627;
	Thu, 12 Sep 2024 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145834; cv=none; b=gD465qF0xnIX74nyX7GMh2MM8C+Hl7DP1j3Qu+P76iCieE3/RUOVF3nvXgl/ZJwg0MaqQ3ugfmMgyoZepVkaBAys3KAn2VvL/O/sfBQj6NaBvhQgTk/n3AAFF+xyiDBr6JoEkbsebZZZLNB4D3jLwT+8EHuYyfmaTAoe3j8OitI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145834; c=relaxed/simple;
	bh=ypklNkeJF0WTtFhNxFpydyFuEDD+4niLJfPzNhiugkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTxRMxG+TBpU3q9yCDMp1vz1GX7a5/kk6y+HyLIGAKDgEKUfNDw+aDtz3EEprW1DUfmsY3/yx0SyUs5nWrNnnbD3xB3qq3o9LACJ1DNm0qz1iF+Vk7Nv8SCMkLFvxO3a1wG1HpBzFKfeFJ5fjQ0zeYWwLAk+dMQqOjcbf9X0FBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nsed5LIo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nsed5LIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E85C4CEC4;
	Thu, 12 Sep 2024 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726145833;
	bh=ypklNkeJF0WTtFhNxFpydyFuEDD+4niLJfPzNhiugkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nsed5LIo0DqJ3LGqIWkekU64NT+us3TTeN+DEwaagVjSdOxwtk7FbQ1SANMns/OjD
	 ZKG5tk9CrXb/PrCeUHm7ivRUWxvqiRX6pyMnqyNR5lk+aJdiuJz3ICoVf62gE7y8BL
	 Td3PEQSv9G0SZUkEtWhe17gakozJ8K/dwPX85gOFF6vIDc/BoTosnCaM07hsgJIF4i
	 oK+HwT1bSSodn3vhyX4oRecqF+NdmaYB4A5qq3kJtTHa91MKqXmK/KtvseMnlNQu8m
	 4wr4L8d+Wm8xW11tnszU5geO2k07TXQTe8Vy/sdMpjk/aVdSCNGOKKCpvKKANeEBRy
	 U8rasScibxFqg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] perf: arm-ni: Fix an NULL vs IS_ERR() bug
Date: Thu, 12 Sep 2024 13:57:06 +0100
Message-Id: <172614177458.4013007.6131513569519977732.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <04d6ccc3-6d31-4f0f-ab0f-7a88342cc09a@stanley.mountain>
References: <04d6ccc3-6d31-4f0f-ab0f-7a88342cc09a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Sep 2024 10:39:59 +0300, Dan Carpenter wrote:
> The devm_ioremap() function never returns error pointers, it returns a
> NULL pointer if there is an error.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: arm-ni: Fix an NULL vs IS_ERR() bug
      https://git.kernel.org/will/c/2e091a805feb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
