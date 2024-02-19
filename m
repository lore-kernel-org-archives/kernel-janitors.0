Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5749C1D6A6
	for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331840; cv=none; b=DklGHxJd7/CIdiXqrTYFopQBeFVsUi5ET1JxzvWWSaKJZqX9trSE5mQXOyjE2AfGMvcC2j2apKFGANBFuZkuhHatPe80zvR0R7/2ILkLd6Az9hUmb1XEY7g0RZaVhH9Sy6k6JSEKpojkgnZ0Q3db7ROZYKaulrxJ/ofboC1yDA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331840; c=relaxed/simple;
	bh=tA/HjR4gNsKYDqxOmkzpm1jPCMw5rPMZeBApJ0Rh/cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBxFQjDmD1AO8KJRS81hKo3W7YPpfV3rmBMM1dX7aE75YMP0+jlcJ7otTG6PMIFoslDOcJfdeohcd8ffKbz/CHGfbPQgc4RrBXkAVkPwgzDGLJ4oNlNF8vUphsbDswq8aiGyzdaxobbugVxIVC8wi+hCJW9m+aWrG5VOv8Rij+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ge6DQLie; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ge6DQLie"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-564a05ab3efso249990a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 00:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708331837; x=1708936637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ojbVELbGUO0Fdw1LO3aSx5BEslcvMdmSrG39OaZaxOY=;
        b=Ge6DQLieZ2ifGEL3Y2+H/rbtAMtU0Zl5t9cedF+AlgRk4g8V9/pw4CBzTO0ehV1IVx
         95WO1Q72LHvcU4rU118BDgM7NqVnZFYxsg/o44DUMitwmM7WPeUEy0E8/XfTXuMd3ODG
         ZXQuaphfcGJepmMcgUhakUe9YoCZqmUoxpwRvfp/oLSh8t+Wli4VHG2uWryR8FM5SmPW
         ngOZsaH3EmFfZpz4AJbfV/qYb3o1cvZWHzWdPWMonjpxRaiRdooGZ9x3hL4kC9302Fdv
         ibD1pFVBPwXy9L0iWFL4lzvXIsjYn700t9oetL453v/FaZ1ge7FFC4cW1xNtwzgV08xv
         bhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331837; x=1708936637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojbVELbGUO0Fdw1LO3aSx5BEslcvMdmSrG39OaZaxOY=;
        b=cWi98LxK8vZOGHEwZ+2kjGRDasQ6+aFTQYbfHFfpMG4XBNlPQEFx8jkwcesoPwuotf
         S1kzfDvTMO1Kjv/dVafagFcgaywoPBbm4zJtxAxMT5nF70WnW9oKRRBTmYN+9qg3tyI/
         0RUxhDaFRGkAwSpgOvspHLmpBGGA9ZQQu381nHV9Ry42pKkxNgEbSD7Bh9F/hWgxNIU0
         CMitt1trPcMFzcY3ncvpR5+1fh81Hzt701KkP7YK0Z/7/CwlEFk61BTrJwBR6MYtiKf2
         YeieC/oQ76AQqc5nN83GL92XqYMB5BoVjZQtXWgo3+kylF6Eu7jkoI0mzfktMKSbpLIi
         8zVg==
X-Forwarded-Encrypted: i=1; AJvYcCVw8Qa/x0mdO9nkdSzizWFstSMxUsVW8jJjjTQqiVQ+R+phZzoJckCL6qz2mkAw2fXy1Nh7NX2fdKZZar3T0VRc/RME5/MWBa+/5yUgEgg+
X-Gm-Message-State: AOJu0YyloW4RNHjQVMs8Z7D5hA1A32eVffCCHBbhfoJ9TOaweUf/kw4d
	YY78qfa3F67otVnRfX1JeygllO3IH1TfS3HON4TarqW1FJEzj08o45Pe1t/8Urw=
X-Google-Smtp-Source: AGHT+IHPRRVfa7/lTL/FAHCnZ0EhKSDENbaTpEre/56m0a9j/pZ89HxBxVne3vEkeUmJJ840QF6VYg==
X-Received: by 2002:a17:906:fcca:b0:a3e:473e:26a0 with SMTP id qx10-20020a170906fcca00b00a3e473e26a0mr2936656ejb.51.1708331836826;
        Mon, 19 Feb 2024 00:37:16 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id th7-20020a1709078e0700b00a3e059c5c5fsm2695590ejc.188.2024.02.19.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:37:16 -0800 (PST)
Date: Mon, 19 Feb 2024 11:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Message-ID: <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>

On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
> If 'list_limit' is set to a very high value, 'lsize' computation could
> overflow if 'head.count' is big enough.
> 

The "list_limit" is set via module parameter so if you set that high
enough to lead to an integer overflow then you kind of deserve what
you get.

This patch is nice for kernel hardening and making the code easier to
read/audit but the real world security impact is negligible.

regards,
dan carpenter

