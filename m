Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD0C3A1E77;
	Mon,  5 Jan 2026 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767590798; cv=none; b=JgjcVkOaOb/0RAznmkDdblN1zo/xGV7k7PzWk2HZVMkncgm01+uW+11ANVcHnBE8YYZhOpaQa+X7CThYKCXv57rKOYrQdWG/T8G1d9qhpc35MSFn/3h4IoZb+XaHF44C75KgkW4zXQyuWnvXhZYTL2nwEi9ZvuyvDaZdLnYl8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767590798; c=relaxed/simple;
	bh=zvvg8AmQdAqvlZU/5MgPfJwyH0EOaUGnUf/oADXTllA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD/BPTMWy2CLm1dfqFhm21kJGHPWURFGrcz8E158Nsc3HuVR5m9KmM9yIih9GA54T0TC4QktoXNxhPuewxF0ze0qwC1HLQWHZDinQLpLK2Y9gHzO0czU5dKHnKf9GHJF1p/EZKUr8KahHdaOI9bsORgVFQK9dEBodHX2gi/BGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+5Eni3G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+5Eni3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73407C116D0;
	Mon,  5 Jan 2026 05:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590798;
	bh=zvvg8AmQdAqvlZU/5MgPfJwyH0EOaUGnUf/oADXTllA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+5Eni3G7wsP6sTikeT5kPwuORBaNZxI/5UyIMuPf8ioJIfM4G1+wo9ty6lSZs/tZ
	 ETrAwWl8q+eysTRIPTdpxbq+tgyX2NigTWsWNdWn1lAXWk18bCCibx5jpBy1tPlbaD
	 3mtltKdSwCgbKSnyFJH4BAymGYNOVIxHDGIcarPnzIjEvv93fhRgVfnvZ7I4AslDGK
	 bUMH/cNletrZUvx1QjMtVMpguR+y887dgkWzJsfH9YKTVK5MLndK7CaaSOT7uLOQl1
	 8uxXMvs/7hPrzMCBjw5o8P+s6LDLfhWrc5HSk3arQO/kTGTHdjCB4zKBquzhs0EznW
	 bMQtJcBu0uXCw==
Date: Mon, 5 Jan 2026 10:56:32 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	kernel-janitors@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] optee: update outdated comment
Message-ID: <aVtLiJBGovTFhjcc@sumit-xelite>
References: <20260104170119.291968-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104170119.291968-1-Julia.Lawall@inria.fr>

On Sun, Jan 04, 2026 at 06:01:19PM +0100, Julia Lawall wrote:
> The function cmd_alloc_suppl() was renamed as
> optee_rpc_cmd_alloc_suppl() in commit c51a564a5b48
> ("optee: isolate smc abi").  Update the comment
> accordingly.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/tee/optee/rpc.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index ebbbd42b0e3e..97fc5b14db0c 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -247,8 +247,8 @@ void optee_rpc_cmd_free_suppl(struct tee_context *ctx, struct tee_shm *shm)
>  	param.u.value.c = 0;
>  
>  	/*
> -	 * Match the tee_shm_get_from_id() in cmd_alloc_suppl() as secure
> -	 * world has released its reference.
> +	 * Match the tee_shm_get_from_id() in optee_rpc_cmd_alloc_suppl()
> +	 * as secure world has released its reference.
>  	 *
>  	 * It's better to do this before sending the request to supplicant
>  	 * as we'd like to let the process doing the initial allocation to
> 
