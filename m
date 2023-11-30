Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4BE53806;
	Thu, 30 Nov 2023 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzZZ8kZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E830C433C8;
	Thu, 30 Nov 2023 18:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701368622;
	bh=qQlf1wlM46DStT6SsBHk1Ov4ohMfBkiHcFw/hbSHDzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzZZ8kZRdJ6pu6uovrGlCvcsYD7x7XChrvYhQtmCH0KuYQqvn11bWG96iotfj+n7p
	 dXhzk7H2K0gpbPETqyRcS6ISPZgn6eN27zEvbY9g8OqigiikY0TfTmeveUjN7p3AZj
	 ZTIj+dyREsWw7HRSoo/fVNdWUnKXjScHmJe01yqK7BWZIMbnZbohkkmltCJidBGLIG
	 kVHBqFoNIAnqmJybMFjnBDFeTWHdLBlspwKVOVZGBsd5gdmGtjCBJBNgEhw1o7PfGG
	 Tlxlf3Ib/rtxu0Q3rdlAOswSiIGZ/kBdBDHKSkxjCfnfrZZFwmdUYhjBaYbbnweOSv
	 rdwpPyoHj9o1A==
Date: Thu, 30 Nov 2023 18:23:38 +0000
From: Simon Horman <horms@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shinas Rasheed <srasheed@marvell.com>,
	Veerasenareddy Burru <vburru@marvell.com>,
	Sathesh Edara <sedara@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] octeon_ep: Fix error code in probe()
Message-ID: <20231130182338.GM32077@kernel.org>
References: <cd2c5d69-b515-4933-9443-0a8f1b7fc599@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd2c5d69-b515-4933-9443-0a8f1b7fc599@moroto.mountain>

On Tue, Nov 28, 2023 at 04:13:19PM +0300, Dan Carpenter wrote:
> Set the error code if octep_ctrl_net_get_mtu() fails.  Currently the code
> returns success.
> 
> Fixes: 0a5f8534e398 ("octeon_ep: get max rx packet length from firmware")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/ethernet/marvell/octeon_ep/octep_main.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks Dan,

I had noticed this one too.

Reviewed-by: Simon Horman <horms@kernel.org>

...
