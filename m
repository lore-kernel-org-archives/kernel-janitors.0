Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91AA197A7A
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216281; cv=none; b=GUEgYkEH1ykvZZwJkykI1IczTRCyUChlbSp9AnK9ykjYLQqwqP4GpBIza8vNDGnXadCE8mWVbOlmIfMT+M6RHxgCs2blm2jpmob/E3r7g4Kipns8AFEbuM80jLTL9vPt4Vpq7MHemwSb4jcaRSHZQurWmBntAlnLNR8dTnjj464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216281; c=relaxed/simple;
	bh=7qv5/5ztgjnBd8ABlrZklhWeB1+KbwrFTx+b/38oBVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJNB/7H+3kagP01k9JtGd715VGFKpqXbtyDLsUck3xcLFPqRvkHxljWeAJzS7grBWZFcPmhTiC9qfOMCNT093YCyXi9eKiiGgxmVD7V44m/C3u11rWMGe8FQH0X9PIVa5l1EYfCK4PnugDpX+4p4qc+F2K1efwGCp3BX7Ilttag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dumN3CSD; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dumN3CSD"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a61386so2843576a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 08:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723216276; x=1723821076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCnFjP8yeSTbgg04jO70aNmUrU3V0BlhkT72Qsh0eiU=;
        b=dumN3CSDg61IqILdGhI6uKDjeqWFaLYRztBAdAEylQiCpRw1EcT6viaBp6jKfpdM02
         NgHICBOHKDfikhPodtVd1qTDR7LCTUqBF3ah/YsBqRxLKXW7aUQbPxcs709ZYexdu0ae
         kzmxm6qNecQMCZZHq9J6vbJFSvxF1IwYPEKQ+i8QXVc8U9sxqh0ueyfnTFhRbn2byohl
         5xhIYLB7xsjdsgIn6I6DmvDHVLT5f6YG62m8imQYyZnXu8piG3tvRZWbod6cLdN8B9+y
         ba4SkJkxztKZZlqEdtd7UOiXuN5z0e38XK8XD7+TjpGKQjOKgW5pA+zDp8mibVTwQif7
         oftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723216276; x=1723821076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCnFjP8yeSTbgg04jO70aNmUrU3V0BlhkT72Qsh0eiU=;
        b=HGtMeasEeU3Bia9Eh9DHj4Oz3hML8wWvIsuDCH+YenaBj+9oXK8TF6AdpPrSCOJ3DV
         XXicxA9qOOY14kzQ+47vBwsf9y0HdUNslBLKf1dIl2YFucsJiZNO5I/LU5LiEUZxhmwp
         yNGQbVnBkdHsasMP1LQA3Bisok3eQjEh+Zp0m6qh/a7HyaWutkoKK/vGTbc5MJgtAvjz
         yeVlCD3i80pCbYOMd3jUbp/vHXySCAnxQwUkf7js7C8GPB052+5ox+83hvjpjpK3z7+3
         nnOM7rn1RkCN1xFawOE1bc+p/AXXzc/F3+LJbM2WEpuTEIu7hqkfiMIP10GNrrjR9ogY
         W+NA==
X-Forwarded-Encrypted: i=1; AJvYcCXSPXPjXjBTpzwmVhEoL/NfT3uFk1gM2+BNP9lKCDqsJD5bOFWCAqOHdRKdsbQP+QAVbZqJ4wNjarRkYE9PO/2QeNbmAOR/wS+F3QUiZDR2
X-Gm-Message-State: AOJu0YzWJPFfdCqIkwbWsOgsoO0zZgTio52YvXupzXK71uTF/OPD+STU
	iky+/iExcaYJoZxIotAwL5Fes4CFNr6HQWbdpLfSYD+BNsR8vcHYWy0l3pbjx0I=
X-Google-Smtp-Source: AGHT+IHM6/NyJG0fypeFEFHE1MSoC6qNiWwYqrml/FzF4jdvuVfqudW3tenaS4EdJbwoBirlwLdtnA==
X-Received: by 2002:a05:6402:348b:b0:5a2:4d19:4c08 with SMTP id 4fb4d7f45d1cf-5bd0a58a137mr1382401a12.11.1723216275896;
        Fri, 09 Aug 2024 08:11:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c1dbe4sm1590031a12.27.2024.08.09.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:11:15 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:11:11 +0300
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
Message-ID: <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain>
References: <20240808122331.342473-1-suhui@nfschina.com>
 <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>

On Fri, Aug 09, 2024 at 06:00:26PM +0300, Dan Carpenter wrote:
> On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > Clang static checker (scan-build) warning:
> > 	cifsglob.h:line 890, column 3
> > 	Access to field 'ops' results in a dereference of a null pointer.
> > 
> > Commit 519be989717c ("cifs: Add a tracepoint to track credits involved in
> > R/W requests") adds a check for 'rdata->server', and let clang throw this
> > warning about NULL dereference.
> > 
> > When 'rdata->credits.value != 0 && rdata->server == NULL' happens,
> > add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> > This will cause NULL dereference problem. Add a check for 'rdata->server'
> > to avoid NULL dereference.
> > 
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> 
> Needs a Fixes tag.
> 
> Also when you add a Fixes tag, then get_maintainer will add the David Howells
> automatically.  I've added him manually.
> 

Actually, David should have been CC'd but the fixes tag wouldn't have pointed
to his patch.

This is an inconsistent NULL checking warning.  It's not clear to me if the NULL
checks should be removed or more added.  If David were trying to fix a NULL
pointer dereference and accidentally left one unchecked dereference out then the
Fixes tag would point to his patch.  Since David was doing something unrelated
then we don't point to his patch.  Instead it would point to the first patch to
introduce the dereference.

regards,
dan carpenter

