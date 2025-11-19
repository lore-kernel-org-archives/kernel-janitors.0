Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E236996C;
	Wed, 19 Nov 2025 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562305; cv=none; b=NDd5F+HGwihKPbCHcWBYpN7eLAfQs+fgwZrluN3FfeQKLbeam+30iSfOM/rc9T1QV4+lthHNlaJI7V9M1QzUoeQPYisq+0VzefHw0TREXnWmL6UtL3l3OB9MwyZCR27g2El5Y4PpobDknkLF8UpalHMIBPquCeeTO5jPUGWSRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562305; c=relaxed/simple;
	bh=/jqqddLT0jZalW6cMyQZJ/RK770r9kTQQS4ZSQWw5u8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ClWZYn5B7vf6MXCkX2mt8PGv3PJZmEaKu0EfB+jbIxUKOxm+LLEc/ccG5hQ7wwGR/yjasRcnvICoJXQh0DSRwzyPxri9SbfLx434JrcSMF1P4FI309eFI4eKTzdul7Ju0D7mdOLNBkXQLmLUV3PHixivllpFSIS7tS97laKVyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 429038967F;
	Wed, 19 Nov 2025 14:25:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 7D0688000F;
	Wed, 19 Nov 2025 14:24:58 +0000 (UTC)
Date: Wed, 19 Nov 2025 09:24:58 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] unwind: Fix signedness bug in unwind_deferred_request()
Message-ID: <20251119092418.7daaec1d@batman.local.home>
In-Reply-To: <aR17gxtrzOJnVNFq@stanley.mountain>
References: <aR17gxtrzOJnVNFq@stanley.mountain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7D0688000F
X-Stat-Signature: 7z9qjkfgx9gg599kcgp4mowmhe91gpxn
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+Z/1YUUiFBtegfgtRstriQTRR3Pu8yo/0=
X-HE-Tag: 1763562298-77926
X-HE-Meta: U2FsdGVkX19x82lEBB+Ifn0syMukLeIzacocueZRM25IY409HWnSUF568I5WMeNclo+lhDLTC05+p0jduPOCqpGE0M5D0sbzYq6YlAHfTdokKde1jxsgHTLgWvMPPvkU0OVfl70b0xSCkXiI6vkWCz1JIdtDdzcMmToevEA4g1TSS6ItIIG9B89I5lVdQJGFtkaFvJlyTwCX6/3BNhe5B/2hqdQStfsj29y/YTeknBzl6LKK9YD4Ewjoi23owqi1Jdnng0TgRaLJQe1VVed1+P/gOmvtPJtxiHvMExKrSHLFg3+2UCPnGEywdaqAuzlIdyejJivYPlEtEMd/QjwFHCQUIWTY2n31s8cTjs63ORteERAzGrtdqaBPXYj50Pii

On Wed, 19 Nov 2025 11:10:43 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> The "bit" value comes from "work->bit".  It is set to -1 if we cancel
> the work in unwind_deferred_cancel().  It needs to be signed because
> we check for negative values.  Change the type from unsigned long to int.
> 
> Fixes: 357eda2d7450 ("unwind deferred: Use SRCU unwind_deferred_task_work()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  kernel/unwind/deferred.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/unwind/deferred.c b/kernel/unwind/deferred.c
> index a88fb481c4a3..8dc11e0d9374 100644
> --- a/kernel/unwind/deferred.c
> +++ b/kernel/unwind/deferred.c
> @@ -232,8 +232,7 @@ int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
>  	struct unwind_task_info *info = &current->unwind_info;
>  	int twa_mode = TWA_RESUME;
>  	unsigned long old, bits;
> -	unsigned long bit;
> -	int ret;
> +	int bit, ret;

I'm fine with the change to bit, but please do not put them on the same
row. I only do that when the values are related. bit and ret are *not*
related.

Thanks,

-- Steve


>  
>  	*cookie = 0;
>  

