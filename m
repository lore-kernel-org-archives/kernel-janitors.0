Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA38198822
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215635; cv=none; b=VzsOiUdix0C0nR1VlmFv6kr1XrLgbmjeE9YmcbtD524xH/N0CP4sG/TywLAAa3qE85oq0vwrwjXqI8ohdUCUd1FKKUqfr82FXIIoCQoAffiuxRdeS+O6I3hatVSM/O9cKrUJcZBmTPSnwDYnYNzNXr42z6+NtBbGSXMkd9ym+kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215635; c=relaxed/simple;
	bh=dawj/tBNKTzYnHcU/KDys36vwXq748o8gOQyRKuQV4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IytObKhDp1X89hy7891RsZlIYzPsY35p1y0ee5ZIy1SbK6izZl0UHHrHsSa8Dwp++A0MCpNzy8YfDFgerv8xQqD+4Zvan33xRIIdam2PUdy6oRNlDRCx9ji1rLp57XxW7ST986l8uCQilWQ8W6Fwv0TwlAgb4nqXVkDH+30rhV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pu6jsVFx; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pu6jsVFx"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso2374904a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723215632; x=1723820432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H0rn7UZ3HG/DD0FX2FGCBFvCYFqEktL4MovS3L/vtSM=;
        b=pu6jsVFxeu9KHsfCJ0Bb4BP1fBJoncgmFgHbvZM9htHbwGrgalwHtfMZ5z8dtJ8tLz
         2dg03SMNiXWLyOqeL7MgrOaca7zj+stUs2ZHgQbz3M8TMJx/kAgKVXjpY905D5CSqDCI
         CfVNF44RByA2FFI9srO+1iGac47Pff0Ly6e+CPwyJpnaJ3QrUWH3cGglfEXvVXtREY41
         ceFoqBXRkmP4EqhoBHl6lutSbP6YTGmzh8yHr5wTqzLqcRhhOgvRctitUN3SmbM2D6NX
         UKilkjLbU42L2Vx+dNvAtfR1TzWJw8kun0pGwwIenf2kmb8qP5FX7pxanLFKzoJ1UAwR
         tiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723215632; x=1723820432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0rn7UZ3HG/DD0FX2FGCBFvCYFqEktL4MovS3L/vtSM=;
        b=FK+4c3DsYCVQ3dSW6fY7Dt06myfL8Hu7fP7RkKqsHEiDpyysOEvCPOLdAnvk+svNGi
         w3PEUCGR82FuzoPi+BSiy+8k5oJOkN7X1bum8Zb/S3ZmfumOSct71pTNcpzMnRRwcDWp
         BTpVDK/sIQvPn26bkN6yCFlejOkG6IkiZ57RVDNXFWLdw/h/K1fynUZcm9g5z/ycBN6H
         0hb8uUGwbV6GtgRFUkKeH0p9d6eEDHe9zVWR1EBYxMVxlLQsG/GsQJXEPhpOwTi8Mo2/
         dXeyjEJ/j5oNvtwngxsBmbOIRIjdiTylerxCvz5hsIu9JAFyR5KcIORYG3d+Deq8Opho
         YGbg==
X-Forwarded-Encrypted: i=1; AJvYcCVirex8xAako2zG/GUCrv8yD8UQQ42dvgV63C2obO9/9oiBKN6oV57y3IADuhbQoMBZCLfrD/KRUhkp3HJ98pnWoE4speAVoFasSqPEzBy+
X-Gm-Message-State: AOJu0YxEYI6GQz6etVaAL7fEmUnuzHSib7e0VSar7bKGe6Vz8mqW5EsO
	wfqHJw1J9Sx+4k19B4+oFb6fQGcoxgs+6QSZALN2EaT0RBkQmYOXmzF8z9AQLnY=
X-Google-Smtp-Source: AGHT+IGimyb61sKhw+mRuQVbC3bE2Obmy5HP7cvL4gIjsSjX8fXY+fkEjJOzQlmt3WtZxu0/FhFwCQ==
X-Received: by 2002:a17:907:c7e2:b0:a7a:1d35:4106 with SMTP id a640c23a62f3a-a80aa557a83mr159871766b.5.1723215631262;
        Fri, 09 Aug 2024 08:00:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c6esm866125566b.15.2024.08.09.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:00:30 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:00:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>, David Howells <dhowells@redhat.com>
Cc: sfrench@samba.org, pc@manguebit.com, ronniesahlberg@gmail.com,
	sprasad@microsoft.com, tom@talpey.com, bharathsm@microsoft.com,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in
 cifs_free_subrequest()
Message-ID: <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
References: <20240808122331.342473-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808122331.342473-1-suhui@nfschina.com>

On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> Clang static checker (scan-build) warning:
> 	cifsglob.h:line 890, column 3
> 	Access to field 'ops' results in a dereference of a null pointer.
> 
> Commit 519be989717c ("cifs: Add a tracepoint to track credits involved in
> R/W requests") adds a check for 'rdata->server', and let clang throw this
> warning about NULL dereference.
> 
> When 'rdata->credits.value != 0 && rdata->server == NULL' happens,
> add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> This will cause NULL dereference problem. Add a check for 'rdata->server'
> to avoid NULL dereference.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>

Needs a Fixes tag.

Also when you add a Fixes tag, then get_maintainer will add the David Howells
automatically.  I've added him manually.

> ---
>  fs/smb/client/file.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index b2405dd4d4d4..45459af5044d 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -315,7 +315,7 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
>  #endif
>  	}
>  
> -	if (rdata->credits.value != 0)
> +	if (rdata->credits.value != 0) {
>  		trace_smb3_rw_credits(rdata->rreq->debug_id,
>  				      rdata->subreq.debug_index,
>  				      rdata->credits.value,
> @@ -323,8 +323,12 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
>  				      rdata->server ? rdata->server->in_flight : 0,
>  				      -rdata->credits.value,
>  				      cifs_trace_rw_credits_free_subreq);
> +		if (rdata->server)
> +			add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
> +		else
> +			rdata->credits.value = 0;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^
Why do this?

regards,
dan carpenter

