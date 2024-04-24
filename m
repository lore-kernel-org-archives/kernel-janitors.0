Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63B0154BF4
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 05:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713938055; cv=none; b=MfDLGNL5A0baqScVYEI40KiB3/s584AGsyNLp3mOo38Maf5o/bj5LEQrhI1rhlLaqKL5hP//DF+kZ2k4XRivDAmVfkS6L5JBhvD5iRTenpZLrmv2cUP9jF9SDqEAQw3XNL5gywuKaJRFEi6B+76eldWLm+33fvn2MkzBwzKxPJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713938055; c=relaxed/simple;
	bh=8GCqrEZYtdL9iyU/wkrfGbyINGSWQcdRxW8/g63tUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2/KcGEpbc1yECgm1hnJVlakIdMJGCIFNheevV5vDPms0IeG+kP5K9DpQxiwhwxDrfcay2GLBBDUShK7cdYDg484msCM3DrKF/TMZLBtiTI5ZMGgqOZUbx5OwJupBlM5Pp1tnamV0r+UFFE611pbAxOq65PmzqpwRlvrrUawioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkuaOiAx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkuaOiAx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41aa2f6ff2dso15010235e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713938052; x=1714542852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BoSq6xCai+FLaIoay/b3hm+lCkx9rjx+ZUFol25m3gU=;
        b=bkuaOiAxH1KtxgIcFl1wIoQntjwsKKw36Kypdzb/27nnPn5wxj0Cmao709Y4Q5HLNK
         AJ/2Vye5Zs8DCAaN5ZrngJWFsPSpXpD3IRRaMzGazs4v7pm/SLJIGMhRejUXgXqeJw3q
         Cv1RDaCwCUZTsy76nSJNboiNfpZ0weDnIhsBGbp7omI9r8ExGlC5/davRkpaQW0b0Ksy
         BR5Dgkpcm5qGkDCJCqz2hlKV0+pfGUmSaaJAQOiZkPLq2gJ+vU5fvrQl2kBODpdzHp5d
         fYwRxA/W/diuaiI/FDLE7JWoZKPA0rgRuHDFE5RyLZXtDlIeBXrM3YK2joe8Wg6qJF6f
         /bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713938052; x=1714542852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoSq6xCai+FLaIoay/b3hm+lCkx9rjx+ZUFol25m3gU=;
        b=rRrRzXLGDlZvevXrNAVH3A3683YtWxN7jqhReRd9y/dePO66ORpAgE6Z8F0xGJ1Fsg
         gzfpLsrDYEKpjLQGjsQjGT1JlAlWxYjkO7oFRsHGOsPbt/WVemG9NyIm2IImFOSuEtrX
         FoWywSrwlw8FviaqLqssP7g53FknTaaRJfoHltHV9SbMwqsVMCSsvwIqS+HMF0wdxJN5
         rwRv197SVSqEh6WpCLwfPxzdFi7GirLJ2NNnE7CNavSCw9ujXRW/YgdLL2JHK5d+5FlS
         XlTfFToM3fxTCfGdsYZ28qMDPTWodlbVNJtwwK1yWUg+55gyKYQWxwWzpmOpRKRbrEH/
         eUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhCjtw1ABUNlsStz0KCRUESXQlVtQTGuDn7azwfpRaRG2Bw4q3qJXbiz7IGp7uSxYlBQXCkxG0ruXbAMR1ti5t9o1Gl5dn6twHBpXdjquS
X-Gm-Message-State: AOJu0Yw2e3f8H3WGBtUTgiv9HpxdtR5QE7jJnG+kbfHjsuuStkegmf/h
	OFLkk6XIO6Er61NJYm6ayPnrQjye/Wi/oBgNfiqShw6WhDFWUm0V80J2hkADyAs=
X-Google-Smtp-Source: AGHT+IHSoA4kuaa1pj84ZD/gkZiYcDWhAuzxgGc3Xu20mSyfhUb+ZD1UXptCBsBSyikGCveqvLeU7g==
X-Received: by 2002:a05:600c:19ca:b0:41a:141c:e199 with SMTP id u10-20020a05600c19ca00b0041a141ce199mr1063594wmq.8.1713938052064;
        Tue, 23 Apr 2024 22:54:12 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b004169836bf9asm26306085wmq.23.2024.04.23.22.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 22:54:11 -0700 (PDT)
Date: Wed, 24 Apr 2024 08:54:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heming Zhao <heming.zhao@suse.com>
Cc: Colin Ian King <colin.i.king@gmail.com>, Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	kernel-janitors@vger.kernel.org, ocfs2-devel@lists.linux.dev
Subject: Re: [PATCH][next] ocfs2: remove redundant assignment to variable
 status
Message-ID: <25bc03e3-1caf-43d6-9a9e-74f5c2093c06@moroto.mountain>
References: <20240423223018.1573213-1-colin.i.king@gmail.com>
 <8e22e6d4-4c62-4b78-9809-5648537af775@suse.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e22e6d4-4c62-4b78-9809-5648537af775@suse.com>

On Wed, Apr 24, 2024 at 09:40:33AM +0800, Heming Zhao wrote:
> On 4/24/24 06:30, Colin Ian King wrote:
> > Variable status is being assigned and error code that is never read, it is
> > being assigned inside of a do-while loop. The assignment is redundant and
> > can be removed.
> > 
> > Cleans up clang scan build warning:
> > fs/ocfs2/dlm/dlmdomain.c:1530:2: warning: Value stored to 'status' is never
> > read [deadcode.DeadStores]
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   fs/ocfs2/dlm/dlmdomain.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/fs/ocfs2/dlm/dlmdomain.c b/fs/ocfs2/dlm/dlmdomain.c
> > index 2e0a2f338282..2018501b2249 100644
> > --- a/fs/ocfs2/dlm/dlmdomain.c
> > +++ b/fs/ocfs2/dlm/dlmdomain.c
> > @@ -1527,7 +1527,6 @@ static void dlm_send_join_asserts(struct dlm_ctxt *dlm,
> >   {
> >   	int status, node, live;
> > -	status = 0;
> >   	node = -1;
> >   	while ((node = find_next_bit(node_map, O2NM_MAX_NODES,
> >   				     node + 1)) < O2NM_MAX_NODES) {
> 
> This mail cc linux-kernel@vger.kernel.org, it would be better to only
> cc ocfs2-devel next time.

I used to tell people that, but Linus Torvalds disagreed with me.  I
also used to filter LKML from my own patches but then I ran into the
issue where a couple subsystems use LKML as a source for patchwork and
they get annoyed when it's not on the CC list.  In one of the threads
for last year's kernel summit people said you should just use
get_maintainer.pl and keep LKML on the CC list.  So I think that is the
rule now.

Except for maybe in networking.  I still edit the CC lists there.

regards,
dan carpenter

