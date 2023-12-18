Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA40F2109;
	Mon, 18 Dec 2023 04:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMUoAMhq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40E82C433C9;
	Mon, 18 Dec 2023 04:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702875101;
	bh=G2OnDa7qUxuDNQnTXdeiCXaRCYH66zJSXMzhQ0W8DRw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sMUoAMhqXVd9wYNFR9rOUJK0x7E5k6ri7jcKEYb2gnel4/TNS7F6B7WG7qMDfcJIb
	 dzlEvQICYE79Mfrw6b9HYCO9nPqb99Y6m7mfvppo/H/rKhbiK/mEujdWX/lw9Otwyq
	 d1KPilqGMsVifA6zCd9joLgLFdp/WiAri6Dtz7975sZ0KdNPX3PamBkAN9OmqwfnbC
	 4O9c305i72hNi69s3GebMQ+HPZ6F5a6hycP4G3Q/Drl1ab7HF8/nKsEArRQS5Ax2cn
	 Bp0bV9stiSg7f+3QqUI6cr2SEFkrNu97LVcYALmyz4Qf77ZsYSFtgGrfMvbijgap6X
	 H14wI9Y4QlTcg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 281D8C4166E;
	Mon, 18 Dec 2023 04:51:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome/wilco_ec: Remove usage of the deprecated
 ida_simple_xx() API
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <170287510116.24063.2444425709742229604.git-patchwork-notify@kernel.org>
Date: Mon, 18 Dec 2023 04:51:41 +0000
References: <898d9aa181a84f1d17725ca047004bad532c37e9.1702745959.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <898d9aa181a84f1d17725ca047004bad532c37e9.1702745959.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: bleung@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Sat, 16 Dec 2023 17:59:38 +0100 you wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - platform/chrome/wilco_ec: Remove usage of the deprecated ida_simple_xx() API
    https://git.kernel.org/chrome-platform/c/57eb6dcd32cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


