Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211632FD1B8
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 12:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815501; cv=none; b=I9UDlEKCqvB8wyzlmLPEv9AXEtomdNTSRl93qFsyIlNOXr1uMpkdT4oADXWb6iwSMPxNfAn5NCn75J0g0tAnsFwsONS4wuWD/fq7sJi7ikRxVA7s8KQArsFOaHEXPOGWRChNeQeXF1IypmMdpanxEXJ0wfVxMtwc6nrxN2q3HRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815501; c=relaxed/simple;
	bh=NTUciYP4qkVSP3Ids2cPJKg/b3yW1qYXyRE6W2+YvyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nphLWJsw3nF4V7BrFkraXJ3ZGoCyngN3p6TKV5XlT3+otXQ9bbbdJ8YZCEPUy91VOehW7HxsyLM81HSorQ/gX8h/1hGQyyaWa9PUAT0AUTvkgTCNUapsj+eikuvFdE6T/xFkIAHS7StnpzzFV+oFj63HrNNQ+Zzz4Jvc0n6oLSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PzLvHWK1; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PzLvHWK1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b30d09da3aso47303921cf.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 05:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756815496; x=1757420296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BtHVQVngraHXwyztIS7rS2FP0vL/znas/2GvCizYvA=;
        b=PzLvHWK1Pbj6WlpmabFlATKlg//2jKQcWFwDO4mh/b2dlSdxKBjbpmonyVzeAuJ7rI
         VQWlfOtS0GKss+npbDB/bsePPacjgaKOmF6ls2gWRa834PXhpzBGVXMhE68Zj9WgQhdM
         St1lWOqyJKaGhZ93OcLYJvivxqHKuHpFwRGNvBOqTUtmrJqayUOEGitfkU6Z+fOKcs2R
         3+60MEz6IvqSvXCJSPmVkx5Iu/RYKeAgAKI3/qTAVKQxSCw6Lp8wDVcZ3iasJQMAEC+Y
         iudGaxk5lAA7bQTYgN8oumhoWT59votstdkrd4PXS2uAjZ4KQVrMlEW08bKqV9A5pdap
         kEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815496; x=1757420296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BtHVQVngraHXwyztIS7rS2FP0vL/znas/2GvCizYvA=;
        b=t7QCQHrfckiX3NI4Bm6mjlL/9z0qbQ+GUlnlIcUCXMwgKe/ePnDz0V6FezhMPq0gzF
         OuentV8CorCplu3gGw9wzllpbBi/o72iB7Gfc08PZ9wV90aMsGUOn3iriDo8BeX/Sp4S
         BWuyBKKggjp9jcu/RN8Q1l3fOV9z79nwnsqRBKIGgj2S8D8xtbq4RSp/gSfYjTSj1tx9
         CmKGIvzYo82k3/3bUH4l8SqrI0DRGUUm8bQWuDoMPTyVOVOJOUmhp2bNecgRrczdAtRZ
         G1wmBaPI4I/2u61FrGMdXhqZfN+kpfDp1mM/wWL6VQ+B0VipV4zmHJK9vsUkVcDnjBcH
         HVZA==
X-Forwarded-Encrypted: i=1; AJvYcCXtBsOhcnmVRuPRr5OYLvkxkH2eVAZpGDC5FPsDRK3LozIGCTvIlms92ekTb9nFiVI6oiE3MNiYE/mkn/6LG84=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIeU37fC90cQCiRTrgSb4DLsfTkrTHnwEVizdizLCCBQVLFC7u
	0yu5j2wyCI/eTqTfExbU4KKq1ecf8i321ry9grBLeMlnlSySjQ+bs7XbroljTazRw1dYwXvNrBr
	jdxFwZBXz1/4c0Y+NSnfMfjXrwY37ZneoB66r7yAW
X-Gm-Gg: ASbGncttdYi3jayyOAWEvk6dmDqMNrRT6FQBWGB6BH3POznVkqo7oy1KVouN1kGTn58
	kTpno7Wm9iQYNW3iiWKJyBZYy6BQ8bhIECgdqQ0B1W0Jt6LFhvH1e4vDNwsFcCjn4yS7doI/zVz
	UESMX8B7xrvpF6fNWcrAroeGZzS3FRgA4XzdG28NhKxup4VXu4+AQU0KbLHAE8SX8c2osGBMsWc
	1n6kP0MH0lk3Q==
X-Google-Smtp-Source: AGHT+IH5vzEO1QHxkAoblS7kriJ2318EF1KTzHsAZLiCGeoig9qB+yVEkkECgxfzHSgXCz6G9dwSrH92f7veZprPEl4=
X-Received: by 2002:a05:622a:5b09:b0:4b3:140c:ef9d with SMTP id
 d75a77b69052e-4b31d844993mr129778201cf.17.1756815495331; Tue, 02 Sep 2025
 05:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aLaQWL9NguWmeM1i@stanley.mountain>
In-Reply-To: <aLaQWL9NguWmeM1i@stanley.mountain>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Sep 2025 05:18:03 -0700
X-Gm-Features: Ac12FXwI4CvJS6_vLUukiLiLi6nGCSauJpahGMDDKoEk8R4QGC_U6PfE1GF1EBA
Message-ID: <CANn89iK9FBmqC78Fn95Aa99+TA128xXSvSsLe408zkk1DG2Ojg@mail.gmail.com>
Subject: Re: [PATCH net] ipv4: Fix NULL vs error pointer check in inet_blackhole_dev_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Xin Long <lucien.xin@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 11:36=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The inetdev_init() function never returns NULL.  Check for error
> pointers instead.
>
> Fixes: 22600596b675 ("ipv4: give an IPv4 dev to blackhole_netdev")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>
