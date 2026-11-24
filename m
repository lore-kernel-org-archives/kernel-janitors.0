Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530607;
	b=0t6c+Yt5xBag/e9Flgtmq4v/WxzPpaGeLSmJoHYVKLatnsr2n6/gyF/MN75rTNvyaP7G
	 XU+p1iuLJh8j0M5ComLE7q7c0RA9C+YI4LeUOH68+bDNBm1V4xa9ikoKOSfE4PoYCYNQL
	 S0v3o9Y2kjyXRyvp+VpXck8hgt5lh7fMJW7gqkI3E8zWaM0FDNBt4K6QnSth+vK3MJfOj
	 /Hu/QexriNWMQgXrY4U7TJbMMO7IXmDFgAzHVHOb2LPw+I+fXsYh5ZbJppt4B+FqZhma0
	 ImhuWt9Bnj3+vHzMSl12ak5dgSgqMo/H5qS2R5WhlMCxQDucb7YEWpp6rFJvxt1On4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530607;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=MCSCqZHHvryhg8ODr5LBnNsODrF/ifEJC84WKGsvfFo=;
	b=N391E2uG5L5YB0SmbVOWWwl8rWfTCWpiONdG8GOn0MoJy5zzF425Bl7rLOfbMDYFQWYI
	 KI29wVKf/ORSi4PyT+r8DTPY4A5KqIx3UqcyJfQsx2Bb4G3j/sChhA8JT79nL8EP9+7ua
	 /zFGaadExD9wp0Q313mzjHkmRvkM4IoHYvvlmCZdJdwP6jlU3mIhovR8+ty1M+wVPEwVw
	 8YtCTiZPNIHjxJ6X7P99PUdToO91xXtlqgzWp6EJUnRCz4aqbBfJmqgoCDZMVrQ/NcUDe
	 lZAyXILTXlupdNG5kiST0MUq/GxjDcyUYkqdu7uQGq3ZzfgnNvMKMMnp+cm6aWyB7MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YNa8vQa/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C25606A32A;
	Tue, 24 Nov 2026 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNa8vQa/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0D41F000D4;
	Tue, 24 Nov 2026 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530606;
	bh=MCSCqZHHvryhg8ODr5LBnNsODrF/ifEJC84WKGsvfFo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YNa8vQa/h736nAOnv31dYMYuX68VotIyc63HTGjF1YwBOriflkZuRxivavCs//ddd
	 fJaslRswxHQUhCU3k3CT9FUocUTYNC0TGRlGLZF3HMwO3L+Yi5/H8BDcDE6xErg0xg
	 8sJ1O87ebUAxgSESRXM6XRrISsu6nqUaT8wgIIxOBdSaLr3VF7S1LGCHLnc32+OHxf
	 mqXJpesmqzmRXftARfcMrqOyV+PVfEyxhJqLDtI7C3mBb0wYkZtvhavJfSK3VjrLSF
	 SPozmWCEI2xewxFjst+SwU5hEerOe6jKvpeSoECmgxHc0eNu6GB7nNjZLERaglNOv/
	 ScC8ynWdNGM1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B453E3931121;
	Tue, 24 Nov 2026 14:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next V2] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() calls in bcm_sf2_sw_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179553060553.3568937.17596403084282951473.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 14:30:05 +0000
References: <abc2c963-f3bc-43e3-a7c0-56e2cde1a268@web.de>
In-Reply-To: <abc2c963-f3bc-43e3-a7c0-56e2cde1a268@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, christophe.jaillet@wanadoo.fr,
 davem@davemloft.net, edumazet@kernel.org, florian.fainelli@broadcom.com,
 kuba@kernel.org, jonas.gorski@gmail.com, pabeni@redhat.com,
 olteanv@gmail.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, ruc_gongyuanjun@163.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 20 Nov 2026 11:18:20 +0100 you wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Nov 2026 10:45:18 +0100
> 
> * Reuse existing functionality from devm_clk_get_optional_enabled()
>   instead of keeping duplicate source code.
> 
> * Omit two clk_disable_unprepare() calls in the remove function
>   and on error handling paths.
> 
> [...]

Here is the summary with links:
  - [net-next,V2] net: dsa: bcm_sf2: Use devm_clk_get_optional_enabled() calls in bcm_sf2_sw_probe()
    https://git.kernel.org/netdev/net-next/c/91cf0bf355c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


