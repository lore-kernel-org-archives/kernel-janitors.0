Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D8189531;
	Fri, 27 Sep 2024 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727437828; cv=none; b=Yx2ZSrxaiElBCt8aLseN0CGfxQRMGxifvKm25E6yDc7gNxBk0F/pztSDMjXsOVvDmaS/KaBeSxO4JbtY7gDkB5s0M3gSMrmndytZKImCQtEDBDEQ+OPg9B2TMrhZko5NeEFxFe7ENzkhFI5LSCT9kyhXSaRrjY56j5OS1KNK6gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727437828; c=relaxed/simple;
	bh=KdGagpRwJuOzcrw418uFm+UN9AfgfRkcfS3S0xSZpms=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BMhI06ZTgQhzAvv7T+3BKDEmrovMdSj8vzGs0IrF/gJAq7bqjoPEs26h7SM7O/Zmaf+/SU8Wf2q/W6Yywxhgo/O6OSQCMf3e3eeyfe+w0cxeMCeaxAKx9IrvDBAOndfjJHyq1YBc6mU2CMXPi44wWxSJtCRheUHB0kaFhRlU7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BF6Tr3zo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF6Tr3zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1495C4CEC4;
	Fri, 27 Sep 2024 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727437827;
	bh=KdGagpRwJuOzcrw418uFm+UN9AfgfRkcfS3S0xSZpms=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BF6Tr3zomTUP0+EmmicGg8/puZd5wtKh0IvMg0c2WiYUlWoINGHe+tFyH+Jvvqvu/
	 YzphCfiaon0QyiYN8isL0T4VOhUeXxMM4hf3dUBFKYns9p8Pkb+Iz5LwoS+XItXtmX
	 9kSJP/A6z27OTQYlXwC8zTRuw0I0rCL78YSMO4CQ74jE7Y31akBbiyrJXAok2YIQjP
	 /3LpKjg22msqr7TSiuBbO9zVl6zbHQ2jCNahh6EdrscExfgZPONqE3fEHKASo69o7O
	 EbhAdtKsRqzGuNPMdK8W0J5cqP8tQqIwBrJVToaRTVuWoQaDtepXeQ76gGAp6BRGFF
	 PDDIiVLZiryWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEAE83809A80;
	Fri, 27 Sep 2024 11:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] cxgb4: clip_tbl: Fix spelling mistake "wont" -> "won't"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172743783052.1932325.9031970962313552253.git-patchwork-notify@kernel.org>
Date: Fri, 27 Sep 2024 11:50:30 +0000
References: <20240923122600.838346-1-colin.i.king@gmail.com>
In-Reply-To: <20240923122600.838346-1-colin.i.king@gmail.com>
To: Colin King (gmail) <colin.i.king@gmail.com>
Cc: bharat@chelsio.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 23 Sep 2024 13:26:00 +0100 you wrote:
> There are spelling mistakes in dev_err and dev_info messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/net/ethernet/chelsio/cxgb4/clip_tbl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [next] cxgb4: clip_tbl: Fix spelling mistake "wont" -> "won't"
    https://git.kernel.org/netdev/net-next/c/c824deb1a897

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


