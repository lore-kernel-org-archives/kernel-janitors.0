Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1E1FE45A
	for <kernel-janitors@vger.kernel.org>; Sat, 17 Jan 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768659039; cv=none; b=pahUOifUaFXSc0mOIuocCg2issaUVVwWofOmWkGWvOjrxOvr/gYWwC3wLWR95U3iZZ7btj44l84eU2FTaviYIeeeHLuQY32NdUUL22SZ3CdcdQtF++HJ9pCx5qT5qq2fLQoXbRb0XhT2tsQVVGaUnGEl+gkx5rG9Mj6re9itb3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768659039; c=relaxed/simple;
	bh=CA+7J/RR0nTc9It1XerSFp5SJbWoyky7hYTlZfMsQeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QhvCDvT0WrG61ljr1MEZ9HW4baHUaAlEF86P1NbgWbQRNGsHI7VymADr9ubKOQXcvbjtfrkiY415DHsRepmfx1kDL2TXGFTXUmwEZlKgKBCYX4SYYWpP6O36m2mhE14+IZf9w5I87Yb+oaTXd2wZxGC973HBpdGWfrhsi+lZDPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTkbCRhc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTkbCRhc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801bc32725so13584415e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 17 Jan 2026 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768659036; x=1769263836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiKlHj+3mIbgnx+R2A3g/i2Ls37g5s26/ZzzGkqA/rc=;
        b=cTkbCRhcSF7lU5JLMOi1QwuWC4OSZ0MUzUbvfv3SFzkLbOh3ROa+AdH7O2mPPcJc8h
         Vk+BEUuGASte9uo9VmERE2KYKte8Jn3AP/KEItaBqBSt1FVe2Wdt7YJop7ur9k2BjA6Y
         mMSAWNcq2z92QMUdbvi80NHARQ7cVc9wSLauJ4zGrlhJ4w1BR5tGRxsvOsrmrhzmgvnQ
         tV1ISnyHiteBKslCvxmvcubA2t/9qtY4MjcrgFxCQUxBaBrAOhyhnB4AaKoBDnHjFx5D
         HX6PydgntHzyLWL+pT0FlbiH/+GwTxcdYqX/jlrnnBTwUdlkCcpgKyPGfCfiasXmoFpO
         dlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768659036; x=1769263836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UiKlHj+3mIbgnx+R2A3g/i2Ls37g5s26/ZzzGkqA/rc=;
        b=YIWy0s6ZHLbWr16V0PW5GVO1VTLzEvy2J6zmujbK7QeaI082E7agFqz2bNCjBd8vDR
         zRXGe2SnOPyzs+N/lHNJEzGuUoIF6zGgJXRhU3TCj8T4E+eYvJl0WeGg98HJ3y+7Syu8
         jxy1UvlV+Y2BTgeEIRE7VCsdCk7YGzUiWkbnqn0rZ5zydmtHZBtuYu5Xq/sG5tpNsYDY
         O05zF9JZX6MbUDFkCmJainvu7oVi7qKRSpDTV6W0GHjzZgkpuiW0Y+XnOHxAIc1Bip13
         X5eWXYNo4AweyUiNxCSIWuR9sOqMPr/dL+Y8vYDoIgkJfn5ho4j+Rpve35tKrqJvP/m2
         TZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2W2G6i7RPBRr9oyfztHD6UGPxF63W3+4yWht+8c2CRgfn+U+XJiRzp2PHfTfGRbhtYcu6at5KOC8d8burfJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz98QDjDC3bmE4avPyoOaWe5EmxrrGB6ndRHk8dM6HDrs/0T1fk
	iTONcpzVtzp2mTf6Z2Nsrcl1tV2gf/H1D1anPrWp2otGbTpWPnj1+B3k
X-Gm-Gg: AY/fxX6LaevEkPmdWHokAflQu5Ut19IvlPR4TkWNeM8LC1IuD4wS37/tQGrRswo4K3X
	1gMQevuZKZ1VKzjkKIAZ97xqAOY28Fl1AvkOMq6urn93fDPojwy/R5Q2PBCCwjHaCK9XroTSW9E
	CrQECFQjeo5q5fCxGNA8kF6BUIjwUhNg7plo78zwkZZCYu7ztakzFfNHLyCktGP06o/GeOy88TQ
	inhbVhaOhSFhX4RXruNkLlBIuHlqCsO9y8aMbRmS9gm/pLSGdt5WKaDakQ70JGrJfeb69ar+zA/
	85hL5Ii/nzWk79Jah4A2trzK45x+AazOVt0fqweNcTZjFw58MmWnLzwJHx5iU2kQ4JkudcIiXjC
	vCIoY2Yl9fQpCiJvRCN8GtKNU/yk386WXVHPqoX2cuFgNAkTOPeCePXnIekCAa3Qr+BHBkL5fp0
	gbIIzFv6TZ+oB7AfMDbnDLwhiAkvNYvfbMJS/O0Uz2GAJ5T4fHlYSE
X-Received: by 2002:a05:600c:6489:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-4801eac331bmr68009345e9.13.1768659035967;
        Sat, 17 Jan 2026 06:10:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fd458aesm42726695e9.2.2026.01.17.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 06:10:35 -0800 (PST)
Date: Sat, 17 Jan 2026 14:10:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Colin Ian King <coking@nvidia.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
 <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] optee: make read-only array attr static const
Message-ID: <20260117141031.1514faf2@pumpkin>
In-Reply-To: <20260109154442.421248-1-coking@nvidia.com>
References: <20260109154442.421248-1-coking@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Jan 2026 15:44:42 +0000
Colin Ian King <coking@nvidia.com> wrote:

> Don't populate the read-only array attr on the stack at run
> time, instead make it static const.

For a 4 byte array initialising on stack is likely to generate faster code.
In particular it avoid a very likely data-cache miss for the rodata.
The on-stack array access might even shorter code than accessing a global
array on some architectures.
The compiler might, of course, decide to unroll the loop and not instantiate
the array at all (in either case).
Indeed, just unrolling the loop as:
	if (params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT) goto bad;
	if (params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT) goto bad;
	if (params[2].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT) goto bad;
	if (params[3].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT) goto bad;
is likely to be pretty near optimal.
(Collecting the bytes and doing a single 32bit compare may be better.)

Of course this won't be a massively hot path - so the code choice won't
make a measurable difference.

	David


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

