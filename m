Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401903DDDA7
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2026 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802232; cv=none; b=YmSb7WjMALzIDBAi+/PYCrTxD0n2PdQOYFvmePMPFoQwzByVQ6JLC0BOVaJf3xcixnV7QzOU2kAUsICF/U25ZLS6yQXQJHNcBvinGyGIBBts5UdLY3Z0KcH382RKKEM44gRYrT+KMDU0V7cDu+MVUm5nmYPD+mniWO5fFoDzmzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802232; c=relaxed/simple;
	bh=jJhdMmDpEI4YTob6x7tbe+0j9Jno+gpDkiP83eoohPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pupZgkU0iMqEfZDP6VEuYMq2LfRjCx8rm70SElGyAimPxGBjkXXSlXUX6lOfj6rz26Bxxb0YFP1z0aF3HK36iL2LJjVGddsy4tlp3sk1UrojoW4kJrdruUBpju22HAYwKBbhiWNRHLCwmjSjzwI9YK4xajEPF6zr04EWr4GdZ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMrAJCNO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMrAJCNO"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a10d130b37so4585454e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2026 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776802228; x=1777407028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/5oU7amdu0z7nvjPYd6YcR/1tXxonAi/NB6llIwWbI=;
        b=AMrAJCNOiEqPKluuJdYQxSSApHcmlo7sWVvjotUXs7dmSMvOopSUbwXUSBMYsEiIqY
         xSYCckIFdfMgS9RfhgmVgTDrem6taeTNs7xrjX9jZpO6oHOfOCgzuW3jBZsd/djGXMRr
         6LTK0zbKnzU/4wlhkv7dlJr0rl4kvk4HjeRihC6D0Rljd0DeKFZw5aoTzTBptIYfKnNh
         Jc4mMmmeFVznzycdPmVxMKZFwKmlPJm70dTY9b9B2286WsUB1XMQk39PrQ6Fpwuj7f2q
         uojIeqVBEbg6bljNQw5vkNgi8vQwJXRPenjEgaw5eWgidP6eTfrADhmU1LKlNKlVwW6v
         bA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802228; x=1777407028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/5oU7amdu0z7nvjPYd6YcR/1tXxonAi/NB6llIwWbI=;
        b=dtIY0/XUivvIf/6md5vIZCel0Nmo2xmMgTzQjXDbUB/e5S1tFZL5LG75DPi6wHZWiy
         HRGZv/ngyBy1PPCFP50lSYtMgqlpvqE5sb/X6IQBAK4bUXpY701IBN7SR5qrgzHgUyH/
         dZkj/sLLG+TZXLm8924xbnnIkHguGcU2n9H09FLKq3AoCsZ+xQ/QPglYkTvjOHqpvKII
         kO82rmQ/SdnnnHiTfw77cM6ldrc4TS4j/J2jh10jW1el47+rvWssJERWzCTJQB4W79K5
         tTmh21frMPp4GP7CNffXFjKtK2NHnxVsoTP44T5AVFdqz69FqtPGE0n7orPE0dBTbcgF
         QsQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7KsnRrlUOoCTiPBM3akcGSuUWvVmJvp9I8PXeiVd5/CJNmAwn+ED9JfA8geFEITCpeQpYH7KGG/al1UVIMz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmiOey4mIZfRVtiijyqaPUdDWx0xCKWjJJvRnov5ulIgdAps/0
	7vtZgceXsdxLrqP8aeSrUy2JiVzl96T+xIcpRc9B/R1pV3B1xd6uynZ1
X-Gm-Gg: AeBDievv9osm9i1sIBco5t0hua0mKA5d/oxeB1B5we+sAccDHS84h1aw4o7tXuwwv2d
	2dsQoY2RcTn9uhNCoBqhv9HSzwClaxjBsidAkwIPhwJqDZzn/ivIguqx5c8PV5rY4zKQAsUr6jZ
	o3uTqRfrLEli/Jd5elmoysBYBZOX05KymQCLuLcBlikOXw+ccm5Up0I95vZkTEL9xz1yl9EPXJJ
	6MTclh6Nf5XDpnWt4AVTz2aN+0ELuPtHbsXIw+2BXShLyy05fofdtpX+oR0AVV3hU2zKBxFdRat
	NvhOz2IDRMxD9t8h3D8BXYBCL7n2SRJDI1U7ycMNup8DTVqV02/pDw4Pxh97jr1QiD/cEidvNtd
	f0a2Le+qnq6f0ddiU4IyIxRsmy+h3TkYTqa+2v5Vh+rElJDyraIer1nCcj+IAn7i4e2QVRa+X8Y
	ApucD8x6y/Ux9nENVQ1lCNUyEX162OFQ==
X-Received: by 2002:a05:6512:3e20:b0:5a2:c962:59f1 with SMTP id 2adb3069b0e04-5a4172a3042mr5526839e87.16.1776802227777;
        Tue, 21 Apr 2026 13:10:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebe3dsm3858063e87.74.2026.04.21.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:10:26 -0700 (PDT)
Date: Tue, 21 Apr 2026 23:10:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Piotr Zarycki <piotr.zarycki@gmail.com>
Cc: kvm@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com,
	shuah@kernel.org, vkuznets@redhat.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: hyperv_tlb_flush: replace NOP loop with
 udelay()
Message-ID: <aefZrtpivxh0eK_0@stanley.mountain>
References: <20260421172953.191345-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421172953.191345-1-piotr.zarycki@gmail.com>

On Tue, Apr 21, 2026 at 07:29:53PM +0200, Piotr Zarycki wrote:
> Replace the open-coded NOP loop with udelay() which was added to KVM
> selftests in commit 6b878cbb87bf ("KVM: selftests: Add guest udelay()
> utility for x86"). The NOP loop is CPU speed dependent while udelay()
> provides a deterministic delay regardless of host CPU frequency.
> 
> Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> ---

How did you test this?

regards,
dan carpenter

