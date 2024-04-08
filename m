Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970061E497
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Apr 2024 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576492; cv=none; b=XHqrdw0/ezz4Dp1ZxXjlGANFF87j56JQQ+eJ5c2yXtt7VO4puJLEshGw2CtT3tp0d+sSr1W8fDHWJeTuBEbBbkjX15ePe3MkGw5NdWnDMOI7DpMzyDM9cgozSkRM15IDOc+jqKFQUyk5HsV2JHlYb1J5sm/QbPWX4XjHbF6rrQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576492; c=relaxed/simple;
	bh=iMVYHv8sRaeRSLOVhAiWm7JAQqUjIq04GaxwqbaPPBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+Bvzkdp2gKmpSv8LkX85WCmWv79B+tw9xKx0lFuoYV+r5pKfJydZpBc7brQciMdpTj8xfy8a4hsTj/GISVk3OFFfjEJkVc9Rmsqc1j28DNkYrwzAed9FKAqu5SBr+wQgoZehTUYaSX58unUA1U/u865pRYtZNSfVtxE4qay9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fP+FqU+a; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fP+FqU+a"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d0c004b1so4820653e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Apr 2024 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712576489; x=1713181289; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/+Ac5xYc+ndanw/zS5/RdoiqTJORLBsnKnWnOGA0Lw=;
        b=fP+FqU+alR/A5fAAQ6EFxmGRJeKZ5DoyNLDQvIT3oGFz45bMN7ekz07rfrWXC8N6Kr
         0La26ScoMgQdW+7494Jk6uhWeUGtA/0aSK7ZvGC/Qtk7djlvYXhhOb6h4GU/7Q8Sf8hU
         Joxmqx3lKyr+lDxRDcqdX9xNK5xMNTVSOGR7VxK1J3KTnJi78paFICsvyb9eEmWJIbaH
         VD9cKeXCn3TKcrybEyH58xb36ipdnT7lb06ixWRX6ITXWm8nZUhX6Wy6F4EhzcS2bH+B
         /4IajJrXD4W/4sh31fj3iQ4SvybCtiSDZvg9/G9j1SLXm8cTEEhEvCisluQ8zLrbhLZO
         wzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712576489; x=1713181289;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/+Ac5xYc+ndanw/zS5/RdoiqTJORLBsnKnWnOGA0Lw=;
        b=Oah8xM6ZQbLHTqLRqm+QZwlK19mvYTzjRDQB6Dy21aa9f5RPi+ZLAy/jloWnV6ddlF
         MY0fRamJAADFJSe77KGG0LQ+8ZPe8xJxejDDBwehmku+byo8kQcGq8UUqEaT+tusi0y4
         I7z+2Vc8P7HZu/xHS8yZvEINFffkOOjIQIxR3zHDYTFdAJxqsgUppkjcbGmABIzCBScq
         WzyO5zL1hrE7gsbJ6SgUTZ7rUC3brn6spl/y+/Yp0nnEz9/LnYQ6UhEcN3Fu0MRA23xK
         /g0gjaEprRAjQUGQ4i/PNVcOFYDXHagXbYPNE7FZJCd0IsMiwMFipRP/5/aobXij2WjD
         jx0g==
X-Gm-Message-State: AOJu0YxlWe1ck+vy0rJPAWQmYVJDkrKOYCgct1/v1a41csYPUis5KQsh
	ZMU8/0oSgB0UOYebSTag7Kkyk/XCcVGdYJaYl6rLXfbx+7X6MUAkImgWv/lkUkxVDCH4I7rRyHW
	6
X-Google-Smtp-Source: AGHT+IGA/L1mShweudRF005XNszcLJ0fFHKG14OIAGplMlugC3r4R0HlCyr9YY9KREU7N8Ux8wpNWw==
X-Received: by 2002:ac2:4a6a:0:b0:516:d30c:7243 with SMTP id q10-20020ac24a6a000000b00516d30c7243mr6051090lfp.28.1712576488451;
        Mon, 08 Apr 2024 04:41:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090668c600b00a46d049ff63sm4303095ejr.21.2024.04.08.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:41:27 -0700 (PDT)
Date: Mon, 8 Apr 2024 14:41:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: antony.antony@secunet.com
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] xfrm: introduce forwarding of ICMP Error messages
Message-ID: <f6ef0d0d-96de-4e01-9dc3-c1b3a6338653@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Antony Antony,

Commit 63b21caba17e ("xfrm: introduce forwarding of ICMP Error
messages") from Jan 19, 2024 (linux-next), leads to the following
Smatch static checker warning:

	net/xfrm/xfrm_policy.c:3728 __xfrm_policy_check()
	error: 'pol' dereferencing possible ERR_PTR()

net/xfrm/xfrm_policy.c
  3700          }
  3701  
  3702          if (!pol)
  3703                  pol = xfrm_policy_lookup(net, &fl, family, dir, if_id);
  3704  
  3705          if (IS_ERR(pol)) {
  3706                  XFRM_INC_STATS(net, LINUX_MIB_XFRMINPOLERROR);
  3707                  return 0;
  3708          }
  3709  
  3710          if (!pol && dir == XFRM_POLICY_FWD)
  3711                  pol = xfrm_in_fwd_icmp(skb, &fl, family, if_id);
                        ^^^^^^^^^^^^^^^^^^^^^^
The patch adds this assignment.  xfrm_in_fwd_icmp() can return both NULL
and error pointers.

  3712  
  3713          if (!pol) {
  3714                  if (net->xfrm.policy_default[dir] == XFRM_USERPOLICY_BLOCK) {
  3715                          XFRM_INC_STATS(net, LINUX_MIB_XFRMINNOPOLS);
  3716                          return 0;
  3717                  }
  3718  
  3719                  if (sp && secpath_has_nontransport(sp, 0, &xerr_idx)) {
  3720                          xfrm_secpath_reject(xerr_idx, skb, &fl);
  3721                          XFRM_INC_STATS(net, LINUX_MIB_XFRMINNOPOLS);
  3722                          return 0;
  3723                  }
  3724                  return 1;
  3725          }
  3726  
  3727          /* This lockless write can happen from different cpus. */
  3728          WRITE_ONCE(pol->curlft.use_time, ktime_get_real_seconds());
                           ^^^^^^^^^^^^^^^^^^^^
Potential error pointer dereference.

  3729  
  3730          pols[0] = pol;

regards,
dan carpenter
