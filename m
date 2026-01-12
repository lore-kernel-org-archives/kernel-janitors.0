Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D630FC10;
	Mon, 12 Jan 2026 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217175; cv=none; b=iug0SVLXpPRNG1HkyiqE+Ky5DysKK1KdtOhqKXfD8ejpMoUwsij1BVr3dMdmfbgBDLBo5BLORbtVBA2/jdqfmDtGTiQlCIKrZsLSqMVRb9R9/PY4XZWvaARmwUkTBos8nQvkuWO9I6yhYtXBJP8dkBTaopbIwfBmi9ohGAtC88Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217175; c=relaxed/simple;
	bh=8VF91cn6n+Hdw0u+8yUozg+3jgNGOkOZI/CN7HHlD9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGV59PQleLrtRgCITRXv/SM/d4sckDFBAc7kFUMxbRK2R5dqruYmD87cA8evhivDg7fj1J73qISVfXPRcfQXJZLVKnFW0Re7Z//kMQYlnLOxaDUWEU3kFWLqtKdby2rGXm01uDFLWc3MbJQqP+JPv4vqqhQJLfoSzMPoipR8vFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJhb1NNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJhb1NNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A343C16AAE;
	Mon, 12 Jan 2026 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768217175;
	bh=8VF91cn6n+Hdw0u+8yUozg+3jgNGOkOZI/CN7HHlD9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJhb1NNqkMBjxDwhoqrSnqvpl6qCkOEWLlTqQd6yPzQjxDlv3jquNHTY2Z6TJ3g1e
	 TFKeL36ssN92pqywC/2aXh40DW/TVoiRJR/Ixu3qushWalgbehyyT1J+YTTo/veeEY
	 tDyDiSXPTAvGT+4jxY0LVE0sroRq2EdnzBp91vhMl9g6yXHX8AJKwGMKw0gCgZOTqD
	 ZujtXi2Yb9tERaYYY0z5ZZt0LUmWUfMF02f6uzGNjv8fLDiQ7XgNtonfeQBn6jJjDG
	 DdtotWEFcuvc3z1eF/rvmn9ZfZL988/UdIeM3r1CK0LzhqPtWxBjU6fIC6kCuqNCwE
	 F9QOn3hySUPjg==
Date: Mon, 12 Jan 2026 16:56:10 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Colin Ian King <coking@nvidia.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	op-tee@lists.trustedfirmware.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] optee: make read-only array attr static const
Message-ID: <aWTaUvGu9dlvnJO9@sumit-xelite>
References: <20260109154442.421248-1-coking@nvidia.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109154442.421248-1-coking@nvidia.com>

On Fri, Jan 09, 2026 at 03:44:42PM +0000, Colin Ian King wrote:
> Don't populate the read-only array attr on the stack at run
> time, instead make it static const.

Is there any value add to do this? AFAIK, the static local variables
aren't preffered.

-Sumit

> 
> Signed-off-by: Colin Ian King <coking@nvidia.com>
> ---
>  drivers/tee/optee/rpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index 97fc5b14db0c..1758eb7e6e8b 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -43,7 +43,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
>  	struct i2c_msg msg = { };
>  	size_t i;
>  	int ret = -EOPNOTSUPP;
> -	u8 attr[] = {
> +	static const u8 attr[] = {
>  		TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
>  		TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
>  		TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> -- 
> 2.51.0
> 
