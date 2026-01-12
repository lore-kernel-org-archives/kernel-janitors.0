Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535FC2E093A
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230924; cv=none; b=l9ksllfKg+RsBtX9gRhJRlX53Iq5BON9kNRCC+nEDt3VtuqudgWXj8NHVUZ+XMvUtSKo6G/bb1X5kMnhj+OwzG4Noa+EZAkL50k+yVxlrshCsBgnPFqJpu5HjFro1+sXx7U3hGzAqYgtz0C5EhXNTPxY+vr+9ZL8tAet/6cvyWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230924; c=relaxed/simple;
	bh=h6QudfM+BEqfTeHE7YkRJO0iiai84hHMZjRpU5X0XBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQZCXB04soD8I1AkKYgdxXK2FjIL0vQxn9vd4AZAssO1btCHjAXMas3UKw1EBiVHZl08vBJhp83KBZu0kb7iVfaICPAKuWs+kRdC0ALjha4pfIWhgAysHs3/7F+MZhaJRFhXWmX3aiHyTmUQLqd4VYGI25qKnx5nNGfBSun6/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MDRdIALF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MDRdIALF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso70337115e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 07:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768230922; x=1768835722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9FXlOztAQ3v1foaiiiFEOmTKWgsDAmfXBn5g4N5tkI=;
        b=MDRdIALF7t8MXo6oF6WgMPBTdx1ByRCL6Z7NlLMt66q8Uu/3LP0/X+IQPwF+TLLQ8+
         Oi6SAE1N5dqRSy/re0vr2sxoA0JI7ibG8Id3HkrmmNpakY6SpDZhxWQT94trxIo5WNTn
         bkcTgb+qyP4GGWoFEKrS3L7AcDDi+3SbFS2kulvFenNil8gXAMBpDTl5RjQSoUj73RWk
         YhCaGq5ghTpVkXvRiOs7v63mdB0lbviXssOHHSnypfpd4wAuZ0Up5Jx7tF2GT7/Ic9HS
         RUdnvIaO3a6VQmKFu5TuXO+ZsTNpZac8HODVB0y5SYmC8UjbxyLIDNuhXoTwq2hpjIQ5
         41Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230922; x=1768835722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9FXlOztAQ3v1foaiiiFEOmTKWgsDAmfXBn5g4N5tkI=;
        b=f6a4TlvyQWj6WHFH+xX+HdH0YnmwgZa0kdudEnHMF4nuA3ajx1jhgpm1hOHzx4/yV4
         aEl75MBeqJ495hvz11Ax3zgtWTOzwkeiVzMhPmCI8aGYfKySREJTxY0u85CqPFe79WZB
         lJK+g8JVseWAr0Hmse+8Jezeqrt94AIb4pkHSSect8TWIfhrGfmfZm+++ruRNksZH2JU
         WVmZ3LYcYtvooMZs1T5m2P8+IFX3PnTgWv5nQzc3GJFwgRiHbWS0+4zCX/VVV16xBw3g
         UtJDcd7hz+LhPrWZzg+SR8K29eN1s3Lx2BFmWvGgbcRS6D75MEGhF3PyCPcPOru/9vME
         SvEg==
X-Forwarded-Encrypted: i=1; AJvYcCUpyfglPSk7BdnAgekpja+rzJPJPRudCuSYErDSdMeWtJVDMQZYPKYxCPrZFqfaooKKkYPRrI2ZEJa5rQMkUlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4+KYBsiO59NH/gHsS5/H9TlloeXBxZaefwyYhdseG4yz2E8ae
	BCLARe0+Vn92GlKMDWAVzfG0ggl0u5lbyAYOAJBw23F9RSMyer4upl0XiSTpLXX0mEw=
X-Gm-Gg: AY/fxX5IK6JlUYSQi61sAg+gQ5keKrYORk3LBCW9YjhfsK53+rTWGmPg4nj/VAVHGQI
	vMCpO7n7KCYrIV6UuxqwnijpYKlYwblnYvtlRMcBCBXwu9eT8GDIBwIIBu8ble1KFBz2i39VrEW
	yedeVQnmdz1DFHs4Uj1gN2ZFZRSV+Sf+ZBRTyWvlFnqFIXFawJo3IfuGGISa9kbS2mDN2UAaTnK
	4wJJFCLKjZJktwHWnFH9+ELebxd0ZP83PJLk4at33pyqtOSJHCElEWUtbkdJjRkOS4RF3f6M7ut
	9lgD9Fr7fWCHuNgpEavJ7iY4WnQkK/wywddFkxE5i+NtBq6O3EnXVCyN2OrT0vZeV7wnKgUuFV8
	B/4zoZMsVFwLhx0VQX6/l7vYVi9z4E9IHaSktL2ScNBrj7gJ2I/0qlQR/HPfsGf5Br71RldrcZ+
	PfSFjf19yJVkEzlRpF
X-Google-Smtp-Source: AGHT+IFO0yPg5n5oM2epf+jZFSWNft4b56dzwR4qk5iFKZhjsdfcK/zEf81nvYnre7YVzrIgmZde6g==
X-Received: by 2002:a05:600c:4ed3:b0:47d:6140:3284 with SMTP id 5b1f17b1804b1-47d88fc1df4mr187863785e9.37.1768230921406;
        Mon, 12 Jan 2026 07:15:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38984778f8f.25.2026.01.12.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 07:15:21 -0800 (PST)
Date: Mon, 12 Jan 2026 18:15:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Colin Ian King <coking@nvidia.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	op-tee@lists.trustedfirmware.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] optee: make read-only array attr static const
Message-ID: <aWUQBSa3dw5HOsVd@stanley.mountain>
References: <20260109154442.421248-1-coking@nvidia.com>
 <aWTaUvGu9dlvnJO9@sumit-xelite>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWTaUvGu9dlvnJO9@sumit-xelite>

On Mon, Jan 12, 2026 at 04:56:10PM +0530, Sumit Garg wrote:
> On Fri, Jan 09, 2026 at 03:44:42PM +0000, Colin Ian King wrote:
> > Don't populate the read-only array attr on the stack at run
> > time, instead make it static const.
> 
> Is there any value add to do this? AFAIK, the static local variables
> aren't preffered.
> 

I have never heard that static local variables aren't prefered.  I
imagine that because they're often not thread safe?  But if they're
const thread safeness isn't an problem.  Generally, we prefer the
scope as local as possible.

regards,
dan carpenter

