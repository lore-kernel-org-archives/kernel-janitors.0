Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47A1C9DCE;
	Sun, 15 Sep 2024 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726421054; cv=none; b=MA0rttEW8EgfbwRRas/xJYTn6WcvVGzyFlyCpZsZptHNfZ8RlzI4yIVg5rNKpLAiCj76vPspshu3R2RWl9KeGywpFOpylHfj4FwnOKVPghOvEVC8eWWM+FFiKhGZt7/intgarHVnxj8avH9sxEvkanSqEOdbTRV/q50tSnTVL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726421054; c=relaxed/simple;
	bh=hbYBxjRe9xOmbBdCgzLr+bZgqbvaOTz2Jrxx82UBIVc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOfieqvw3am0yfE3jGnIk4ApQw2UxY5CJ3Qi7k72ryC49c42rjXSw2X7nMIl3HY8pX4jodEq5l1GUfn/sk44psbqZ4XMeUCpT6QfNY6nxSUnKtsZsQGpzhZ0JJPaIGDk8Y2In/sLon7xcjg6w7lkdWH5BbNTigsTNZo3uLF0DZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G93QcKb5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G93QcKb5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED89EC4CEC3;
	Sun, 15 Sep 2024 17:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726421053;
	bh=hbYBxjRe9xOmbBdCgzLr+bZgqbvaOTz2Jrxx82UBIVc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G93QcKb5iWLJ9MgqHoskXy8orjXzuGmpAzSrOlVVwFyvJjeXtlXMHLM93Ss1hEvTn
	 Eho9R51Nb5t9CFq2njxYtq1HC2kRFNYuxNj6tXDOrKCJiHqJ/pF0475qJR0N/lHOS4
	 QVCBoG52iclz0qGQDvuUgh0VToUYt/7cfqfO778rP4cp2Wv4VIkmbStfR+bG4HrHUD
	 80MRvna3RGE1ooMpD374M2FvsmICCF43t+qQwzE2eO94QIg0DmXKwOfRXvYDpx6BcW
	 UI1YUWFT8G7scb8E3VpDFWNmtvHFgDJTFqJxjG0ccTnSbAfcaNLUTCmjF8BbJR9ZM1
	 eNKWCiw1GBXOw==
Date: Sun, 15 Sep 2024 19:24:05 +0200
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson
 <sean.anderson@seco.com>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] fsl/fman: Fix a typo
Message-ID: <20240915192405.5b41145d@kernel.org>
In-Reply-To: <20240915121655.103316-1-algonell@gmail.com>
References: <20240915121655.103316-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Sep 2024 15:16:55 +0300 Andrew Kreimer wrote:
> Fix a typo in comments.

Hi! please repost any cleanups for net/ or drivers/net in two weeks.
We only accept bug fixes during the merge window.
