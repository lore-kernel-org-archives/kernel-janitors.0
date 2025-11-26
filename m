Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D68324B3C
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 11:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157683; cv=none; b=Xyd99knAJvkc2r544owO6u3eOBNzKfODceIamFmAYiuxMfbYEJDvLoQZH3fCKTHt/V70MWJUvunq2E1gGPsbgYSxW+dA3VjMzRaUERHUWC/AmLawHaEHyYd4DoPPp63X5839SDLIZzQWvI29b/aOKK3YfLWKmXbyYMwJ14NgCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157683; c=relaxed/simple;
	bh=4O7jgySbMcJkLhg+PrL7yjifT5q2ij1NuUvZr5tjjJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEcdFpKYf6NME/s00WaD/pXkLw+BVyDYXHwJjPWQQwxTdfR/arnyEB5nX2zXMqVjmqLdWgIzNoUibbPRJ1t/NuPXDnkZuM0RpJlj8fa1t0t0YaI/Lc7bn5RRx6Dj50v+VkBciC9Y04T+2c0Q1hnjn9Vecjrtime29x29cIU1dbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=VOuGzfx2; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="VOuGzfx2"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b25dd7ab33so452466785a.1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 03:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1764157679; x=1764762479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BLKOGEBOWC7uykTpFffxCnUm0v64AscVBGyJtT1rdTQ=;
        b=VOuGzfx29CkEbkrI1noWvHMWrYWtcEAS89SJVd+hZiQLS8GLL9lgcvcoiFL1sdik4z
         3Nwz0uedJYX11yYI0YHq88gii31XtHE2ZLFNZYe7gySHglDNBH7RwEH5wFnfwMJ/PVOI
         ax8+G6digBgyIUgM/PtT+6MKfDR2/LLuvzOgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157679; x=1764762479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLKOGEBOWC7uykTpFffxCnUm0v64AscVBGyJtT1rdTQ=;
        b=K1L714zOhV5H8N9gwLtFDRIAcLGBfhmgpq+PCsAb3g2OQAa9Mhs3wCelBqK33DuCFM
         IVDQcO7nILB04uiwGMl54aO+H5bF1wwzC80EUPnoGQX/tU4V8/VeOJx4M7DnWg/R1fs5
         7gc0xoV9IpSTbcjUNCl0DDkVT6MHJEzogg1NW3XHIxNNOddTV7z783mWRIWynSM24OvD
         CqS09h8pHsuu2eK0OFPh2hLsJEpjMOuRGwZCWXb54OKxdMYABEkL8puqkO4sZFa8WbVi
         RXK3cK0kDj65mJsmWLKF2XJVgChWgSrGApxjEXU1xe7zAC2CJ90IROcZnnZV7/CqX9gl
         i1tw==
X-Forwarded-Encrypted: i=1; AJvYcCXxR6l40jCJWCUNR8vfiIAOQ46rBxWUnIfi0zEEZPiOCrk5Xrfr50pjZehj3YqYLlyTmPmWfb3os9jDwQTzM6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjM8wPuI8EvEr6xSOgSVYK/IHSF0qhVXJ/nw8y9ue1HR6BWcr
	bhC9iyY3Z0Bp32Zp6rYpt/CGgBAVanpbJUnJ6qLiDkcTM0C/5Arl9la0MEjxnVPgs7SyA/BM2WD
	SR0AYkk4yqwMVb2xGRna/c96boLq4MT/HEM6/VPDlTg==
X-Gm-Gg: ASbGnctUwLr4Wj1NIwLtzfp+KryL0FA2M1bJTpImiFM27GYMv2J7Jf5dnQ3LgUG4LwN
	6DGzrIRxVl4uieFqNrW2z3oJ6p9CNBXdt3rQ7y4xytExcHyJ9xq/wxFmCHrUD/0PCilFzri2psx
	RXJ8X2cI4QeSELDBoFl5HgvcrD7TkvJ5Uc41dV9Sr7oWrk1mZT6SU7xWwXbL1Ks3sLWPIlKdUML
	BmeFjAA/zuYQgYN+KcKS/pOwNRAxzmINsj0/m0eGY79I8Hncny6ZYToBJbjLigXQM5Y5w==
X-Google-Smtp-Source: AGHT+IG4szwDZ081eiwPu6e8wnBK6+JbjcwhY5/NTsvzbpX29nJZHZ7+aOplZyZt2DzkggNCzH1Gzb7H5BXIzibNHXs=
X-Received: by 2002:ac8:5a87:0:b0:4ec:f2d8:9817 with SMTP id
 d75a77b69052e-4efbd8f5cf4mr72591521cf.26.1764157679282; Wed, 26 Nov 2025
 03:47:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aSP1iMPil7wTnboD@stanley.mountain>
In-Reply-To: <aSP1iMPil7wTnboD@stanley.mountain>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 26 Nov 2025 12:47:47 +0100
X-Gm-Features: AWmQ_bljsEjNml8xxPC1oDm2c1EpX7z5TuWP1P7GQPAoAzkU82dlBPGJC6-hYvA
Message-ID: <CAJfpegsnFYLkHP=KCwkK1UW=KJOqFPKX9H28G4BERkzebg=igQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Uninitialized variable in fuse_epoch_work()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Luis Henriques <luis@igalia.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 at 07:05, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The fuse_ilookup() function only sets *fm on the success path so this
> "if (fm) {" NULL check doesn't work.  The "fm" pointer is either
> uninitialized or valid.  Check the "inode" pointer instead.
>
> Also, while it's not necessary, it is cleaner to move the iput(inode)
> under the NULL check as well.
>
> Fixes: 64becd224ff9 ("fuse: new work queue to invalidate dentries from old epochs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Luis Henriques <luis@igalia.com>

Applied, thanks.

Miklos
