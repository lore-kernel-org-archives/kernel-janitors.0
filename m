Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0313CA96
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712818720; cv=none; b=d69N27q1o5XC7vCm8FW7Nrsy+uWZEBF0wQDs0RfuDjhbgHnzGUcZkkNYnMlE8uoNXXFCGSwzCvgmZRQYGXnIFavqulfDgHY0rwSeUP7qywV2WitlDShOawi59tB8Svrg43eQx7Sf3YXhAiqseG3NbBDyVH+0Bfj3mmYS3NJ0A90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712818720; c=relaxed/simple;
	bh=q895xwfKspqxfafp/g1RVbPZRAS17rrirl0p5xi4SKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swUBweZbJCgnNhsbNpLUqSevXj6vE/Eso8J3Ifi3xD+oVxAiuv7F/NgnhTotvVk/geQ0DOT4eRyYQcyrLvTJqy6g+wO2oJUKrCpMqesTlmW3/13Hp94U1atvfjWwE69CEHMHzQIT2zrssX3HHAM037LdotZSd+1C4+S4g4RKw1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gkCac0u7; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gkCac0u7"
Date: Thu, 11 Apr 2024 02:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712818715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya04erhgLsTLGZQ/2G7MTLQyzFsPBEoI90yJgKzdjKs=;
	b=gkCac0u71FyvdUvE2LJ9kO+GVR6IahtQgD3rKwS6ph62s4nKPsmM3FBXLMrLEeVl8N0EP2
	YMRR8zaktDjRCVnrcuXksqmtVqxSqFAwNX66dNtg3kKkGPYxWfkPZbHqVBHYeOX/6Qt1f7
	XoIeMW10SvxBcA8HhpLPuPQ2YPKWXi4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: improve entries in CODE TAGGING and MEMORY
 ALLOCATION PROFILING
Message-ID: <mya4xkisx6bah3dl7znb3uymtpwmqt5mesydr4q2icz2xcyrb3@kx7h4tqdzep5>
References: <20240411064717.51140-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411064717.51140-1-lukas.bulwahn@redhat.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 11, 2024 at 08:47:17AM +0200, Lukas Bulwahn wrote:
> Commit 5acf2502db99 ("MAINTAINERS: add entries for code tagging and memory
> allocation profiling") adds the two new sections CODE TAGGING and MEMORY
> ALLOCATION PROFILING. The files in these sections however do not match
> with the files added in the corresponding patch series.
> 
> Improve the two entries to refer to all files added with that series and
> drop the entries to non-existing files.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>

> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2d913c64704..e5431f06ab55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5332,6 +5332,7 @@ CODE TAGGING
>  M:	Suren Baghdasaryan <surenb@google.com>
>  M:	Kent Overstreet <kent.overstreet@linux.dev>
>  S:	Maintained
> +F:	include/asm-generic/codetag.lds.h
>  F:	include/linux/codetag.h
>  F:	lib/codetag.c
>  
> @@ -14241,10 +14242,10 @@ M:	Suren Baghdasaryan <surenb@google.com>
>  M:	Kent Overstreet <kent.overstreet@linux.dev>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> +F:	Documentation/mm/allocation-profiling.rst
>  F:	include/linux/alloc_tag.h
> -F:	include/linux/codetag_ctx.h
> +F:	include/linux/pgalloc_tag.h
>  F:	lib/alloc_tag.c
> -F:	lib/pgalloc_tag.c
>  
>  MEMORY CONTROLLER DRIVERS
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
> -- 
> 2.44.0
> 
