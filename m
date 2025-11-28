Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3392FCC04;
	Fri, 28 Nov 2025 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326948; cv=none; b=hsd08MI5HFBA8G5WCcAp3x5JGH1EEIfmxz5nVyL8YVQJ++BSKw+6ckdqR6/JQ5LGXkjg/W4wIlnF1TmDqdOxDhAI1r1a9sREKjPeA4kAirVCgXh8A38b8SZfV78mEza/lDWS43MecG04FB+khGj8Oj7s3tf2ch9r/XD5+y+C7r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326948; c=relaxed/simple;
	bh=bEGRwEiFX/t4GT7u5sLlLsvFzqwU4fXnKHzik+cI1/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S46P/dIGJyFNw9w89P5uYyjbrgE2C5IKH1Lbs54Cy8rfIK9EkS8MsV5ysYY3YbwT0s/I+FA76f3qC27R/7CGfITKL22s+WU4jjeZ6ndwxCzwrjgl7As7418neAWBXkYE6VxIs68YI0lFy7/nx07zqEyOf2ckOLFi41OXYoVIXKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGwEdDd0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGwEdDd0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB54C4CEF1;
	Fri, 28 Nov 2025 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764326948;
	bh=bEGRwEiFX/t4GT7u5sLlLsvFzqwU4fXnKHzik+cI1/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGwEdDd0icaWejTtjZmHFdAUiVxiwkTq8bihi2VYzrJrhHPZbY+25VVuzCEFQ7KpW
	 lhA9K+ZCTcGVk4EdfU9pcUaLcOjFLsINy9XeyPguE3sL6Fy0BmuAVhbAY4csRgkwSg
	 9hIkILrTlOjJFpzwZrgcKHn5hU3iPD0W1K4Bl02IPUqEw+OUnDnnjZGd57TaRqvNHi
	 HMSfv0ku3c3hq6+YiD+lPUMFGVJT7A+5WYxjqIjt4yZW1WKwPwZJlLUzL8F0wikw1t
	 vOQg1w9BB/PmmD0Qx1TeA4s6u/PovhzliVvsMu0bVIcmYiVDHC0JEPx9ahN1o4HOeH
	 ZyuXjGVfYoqfw==
Date: Fri, 28 Nov 2025 12:49:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] liveupdate: luo_file: don't use invalid list
 iterator
Message-ID: <aSl-HhDCCjax-XrF@kernel.org>
References: <aSlMc4SS09Re4_xn@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSlMc4SS09Re4_xn@stanley.mountain>

On Fri, Nov 28, 2025 at 10:17:07AM +0300, Dan Carpenter wrote:
> If we exit a list_for_each_entry() without hitting a break then the
> list iterator points to an offset from the list_head.  It's a
> non-NULL but invalid pointer and dereferencing it isn't allowed.
> 
> Introduce a new "found" variable to test instead.
> 
> Fixes: 3ee1d673194e ("liveupdate: luo_file: implement file systems callbacks")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202511280420.y9O4fyhX-lkp@intel.com/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> Presumably, this going to be folded into the original patch.  I just
> added the tags because they are harmless.
> 
>  kernel/liveupdate/luo_file.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index fca3806dae28..86b4d274d9aa 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -561,17 +561,20 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
>  {
>  	struct liveupdate_file_op_args args = {0};
>  	struct luo_file *luo_file;
> +	bool found = false;
>  	int err;
>  
>  	if (list_empty(&file_set->files_list))
>  		return -ENOENT;
>  
>  	list_for_each_entry(luo_file, &file_set->files_list, list) {
> -		if (luo_file->token == token)
> +		if (luo_file->token == token) {
> +			found = true;
>  			break;
> +		}
>  	}
>  
> -	if (luo_file->token != token)
> +	if (!found)
>  		return -ENOENT;
>  
>  	guard(mutex)(&luo_file->mutex);
> -- 
> 2.51.0
> 

-- 
Sincerely yours,
Mike.
