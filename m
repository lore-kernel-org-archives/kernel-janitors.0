Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9325D1D4615;
	Mon,  7 Oct 2024 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310736; cv=none; b=e0ul44WvKy5n5fpBAHky6NSP2LG+/cuAsfOc7c357GK587HDGYfL4yip821fqQAAFEew0Oy2kSjqrXw1doHFKwlf6dLzI5P768x+ZPrKbiRx65QZwd3Dm0tbAbLXBDHJMu+FZff/w/WmDObfn7Gra5NzMuP/f8drlTmQBwhvPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310736; c=relaxed/simple;
	bh=VyYawA+L8pgABJoN+OQgamIIXH0fSYWURJcLP9HtzAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqAqFh4rSxLyg++qpTXAxZRzi+SCJQUU2JlI/7iR32yNSbrV2dNvkOSEss1uExdw4gSsBUNlEO2YWnYrmAiKZk62T5D0T8t5CSyukxg6qU8aFf7T7z/q0VynzekSVoEc1+xzviMFReUp+J/zyWf53bMgrAZsvmfQCB55P8rmMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvinucVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvinucVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C36C4CECF;
	Mon,  7 Oct 2024 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728310736;
	bh=VyYawA+L8pgABJoN+OQgamIIXH0fSYWURJcLP9HtzAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvinucVM/v4qqYG7bppPnz6Tkz6+GKUU6fDURQZABpMprr3olyBw/LL0/2UmJdIpf
	 lypQwQhQ6O3k5+adzySAozPH3kvq99+cDN2QduWsWzA5MGSyIIjGcF0f4dsLtP57Dc
	 9leA7i0NiFFoAZwNM8caoWSbFONaG+i9M1GJrqs6VduN+CxvvswjDjZNti5Zpsp8y6
	 0fDaAuwocbu686XbbKTwQSsomsqEYhZqdagTo97RHDkakF2GdwAFcuRNvZ2jn2HXcq
	 ezBtN/59rnQ/zv8ge9qTJhbfrZIUmb8/ED+R5eaPgM6hqxUHjZA1uxT2evGtmAHsOu
	 /oSWXvx6PfhgA==
Date: Mon, 7 Oct 2024 15:18:51 +0100
From: Simon Horman <horms@kernel.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Madalin Bucur <madalin.bucur@nxp.com>,
	Sean Anderson <sean.anderson@seco.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] fsl/fman: Fix a typo
Message-ID: <20241007141851.GE32733@kernel.org>
References: <20241006130829.13967-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006130829.13967-1-algonell@gmail.com>

On Sun, Oct 06, 2024 at 04:08:29PM +0300, Andrew Kreimer wrote:
> Fix a typo in comments: bellow -> below.
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

