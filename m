Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EACC15E5CF
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2024 18:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736265; cv=none; b=Fq923Q88j+v0ae+wqB7fR1Coeeu/sqfrGKrwkAe8rhtSKecXx3gBf2By3T1fLBbn/L7yJ7eDSfGHLRNBdCP2KIvG/+4W/jRt9CxbWMMiB7cs4aynyPBfwOgm6miO+F18aW+vasWpIsLddhF75iMeVba6NATfEE/ECmMPqXiiVWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736265; c=relaxed/simple;
	bh=8EAlZ728fwAoajTGax/Ncng82hLDLRjznjKwi43NYEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKrEhoHFku9ZYKGtuU7JrI/WZ1SStk5+7j3/3CvOziKdBn/KjMNyxdJc0o9MGCqM8JhVMAdemumh+fNZiAtX9lPTUskOKzHzgLLuDMWSMgCv2IAisNny3N/zujfbWJH/b8/YVcpgRPpunMCVutQHPsfptGTSLJAPA8hdDQ/rCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdBE1V48; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdBE1V48"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4218008c613so43994345e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2024 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718736262; x=1719341062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8YmtIThoWHDNf2Fuz82v5hAeQY8x9PJlXOA1daw3WoE=;
        b=TdBE1V48xu80DA4mvrlW+yXbeiCrJmu+GaVZkxzKLObeeYFFAse4BrEJXumDqQ+YFM
         bjVIJJWdpYDu0eEwYsnd6oYGMMJTh29Zr8g5wLw+nipw5BQYLwy16AWWZnm6bMV987u2
         +Ji0Idnuwl0GG1MXkExqczw72/iNMBzXk+kev1c+gMSWzhlV4ext/Xnm2WNrlbUUSSfT
         gUX5qDrTGFSzGjkjv1WLSeNDwQSbtMpT50bzp8kFj1K/VF1VIHXwdN2aS2zav3Ybqqdj
         sS9e6xnMO3xqjUcQz0RuVD6UxMzV8YtK7QlBAyz9T9Ai27fKy+mTMz3M/6Bx2Z7rhK3y
         /qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718736262; x=1719341062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YmtIThoWHDNf2Fuz82v5hAeQY8x9PJlXOA1daw3WoE=;
        b=EtR/Ur5o0tgoTjfGav4t7BgDaLaYYpPzKGr9EbJYmSpSczSsSGCWNnYfUXoWHnP5AM
         pbLqLQyL7FpxaJKsfn5hi5hMYiBANQazJZ7lWqHKx6l8XF0tfmb1mpmeaxZIaP3o+Z38
         m2zl1fV/+ecMfmQ9y/uIANqG78KU54uz0jhRCokMDl2q/m8XaTIw8m5ZiptWLRpS+gEz
         CAeZcZVEQQ2nXEMrvtrDPnEcjCsxqvwh48baQz2AaVbSrt6tBjuiIJl326f++p1CjN3p
         gXpXsN5SEuNhCkdD4maKuquMCNhSFbMXCx3MW5iAD8jO/AIksoB9LyGRMGw3PSi2eN5a
         9HmA==
X-Forwarded-Encrypted: i=1; AJvYcCVwvaMHMEgEfWK2t3MYt4Y5LC8NB/H9oltrgOGKl1uNJv/S09A+1+Biouss7KOUyvziSezeACdDRYHuRWMEAE7jVPRqLvqtTn6WBClXFDzo
X-Gm-Message-State: AOJu0YyTXfsEKxXmN8ewDafP+nwK6aOZVC4ajbaJ6wiN3Jzbjir/2i/Y
	63dfjKnhZ7Fw3mRb5uyQLgaTzQQs4davSkibDEv+b5YucFXQ32Iznfbrf+RB2fj5HxHgFjF3ZcT
	D
X-Google-Smtp-Source: AGHT+IFOPmmL9xR+r57H15PcFrByC+dDDkTEnkkD9qQAMSmDls4Jrd8tVkl363ch/XvrYNrZXNiQ4g==
X-Received: by 2002:a05:600c:acc:b0:421:eed3:5991 with SMTP id 5b1f17b1804b1-42475297adbmr2774925e9.32.1718736261769;
        Tue, 18 Jun 2024 11:44:21 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f61277fesm198937395e9.21.2024.06.18.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 11:44:21 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:44:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrey Krechetov <apkrechetov@miem.hse.ru>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	apkrecheto <apkrecheto@mts.ru>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fix typo in pid.c
Message-ID: <78f86a5a-3889-4f6c-a2bd-49dc2d3b4998@moroto.mountain>
References: <20240617220206.2788261-1-apkrechetov@miem.hse.ru>
 <20240618140421.GB13758@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618140421.GB13758@redhat.com>

On Tue, Jun 18, 2024 at 04:04:21PM +0200, Oleg Nesterov wrote:
> Hi Andrey,
> 
> thanks, but I guess this should be routed via kernel-janitors?
> CC'ed, and add Alexey.

There used to be a trivial tree for typos but it died.  It has to go
through the regular ./scripts/get_maintainer.pl people.  It's Christian
Brauner's tree but CC everyone from get_maintainer.pl.

But there are a number of issues with the patch.

1) The subject is wrong (no patch prefix)
2) The From address should have the full name
3) The Signed off should have the same name as well
4) The commit message is missing.  It could just say something simple
   like "Add the missing 'd' to 'already'."

regards,
dan carpenter

