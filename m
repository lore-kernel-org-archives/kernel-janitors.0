Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C99C257825;
	Mon, 25 May 2026 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693947; cv=none; b=i+vxSrPEdCnbw2XxMdllAEOxn4E5ZPM3CyCAInxJi5P0xoHovSoUIrhRW3hb+p+9TcNsRNNwXiC2LbW2BlU2TrStxhf7umR2aupoUzPCaZyZyCLj8DHeTFt1fi90QKXuEUXFp5OQJmOTSVyslKKcha79arNh0as+SKF64XGaJGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693947; c=relaxed/simple;
	bh=p/WBw4ZtiYJdfAWpVnnvpD2JchFuoyR/8fyPN2vfvvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDfCrJzyYB26NJ9YrLQDHw54ZvI4mAJcNrzEXHgtxlbkOJ84BrpN623AhDiiKgV/Dake62NiaXE6UwoHF3hQMr9w3o9701aRosM5K1u/acpANfVKIaoNmZKG0dGKgATEmqTNgBsIZyaWI8Y6Pm6oWvuJvUIynHHo/lcVwz17G4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8Y4jzd+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8Y4jzd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779693945; x=1811229945;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p/WBw4ZtiYJdfAWpVnnvpD2JchFuoyR/8fyPN2vfvvw=;
  b=E8Y4jzd+UfJfCNSAV1mogtE5pUXduCD3Ms7bF+ga48hR4ivhVWG+Or5c
   DarqWmZzKwPLbN//+MKDP0GizYHzIvVwXNXaX1IUsUKzolt6KQAKnYPsi
   mGaPGHba9g37XDwb1jV+LVx5MohDs+xqG6JZdFWyIja7s2w01/sAaWm2g
   JFfhXNFFHPz6a1kL1CzPOSq3OzHVZCYQ3uzpnjQft7L58Im9wHzT2dyeR
   9FX9T60H6y3gaG4OWL7ZZfqjQVT1mfLn8pVRT8qqy87j6tBDosJqbq5lo
   LufUbxAzhckmD54Qz89jlBn3tH4Zz8+0gF8Uyz2ZE/3FLLuRdlThlL8mz
   g==;
X-CSE-ConnectionGUID: MjLxaSUhSs2F410s521FMQ==
X-CSE-MsgGUID: 3lV76hxoQV2PoLvHdiMGOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80496028"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80496028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 00:25:44 -0700
X-CSE-ConnectionGUID: Ju3bcPuDQEqmKL7QWAQOdg==
X-CSE-MsgGUID: sGF33ASrRuGpEqqICiX91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="245803354"
Received: from unknown (HELO [10.217.180.37]) ([10.217.180.37])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 00:25:42 -0700
Message-ID: <9a6b239c-d970-4ec3-abf0-6b900b786279@linux.intel.com>
Date: Mon, 25 May 2026 09:25:38 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: prevent uninitialized data bug in debugfs
To: Dan Carpenter <error27@gmail.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <ahP24m6Mii9EDL7Q@stanley.mountain>
Content-Language: en-US
From: "Wachowski, Karol" <karol.wachowski@linux.intel.com>
In-Reply-To: <ahP24m6Mii9EDL7Q@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-May-26 9:14, Dan Carpenter wrote:
> The simple_write_to_buffer() will only initialize data starting from
> the *pos offset so if it's non-zero then the first part of the buffer
> uninitialized.  Really, if *pos is non-zero then this code won't work
> so just check for that at the start of the function.
> 
> Fixes: 320323d2e545 ("accel/ivpu: Add debugfs interface for setting HWS priority bands")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   drivers/accel/ivpu/ivpu_debugfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index 189dbe94cf14..dc20bc73c6ed 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -450,7 +450,7 @@ priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t
>   	u32 band;
>   	int ret;
>   
> -	if (size >= sizeof(buf))
> +	if (*pos != 0 || size >= sizeof(buf))
>   		return -EINVAL;
>   
>   	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, user_buf, size);

Thanks for submission.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
