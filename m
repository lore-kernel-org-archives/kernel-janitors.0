Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06AE17B505
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466771; cv=none; b=Kpp8VlADkiCw7RchQlxyMQrI//PeF4BQ6XjR1Wb24ncdKBpKSmwsZvVjjcp/z1n+LIzi+Z/6YPLvjgscGxEOHcJs2yRK7brOpFleEY4bkw4pbZ6tQYe39LPc40b5LSwX+K6O3kX5Q49Et642VU3wIh8Uq/+n4QZrtqz51ghSCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466771; c=relaxed/simple;
	bh=b/y09YHavkqM6IvK7Q7CY4hdPzCfffVt4tKff0uiNjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUkiGRZwzG4nDw3UK4RV9ilvB5sIMNU37d+HsMdxfcc+MAmZtrJnfmtFmLN6hfM5z4ky8+JveMTGgwoXrm0h4nxd3nesUG7jJ9+J8sysO/RtGcI8QLpDcBjJ8bQom/cmF2YCDArCDVL03Guku1V9Kgtr+DnNchorrmFYKFBPjxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PTpTpfxD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PTpTpfxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723466767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wKDtWb6RxLCMwAwdf51Z/WY8vKRIwoyi9gdOkFeKbfA=;
	b=PTpTpfxDs+ZswH8V3r8InavHmslL3O4K/hwRqbwsZoUV9QlZjEidNfZF8eFwC9JIMclaN0
	WVdD8CMotnrFb6xoE11E+7cWOBxdWBxAJSfcUoFlIlN/ftBAHkqd1DY2iXOfMHR2ETkbHN
	pXIluglXuxDc9djmzaLYzxL0BOelk8g=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-dDBCF8nhPw-oOgt18glHEw-1; Mon,
 12 Aug 2024 08:46:02 -0400
X-MC-Unique: dDBCF8nhPw-oOgt18glHEw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62EEA1918147;
	Mon, 12 Aug 2024 12:46:01 +0000 (UTC)
Received: from localhost (unknown [10.22.8.16])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6A54819560AA;
	Mon, 12 Aug 2024 12:46:00 +0000 (UTC)
Date: Mon, 12 Aug 2024 09:45:58 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Kacur <jkacur@redhat.com>,
	Clark Williams <williams@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtla/osnoise: prevent NULL dereference in error handling
Message-ID: <ZroEBi-yAGy8ogJ3@uudg.org>
References: <f964ed1f-64d2-4fde-ad3e-708331f8f358@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f964ed1f-64d2-4fde-ad3e-708331f8f358@stanley.mountain>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Fri, Aug 09, 2024 at 03:34:30PM +0300, Dan Carpenter wrote:
> If the "tool->data" allocation fails then there is no need to call
> osnoise_free_top() and, in fact, doing so will lead to a NULL dereference.
> 
> Fixes: 1eceb2fc2ca5 ("rtla/osnoise: Add osnoise top mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  tools/tracing/rtla/src/osnoise_top.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Looks good to me.

Reviewed-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>


> 
> diff --git a/tools/tracing/rtla/src/osnoise_top.c b/tools/tracing/rtla/src/osnoise_top.c
> index f594a44df840..2f756628613d 100644
> --- a/tools/tracing/rtla/src/osnoise_top.c
> +++ b/tools/tracing/rtla/src/osnoise_top.c
> @@ -651,8 +651,10 @@ struct osnoise_tool *osnoise_init_top(struct osnoise_top_params *params)
>  		return NULL;
>  
>  	tool->data = osnoise_alloc_top(nr_cpus);
> -	if (!tool->data)
> -		goto out_err;
> +	if (!tool->data) {
> +		osnoise_destroy_tool(tool);
> +		return NULL;
> +	}
>  
>  	tool->params = params;
>  
> @@ -660,11 +662,6 @@ struct osnoise_tool *osnoise_init_top(struct osnoise_top_params *params)
>  				   osnoise_top_handler, NULL);
>  
>  	return tool;
> -
> -out_err:
> -	osnoise_free_top(tool->data);
> -	osnoise_destroy_tool(tool);
> -	return NULL;
>  }
>  
>  static int stop_tracing;
> -- 
> 2.43.0
> 
> 
---end quoted text---

