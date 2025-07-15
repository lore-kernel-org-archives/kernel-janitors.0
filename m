Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2097261D
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 20:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752611443; cv=none; b=aSaVLaJEGHTVZ2TCXuiY+nBggsIEs0ZHztZR+PY7k266aDi062QL13k0TPfTbYCQtc55ItXNNXfcD6Zv1Cp1zx0H7mWQ/XX9niwtHCQP9Kb45ZlGzNdSMvnA/mD4qFkhr8A4DtTPRQbzqHhUrfn8xc7QdpkNk5T6vrEk/UlR2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752611443; c=relaxed/simple;
	bh=1yQoQkvqX9mmnClp25QvfEznRInvWZaMgXS1yJYfpKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psS2ih/nPK1MPnylEBM9uI/1PnclcyVpqC3zbzYEmWA74J7YKDmSxcCxRabEA6gq2x5CJywZYuy3SNEC3Mgg+U8Jc37aIj3MZWStxaFxwaFGofUz1RI+dxJXh4loGyEo9CQhMuMtZPgzZd+t79nHGflNfvCaBbyTC7xzenrMheo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o80VFCWa; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o80VFCWa"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso3878296fac.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752611441; x=1753216241; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0qnU3e/UbtN7g5RYL6+3ED+hDCWkfgVIl5O8F9TCC94=;
        b=o80VFCWabZ/3WVXTGYfeKQDdL8dvQcOHeyuQFiGAosWJsOuj/xMWNqLSAPb5IYrUNh
         EgkahYwN9Sv3euL904+AHmdBfs9EeyAs08cHhab30exeYinRr1E2Q0cgmO1XBtlUSHlV
         hrSSA3RSPiweRUUoSwUvQVoUzyQA0H1YCqz4nt14H9/rOW7/VUwZIt2dlvHJzu+eWyG6
         TyjOgkkxibChGCTMzCSzkKRL0evEF++g2F3r68o84YwpOEHjzADyvdgdKPkopQw7feb6
         M13O3nADsaxPBAOasrfnWcXbvDLLba1vWW8QB1mTOKpOzs1lPw9mWp+zjVYrxh/vRqlE
         m8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611441; x=1753216241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qnU3e/UbtN7g5RYL6+3ED+hDCWkfgVIl5O8F9TCC94=;
        b=kkyEji2vH5RXr7A858LeGUm6AkRPNaTfWsLJLQeLmkfJZ1jHts1rOQoDcW5ENEKH9T
         DcQWexXW2aN4pLadqQxufbgBBzXpIIrb59HVYhQPlgaA6I7XYZeRYJIghhYxjZ/5+wMF
         qpOareugkZDpx8ZTT3U6A1vfva60VyRz26rKaV6PjfJfkKex4HLOM63RgAP8OFs05zMP
         5/Y1mHpE6sTOPi8829SscZwBu4+m5SEPearohT9AafSyI1ko0C+9+4P2RrEgqkZ+Vxab
         HXpPSEjxiA19SMAUkyRO1fdUSJsiBEGWIYiwUNvwdk19skNhnDRkr7NhOPnzOZoJmWLP
         s7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJk7DG1VFRLJtfFF0vQ2FyhhFOzKoT56Q/0syBFpXhmLuMbMU/Yrt6RQGPdQTvni84vsN7OSedngKYVhH0b4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Tg3Tt9ak+L0wznLETghUx68AbnW/7q0xjQnHYKL4Mf59QNfF
	CGQ/uahRcngqW+lMQXPWA6e1BdJR3AzlZlG0aH3yFM6WSlzwE6yg2VSdMZRQLgBQY2H+BhZVPId
	wUWyF
X-Gm-Gg: ASbGncs/svyTdIxT6ZrbithogNQxaIMS7pR6hfWcs9ydBkebeIRift2svncMqtfd5g1
	KzEf+PYBsS11N7FstE3se3rLqHJzUWASoIyjZ3cKcmvNprToiogM4OYEh0ciduYbK1zMEQ84rN2
	Vgmi60MyqFcVuEqiQqe3b7pESf1yU4B1lab7FoqUiCId5Dvyp50jcdj2o+aoC3K+8HpabrEsrPw
	r+DCyzEn/v4Xb4QAJiUIJ8DHb9rj10augxxo9zjLZJmWAt4n+yh32dafXVDvrdSdjCj0bdwkEVQ
	NCkC2N7ScFjHYlSbi4g5QOMmeF44IJWkQW8Vk9RI3QQB0MUxCB3fIU2QiMfHAV8l/vE30uQP7Jn
	MPLvl4NDz/YjG390eRebQL8mXUzl3
X-Google-Smtp-Source: AGHT+IG2+pwfhzJLrz8IScyfJm6Y2ziaIzZQnZsetieX7P83RKFLQioSOUBeRHkfbvI6bsQBYcAosQ==
X-Received: by 2002:a05:6871:780f:b0:2ff:8956:fd45 with SMTP id 586e51a60fabf-2ffb1eafe32mr237804fac.0.1752611440637;
        Tue, 15 Jul 2025 13:30:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11235201sm2896491fac.12.2025.07.15.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:30:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:30:38 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <e4d9553b-34b2-4c2e-8d56-f86f3d51fcfe@sabinyo.mountain>
References: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
 <6ac8b8db02190da7d2edc9ce4abe5e7a7cab70d6.camel@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ac8b8db02190da7d2edc9ce4abe5e7a7cab70d6.camel@collabora.com>

On Wed, Jun 25, 2025 at 12:13:20PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 25 juin 2025 à 10:23 -0500, Dan Carpenter a écrit :
> > The iommu_paging_domain_alloc() function doesn't return NULL on error it
> > returns error pointers.  Update the check and then set ->empty_domain to
> > NULL because the rest of the driver assumes it can be NULL.
> >
> > Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> 
> Oh, sorry about that, I'll will test your patch this week, but otherwise
> looks good to me, fixing yet one more error path. I'll take the time
> to test dropping the iommu node from the DT while at it, as I simply
> don't remember if that was re-tested after that change.
> 
> regards,
> Nicolas
> 

Ping?

regards,
dan carpenter

