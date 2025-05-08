Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B321579F
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704114; cv=none; b=tDYb07mRq5Jz0b+dIeiCbyOuzCsw64ZDM60m9csV9XZisIzlp+Nt+OcSbTLZUphF9niyOa+MhhvE+dyoRf0sHynsNvT5Fiide2zL7HYhPh2EMH0zr3TaWlWP9ELBkfga88c3TGF8W9du6KYo80Jg2JXkpO74KkZ5ay/l19TABxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704114; c=relaxed/simple;
	bh=bvVyv6xMDGMJyUYc55F9Ofhjgol/RDYaGz3yYp9ZNsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tG5nTnxV9ni6XO487cKv0/acidY3NFskkujz9tu2c8VAvsOd5VN1w2EA66YviV8/ljVCWb0vAEeljCz4gh8OaDd0FV62wPdE1U4Y4NjlNCSZShiFtEW20dBeGcP0oaa+wb7xD5FCdIpU1zq6iRZ+rWG/JGKaLCBuKj4R8LIOuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cErWP2Vc; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cErWP2Vc"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-708154c2a80so6939667b3.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 May 2025 04:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746704111; x=1747308911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cFDupK6Xf2E6C4tAlReAOJJ7NUs3xHRwtk+nXwvxV4=;
        b=cErWP2Vc/udCDZVBdVmIOClhqgVwY5EE0StXi91/R55KoNHE9Ne4hqyo1PrCO3+2CF
         9XnzoeQKlP6Dc4Bf/SGBhLoRAd2wBK7ctdqxu8li70ktwE5BzlEalTqC75Xo7DKShKHv
         myd3fBwnxA1VvoFVylqPXZeSrQLX2MGY/OoIcRSvzTUE6xgc+jQr/CwtIrBISKWmsX9p
         B7pFG+mfmwCGCBs9UgDTkJb4kCV6NzR6Cy+ugQ+YdWQYXOzlsLLRMOI78nP1bRhIPtRX
         cxqlye0x0MYW7VGWdEz4/2WLYGJDs4/BUEtv4DgWLh7+sgCPLCNvZofzJgzdnZr6jMtN
         y1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704111; x=1747308911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cFDupK6Xf2E6C4tAlReAOJJ7NUs3xHRwtk+nXwvxV4=;
        b=QZZfyILD7Bf0/zMQbutiMZ2dZZTmLEsS/hG4ppmFbRg3pel5EEfZOHaEIrnEBsC2ub
         16nC6GoSE1jtwIhdSpSwgCM7abUqzKIKiAja5TJQnRCEBi206JpbBTP6obk5Eb0HvALx
         iN+JWKfpEgFrRPvs5WeKV4kMv2fZ+18fGIFJYFMIhUQ70mAmCdFuscgnssEQqlQSdpp5
         yGmMXEjtExToh3QcW+F/IzTgqAKB/7QPPXzNgFm6JIZAorID8pa36ZwB9P06AUOqYF5Y
         3nhdl3+W6HjpvR3yZG8tbjp8mtmt/R5kYyRdpLAHLU0tv2rkgpRdLBvXoiJUYY+OdR5A
         7Ztg==
X-Forwarded-Encrypted: i=1; AJvYcCX1t12OgRtvPoMKsMj3UpLFUc+M4+rPqbfeVXxBDjLiD3+EWasjKzA63IKr5k3zlqU3oLwGr2pdIrRjS5LfMaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBy/TBK2cpkFtN5HGUPEpGSyd0VUYQWMUkKpFGBF5wRZ4MvLK8
	bihfIvaSXYfam+ENXNfLcmnxYgwl8/twQ0F7r2+UzhAci0wOWIEpp6sAgBeQ38eIUNfObJ8eZvv
	EMrJNioHhhTobEVu4x5z1fO7ENzcac2MvlKdT5g==
X-Gm-Gg: ASbGnctDJDv2hlyY8YecdZ+KR9ioGk3+HlNzUeaGbbzUCHHBsh+sbjItKrOpyFJAcOZ
	2iGm5Wx4QqXhaL6ToGBG4gZDU2T2/JyAOYDOrBjBLqdco1Kc3xf+5dyWgQsQH+tNnXLwM2coQHX
	7L9pM6HARoAKGRRoLYviPF5fA=
X-Google-Smtp-Source: AGHT+IHN2lUuKUTarkdcjyDqAknRCn/fWmfDn/tSy5fWl2NXM12u16FDC4NBp9NnMQQejpVFcCMkShO7wmk1XhnlUdU=
X-Received: by 2002:a05:690c:3581:b0:6f9:48c6:6a17 with SMTP id
 00721157ae682-70a1db14904mr97981527b3.26.1746704111629; Thu, 08 May 2025
 04:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBxPQ8AI8N5v-7rL@stanley.mountain> <CAPDyKFoZiEAn8yT8a9VZqayR1=HPnMn+a51O3zUAUR3L6RXH=Q@mail.gmail.com>
 <aByIzTj2t1I9Wrzw@stanley.mountain>
In-Reply-To: <aByIzTj2t1I9Wrzw@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 13:34:35 +0200
X-Gm-Features: ATxdqUGOeXxjQLDl7WQSeWq8Dw_7uuE6KmRvz_BasEIpW18BLduzRZu0OBCb7go
Message-ID: <CAPDyKFpiqrZwebmo+n9mO6Fce3ZYWhVLzcDu37SfphdvpQxSiA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 12:34, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Thu, May 08, 2025 at 12:14:41PM +0200, Ulf Hansson wrote:
> > On Thu, 8 May 2025 at 08:29, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > The error checking for of_count_phandle_with_args() does not handle
> > > negative error codes correctly.  The problem is that "index" is a u32 so
> > > in the condition "if (index >= num_domains)" negative error codes stored
> > > in "num_domains" are type promoted to very high positive values and
> > > "index" is always going to be valid.
> > >
> > > Test for negative error codes first and then test if "index" is valid.
> > >
> > > Fixes: 3ccf3f0cd197 ("PM / Domains: Enable genpd_dev_pm_attach_by_id|name() for single PM domain")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
> > Thanks for the fix! It looks correct to me!
> >
> > What puzzles me though, if this is a real problem I am sure we would
> > have been receiving bug reports, don't you think?
> >
>
> I think it would only cause an issue for invalid devicetrees?  So it's
> probably not an issue people often see in real life.

Yes, you are probably right.

Anyway, I have applied this for fixes and added a stable tag.

Thanks!
Uffe
