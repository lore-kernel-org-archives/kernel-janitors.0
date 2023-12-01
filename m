Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE0059539;
	Fri,  1 Dec 2023 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7lbX6E9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B5DC433C8;
	Fri,  1 Dec 2023 07:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701414925;
	bh=CNZZ/9juIG0OKqeCsO8gwDQtYKzOzJvLw6s4b85gygc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b7lbX6E9Atn0nM6nUkJOXvJ+YXnvvVQOBP2sYOjYBPcclVzf6WHHGgKnA1gq2ttWT
	 dHrzt+cU+6aeAbyDzCORYpaRuSmUenP9+ObSY/DjxT1w0bc28kVu26xPBdONHICl1g
	 1WercqzES8h+hy0PjTeBQug8GviZrNeMPIblM0VTIxD84kZEEP7OPPAi5pd+ISxAaY
	 tvivvH7BVAU9LrbwMiV5j6d/+5EPWcP4NaAJ8mtt2pDbGCOawySReq84/pKuGLGj5u
	 oAFFfXByC4nusyblyyqQADkO8p2Pp9GRPYrXDURtCj+Zasvu7lkwfnd8M/BPxzgnvb
	 iLvePxfTOoQpw==
Date: Thu, 30 Nov 2023 23:15:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shinas Rasheed <srasheed@marvell.com>, Veerasenareddy Burru
 <vburru@marvell.com>, Sathesh Edara <sedara@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] octeon_ep: Fix error code in probe()
Message-ID: <20231130231523.267c08a5@kernel.org>
In-Reply-To: <cd2c5d69-b515-4933-9443-0a8f1b7fc599@moroto.mountain>
References: <cd2c5d69-b515-4933-9443-0a8f1b7fc599@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Nov 2023 16:13:19 +0300 Dan Carpenter wrote:
> Set the error code if octep_ctrl_net_get_mtu() fails.  Currently the code
> returns success.
> 
> Fixes: 0a5f8534e398 ("octeon_ep: get max rx packet length from firmware")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Sathesh, Veerasenareddy, please review. See:
https://docs.kernel.org/next/maintainer/feature-and-driver-maintainers.html#reviews
-- 
pw-bot: needs-ack
