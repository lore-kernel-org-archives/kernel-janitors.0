Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC2E258CE5;
	Tue,  9 Dec 2025 23:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765323610; cv=none; b=ZPgCifqKc9BNQNwn1lY0Dph5PykHScDmdtxNDqhXPXuRKe+QKAj1G+C/wp06+PmArB9hb2gTe3Y8Dc3QDegCxZIt/csgyN8o6mS1cSCQxdyOA9VmnIedVgxjV7tFHnQoPEF3HiRFhmiOc5KHXkIYd6ZSa22Eu7LsFOnElbDOEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765323610; c=relaxed/simple;
	bh=9DXjuJejBfhymg/UaNf4GlHrinIJIPZ2pti9wXO5As8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNuq5n6g+gEuvXZmkgGKURwWSsYJTAOQauHr5gwgWvmaGGfaanoTcg3qTawHpKGcphTC2KoBE9ibaRBCEj7xV0xuvkwJtGuYZSSGFbKm38q2DNfI8qCWzpV0emJbILH2UCzO0SISqkxXUy2K9zMWfELJc2GiMYi61lpUBwPl2tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGjOTuYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGjOTuYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A3BC4CEF5;
	Tue,  9 Dec 2025 23:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765323610;
	bh=9DXjuJejBfhymg/UaNf4GlHrinIJIPZ2pti9wXO5As8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MGjOTuYZOvbRIwTvMtdylHlvaznL7DSID1qj0Cml10U4dDSOeAREZ/NSBptNpgrA2
	 WeNmFaCdpf1bNEisr1wdSWfrs9eelerKz+QZNyNbM3hKxhkaaHHaPJqmJ+7Zt1MjZH
	 9l1fTTucCuNPEWX715uviwlV0HPG4wrFFvrBN6UmvbU5Ny/oJIEMM6B9+79Qo8Pj66
	 sJh3gPiipZvRZNfZ4ja9qrNCRCDMDejnxYI4Caqfbtpfg+9yrS7jtx2BlMN/YVmdQy
	 z3OS8ZSCkP/y3+KdEBaqObKtySHP5F9o2PdUoqrA2MnM6gC2klsmIu5zJknYZmYsAx
	 5Wesgu+qnweMQ==
Message-ID: <0e9fbd34-9916-455c-b6c0-816837033325@kernel.org>
Date: Tue, 9 Dec 2025 17:40:03 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: stratix10-svc: Delete some stray tabs
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Mahesh Rao <mahesh.rao@altera.com>, Richard Gong <richard.gong@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aSBqcEl5y5fqF72v@stanley.mountain>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <aSBqcEl5y5fqF72v@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/21/25 07:34, Dan Carpenter wrote:
> These lines are indented one tab too far.  Delete the extra tabs
> for readability.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/firmware/stratix10-svc.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index b91f68d9ae98..59d9f588d9ee 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -1316,7 +1316,7 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
>   		dev_dbg(ctrl->dev,
>   			"Async message sent with transaction_id 0x%02x\n",
>   			handle->transaction_id);
> -			*handler = handle;
> +		*handler = handle;
>   		return 0;
>   	case INTEL_SIP_SMC_STATUS_BUSY:
>   		dev_warn(ctrl->dev, "Mailbox is busy, try after some time\n");
> @@ -1701,12 +1701,12 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
>   			kthread_run_on_cpu(svc_normal_to_secure_thread,
>   					   (void *)chan->ctrl,
>   					   cpu, "svc_smc_hvc_thread");
> -			if (IS_ERR(chan->ctrl->task)) {
> -				dev_err(chan->ctrl->dev,
> -					"failed to create svc_smc_hvc_thread\n");
> -				kfree(p_data);
> -				return -EINVAL;
> -			}
> +		if (IS_ERR(chan->ctrl->task)) {
> +			dev_err(chan->ctrl->dev,
> +				"failed to create svc_smc_hvc_thread\n");
> +			kfree(p_data);
> +			return -EINVAL;
> +		}
>   	}
>   
>   	pr_debug("%s: sent P-va=%p, P-com=%x, P-size=%u\n", __func__,

Applied!

Thanks,
Dinh

