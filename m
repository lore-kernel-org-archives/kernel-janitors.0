Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5936143C69
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Nov 2024 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731786218; cv=none; b=TSQYLH4wR9JZ8KRyWlM5H4Sxkg1ljgUVVvn+9tMEsOQeNMXN6EddaF6N6cU/76DTRgrQIKqSVUdjHrPFpdw4XKWGZIc2PJW5bNdCY4ITHcE4wmQvD0BXtqVXxE5v0Ow9Z7sGzbD/oR4cO0B+y4souFHRBm/tgD81mEQKCfh4BYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731786218; c=relaxed/simple;
	bh=j3zL2uOjURMUfpuZqmhPebgvt2fHqgYsvifvJim/nJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVo/sqo33BMYDQXx3FDbpe2KrJs77ejDOLoMz035AVbgC+q8ydPOg4Agd8VQs+v0nR+//QbBgmNgWfeJhAbin3DqI7qzfbQ6mHGkpzaIBSMaoQFE/033BVogrjGxEjNx3KvWj7AYBGNP98EjjUT7QQOhAMz2rAhWpMg/FxUCk9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuMVunzL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuMVunzL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-432d86a3085so7037285e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Nov 2024 11:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731786215; x=1732391015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTPeajvMBYZ2QPOXbwD5O/r30Apkxp3bw8AiN7JRujU=;
        b=RuMVunzL7ekYR8mmt2SV5Orm4B9CwHf+FYMCYhCJyR4f2iE95YpJNVX4N7dlSX9CZh
         Yo8kY4QGV84TlyX83yrvNrolHTpn37wqYgAw204WLX6yk6Xa+M0XquYR0khfgzOVeh4n
         wMy7Lp/sE1AgxG5LXyWltYKpU2krKoP2PABA4fSVCEJHJ3ypHPfH6/pvDfR1k0BNiN25
         UExPAYtTxfLXqWJYq3Z3Aeejm2EUBxxo3OhAnjZ9m5tyUkN799wEkLT4EwW2aZ2eFlTm
         hEgC5Rn5tLjz1HPP6xqxFUG0NEQMMu4RYoHfQIWFWS0dj50ErGydaGjJxdTB8bJnMx+o
         YNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731786215; x=1732391015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTPeajvMBYZ2QPOXbwD5O/r30Apkxp3bw8AiN7JRujU=;
        b=XyeyHQq2xiUrkWWknZD3LyS3XN+9zp7JNkM5guUJICeRLGZmne9D7Z0S3e73/1IL10
         dM8/WHMAFtkqUqDtWpWCzRLorxSBT8Gu/tl+g7yhtlXKpY5vYRbWNIDXIWzo2Q0MDUoV
         Wjiz8RePbcSgoeJNlPG5bKaFpv1PMxcmvuJAX64CB1x7tq24MATQEOBDrqgOdebUdmGe
         UfRa8qKl9RBJTkit8dkXWzNFuMRUprwGbaXyYZiSMwpM5GN0pVxvBIaMaGVbB86kcePo
         U1oWDC6zbdsxQ3dcjWmv6THk7NrM8SILh9MyyuCDopQ4toMxR0kK/DzrryuYxbllQsb4
         Pqrg==
X-Gm-Message-State: AOJu0YzsuDbJmUM2tLSTX6RZC2LDn2CkqHb97QQakE65ak2AtjMVSDQU
	W//YE3o/xyr2QFL+suKXElIgwXWhh6/GER9zZAD2BnCoyeV9YkiKwZiUft7Ego6T0xqjWwwWEJQ
	E
X-Google-Smtp-Source: AGHT+IFTpKS7/rKC/pgkNE4DrnfGWA5hgpvx3/fM8SF9/BGazuYsyeYBj1MonXLTJqN5oyMtxqAndQ==
X-Received: by 2002:a05:600c:1c23:b0:430:5846:7582 with SMTP id 5b1f17b1804b1-432df72069amr56596915e9.7.1731786214670;
        Sat, 16 Nov 2024 11:43:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38229b6e2fasm4427073f8f.40.2024.11.16.11.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 11:43:34 -0800 (PST)
Date: Sat, 16 Nov 2024 22:43:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: RFC: chasing all idr_remove() misses
Message-ID: <304a9635-9bb0-4dbe-94c9-135f43dd8217@stanley.mountain>
References: <97f3b17f-2e92-4cb7-8ee5-3a76969fb2cf@orange.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f3b17f-2e92-4cb7-8ee5-3a76969fb2cf@orange.com>

Matthew Wilcox maintains IDR so it's really up to him.  I don't think adding
a WARN_ON_ONCE() in idr_remove() for NULL returns is a bad idea but we could
hide it behind a #if DEBUG_IDR or something and try run syzkaller on it first.

regards,
dan carpenter

On Sat, Nov 16, 2024 at 06:45:37PM +0100, Alexandre Ferrieux wrote:
> Hi,
> 
> In the recent fix of u32's IDR leaks:
> 
>   73af53d82076 net: sched: cls_u32: Fix u32's systematic failure to free IDR
>                entries for hnodes.
> 
> ... one side remark is that the problem went unnoticed for 7 years due to the
> NULL result from idr_remove() being ignored at this call site.
> 
> Now, a cursory grep over the whole Linux tree shows 306 out of 386 call sites
> (excluding those hidden in macros, if any) don't bother to extract the value
> returned by idr_remove().
> 
> Indeed, a failed IDR removal is "mostly harmless" since IDs are not pointers so
> the mismatch is detectable (and is detected, returning NULL). However, in racy
> situations you may end up killing an innocent fresh entry, which may really
> break things a bit later. And in all cases, a true bug is the root cause.
> 
> So, unless we have reasons to think cls_u32 was the only place where two ID
> encodings might lend themselves to confusion, I'm wondering if it wouldn't make
> sense to chase the issue more systematically:
> 
>  - either with WARN_ON[_ONCE](idr_remove()==NULL) on each call site individually
> (a year-long endeavor implying tens of maintainers)
> 
>  - or with WARN_ON[_ONCE] just before returning NULL within idr_remove() itself,
> or even radix_tree_delete_item() (quicker but possibly disruptive)
> 
>  - a variant of the latter being to do it only for harsh bug-hunting builds (the
> ones typically used by patrolling bots)
> 
> Opinions ?
