Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92363CF
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 03:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zC39S0MG"
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D7711A
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 19:54:08 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d2d8343dc4so772496666b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Nov 2023 19:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699329246; x=1699934046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ohRlubhGgc/ByJJVo91v+dC9pOe3E7CBQIDJq7OEEU=;
        b=zC39S0MGjtWVvPpywrIeqEYRxvaSctxNb8KdtmovY3ykAogUU0AP+YzEFdDy5BB52c
         n3jxfTi0yfTH9KJ8vEOPctenaqWUl+BBBwG9IckN4/G8nkmmOTHCFtCmpSKphCdn5EeB
         zX6k8tMI1YjMWUeShsAZpsTneD9RltlHDcprXwSJt+iMF71B6PlwhzIaYHtE1txN7uRO
         MglOJdzUZJCmKbIjvaUPVQE81l1TsbJCaScK412OtTel5dfGtnrGyDujBd68Nka7lhvA
         YmIpjNduu1H1NrHpNW+ZDimMtYJOGdecIuCgOsJXZ7cFi395Nor5t1XUEagHwgXaasSs
         iKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699329246; x=1699934046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ohRlubhGgc/ByJJVo91v+dC9pOe3E7CBQIDJq7OEEU=;
        b=Nfq5BR1uaulGXt5mnULSf2QXcNfDAUxlDSCXXQS/RfZj2IQDEPAA147R7xC/li+nZx
         9q+qw3rmcSVUQntHwP+n22nRitR+WPJ0Fh8YGeI1R4ujns9X9Z8qDsEWjB5W5Ps3aBbh
         zE/P/kf65HZBHSuMlGLtgGQnz8G6vNVhvca6YQRzOEhaYoZlyUMsAMs1rB/+B9kWy0Or
         yE9u7t9VF4c8xrDE30FKUmdKENFpVpUDn4lvNNRPPym9cTnceLkgc8F310sBLcGtkHeN
         /d54gXnD1xC3wPBWuRZba4hwH12dt20FezsQF2n5rWhKN9fYAJMdZypYVFpOs8o8RuAt
         FhBw==
X-Gm-Message-State: AOJu0YyZtMq+KFeNCrO+YId6pGT9805EoUq9Sgj+gsKuQkVJkqc7kwsp
	xc4E15p1tHhZtHv/f+uDlPbGxDdrjG5giRMaaeA=
X-Google-Smtp-Source: AGHT+IHRcH59lDrKp36GaSoTXGdBrj80c45Dg5D5kg/o2f2kX1Ge2cCV5nB0wgAbn+E0i3WM9zCrQw==
X-Received: by 2002:a17:906:7305:b0:9bd:931e:30d8 with SMTP id di5-20020a170906730500b009bd931e30d8mr14069528ejc.14.1699329246453;
        Mon, 06 Nov 2023 19:54:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bi19-20020a170906a25300b009adcb6c0f0esm535379ejb.193.2023.11.06.19.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 19:54:06 -0800 (PST)
Date: Tue, 7 Nov 2023 06:54:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/damon/sysfs: eliminate potential uninitialized
 variable warning
Message-ID: <0df4612e-6035-496b-96c4-d790b098aadb@kadam.mountain>
References: <18d2f41d-e442-4f73-89f1-50bf20cd85f2@kadam.mountain>
 <20231106165205.48264-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106165205.48264-1-sj@kernel.org>

On Mon, Nov 06, 2023 at 04:52:05PM +0000, SeongJae Park wrote:
> But I think the unhandling of the return value is a bug itself, that not making
> system crash like things but might make user confused, so I was preparing a
> followup fix for that, too.  So, though the problem the fixes will fix are not
> significant, I'd prefer merging this and the followup fix to stable trees if
> ok, since those are anyway bug fix, and should be simple to apply.  If
> something conflicts, I will provide backports.

Sounds like a plan.  Thank you for doing this.  :)

regards,
dan carpenter

