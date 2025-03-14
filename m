Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A69A28DB3
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741960211; cv=none; b=ishltrrrEwiH+iEeaHE7CvJUEDy8s10cc2Nq6qXTOQ34kPPbW6y1KaFYfSNwda4xxjyOO8C79cJ+6iQRQ6FSqWMaBS91nBFMdq/AbUyhH8/YpkRR4lhgQsr9pQbcMFfdpStu6aOVaT+kDuSvqHPykkadksP+T4NkYHGNhQ2bKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741960211; c=relaxed/simple;
	bh=N27tQOxuW3SUk2tPx2DZBX/49OMRCP/DSgxSm/h7W1g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TM5UWb+1fYS9eWjg8fEUKrzl1RoVyJfvPPvmFvLyyJwdMnZ2volIo+iJH7/Ts2vp5WkKTeVgU5pIBiUhWZBW34qvJ3SO4rAD7j3PofpTrkqHlJsXco51PTmKT/BLKNySnN0hTNYuGcSSl7kXW27kxDJq751vUn48evTe2Taj0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=jxlr/ChD; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="jxlr/ChD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741960196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjqPfczUqBdTMrtHlSDdRiCcbc6NaYyR8NlMI1cTcwQ=;
	b=jxlr/ChDjPwqGapJiMF/He1YHfzKVUiMqMNv7H0p3M0UtfWCDRBd9cOEBhlPYSjyJFjV51
	ZlCc3XNzHLVVOnwIFLCNgnmV70zKjv6ebaA0iJJiWqTl345NSINQ1mwMdO6xj0ZPaV2bPL
	VtoKOG1CVteUhSfIk/qmGDgkq10X0meASCdkC2zwQifHio86wmXC6pjzFVkoogYcq/Q51m
	hmAMOQEJ9644ZkIipQz/eES66hDvLzk6rx/UMBbF2+IJ9yjDVbTd0GSBltj24OaY8Lfzrb
	i8u+aEGn0ESAUkfZlKsQawkaIUZt7GJA0GCsZNywA1u7IDGKexolbP2wnACD4Q==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Janne Grunau <j@jannau.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
References: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
Subject: Re: [PATCH next] drm: adp: Fix NULL vs IS_ERR() check in
 adp_plane_new()
Message-Id: <174196019326.15076.17884484110903495475.b4-ty@rosenzweig.io>
Date: Fri, 14 Mar 2025 09:49:53 -0400
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Fri, 07 Mar 2025 12:30:58 +0300, Dan Carpenter wrote:
> The __drmm_universal_plane_alloc() function doesn't return NULL, it
> returns error pointers.  Update the check to match.
> 
> 

Applied, thanks!

[1/1] drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()
      (no commit info)

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

