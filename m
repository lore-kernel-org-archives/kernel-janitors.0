Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906C1509B2
	for <kernel-janitors@vger.kernel.org>; Fri,  3 May 2024 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714736288; cv=none; b=K6MODJkRePL7KGr77OGY4SwtZ81HGBSqHsJr3/n1sTVRg3LwkL0SWkE7XCXIYYLYdqjJkdSutXo+U6LTWgTe1NCvhe266K1ka03QAH/OgXrBDJl+UwxzG7uOJv16APQZkTmy630Pq+eF0wszzxLInNV0hk+zG+RvkzxFdKadCio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714736288; c=relaxed/simple;
	bh=2mFwIyJjhlyZVBLu3QUcc225c9YGrTsjtcIlVVK9h4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJaR3LzRmOCKCyeoVruia5zu4OH07fTyG6VsyGAiMK8jVbQ02FxSpJcJPG3n/TYj2e7/NpVcu7C+ir+bWPDRmRnnOpnf4MFsRFvM8sptRnzKqAWZL8hUVxnpKySZHj5PbBIwYaO+WBXkjzdhfknR3zUqwtOtC060V1pJDAUMKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XizIh0rW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XizIh0rW"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41a1d88723bso64380245e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 03 May 2024 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714736285; x=1715341085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLQCofPdnJ63uOr5tDqjn2YZWUonrylBn211XOLOE44=;
        b=XizIh0rWMaGtGbkF5dUoT3wX2ZbEhrBEWDLxu3KA74Dk8WkpGgqsXSvlCyRaq/SPnt
         d2cpaOkZSUR/Y6M8KTAo4H4nFmQBQNbghTM3aHNeGjZYm/A+OvMbDdBviW1gMr+zoZT4
         MrSlqRIu1K4zbOHpHU4ThYpHfSzncy1vqlKvwNL3RMTzk92J7lMrPl+hU3kDn34AFaXz
         FF0Y29A3ouZjpLFvDHwHbVseEbC1RZLgYQXisZjmhqSh9NMmQsmbtt1q/65KFVfZffml
         xalTMZ40rCcRN3QURAgeb5tt8CkVZmJprGW/5YBwD+glgRqaCWeU7m070tevUbfVwk5V
         iqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714736285; x=1715341085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLQCofPdnJ63uOr5tDqjn2YZWUonrylBn211XOLOE44=;
        b=u+VffmCmU3BLCLygYLqI7DI+zFvS4hpoJvkDuJgB2CwtL2X7uBvibZtTXPjSq5Rb6+
         oZiHr58fTqE1vS2XLur2c3RQSzENLsF48Y8nIGLDduigcfBXs64xXtC8BZnYG1Xq94/4
         W/mRIXWL1ZAyI1f+2HH4cxblS3nLY3JS5gpF8FB/+6X/LaVMJidEKtBVRTgBr3PHQd+t
         oKo4hImR2MgP2GHde3YYkzNNvNNDviW669i2mtBaAKPyuxH3pxr3oZpXoWptmy6R0lf2
         wsgkymVDlOFGVbnUa1HO3OJ96xBTkcyGUCsAeDBSiWbcfIgHyD4iAT1ZLjOsq8cmYT3D
         MxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUscR0r8sXUwmkjzNLR15dnZFKAgTizTJlNGdrEDr2U1EDQ6iBd3y0Icg0A6576kufaljZG99rmURvYWgSHw7ea0EiiU0PRzb2gSqrQOpVV
X-Gm-Message-State: AOJu0YytoWLWkGLy9hgwZRbSjXlgMrw72n5XHt6K+JXU0/9ZOH8fGeMi
	XNVJ4pwWTbnK+8mA55cDkQf76M5UyqsEa7yI0bwrPPbufqXuP8V5zpHv23qifn0=
X-Google-Smtp-Source: AGHT+IEUFq74MPGIgnW3XCqkUsaInfSWPvUq0gwS1ToGTdl+wAiuIT9mb9JtsW4g2vBgPQlcLO6dgw==
X-Received: by 2002:a05:600c:4fc3:b0:41a:ff7d:2473 with SMTP id o3-20020a05600c4fc300b0041aff7d2473mr1857856wmq.4.1714736284563;
        Fri, 03 May 2024 04:38:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b004190d7126c0sm9131680wmf.38.2024.05.03.04.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 04:38:04 -0700 (PDT)
Date: Fri, 3 May 2024 14:38:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Reuter <jreuter@yaina.de>,
	Paolo Abeni <pabeni@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Lars Kellogg-Stedman <lars@oddbit.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v2 2/2] ax25: fix potential reference counting leak
 in ax25_addr_ax25dev
Message-ID: <e471ec93-6182-4af0-9584-a35e2680c66d@moroto.mountain>
References: <cover.1714690906.git.duoming@zju.edu.cn>
 <74e840d98f2bfc79c6059993b2fc1ed3888faba4.1714690906.git.duoming@zju.edu.cn>
 <6eac7fc4-9ade-41bb-a861-d7f339b388f6@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eac7fc4-9ade-41bb-a861-d7f339b388f6@web.de>

Yeah, it's true that we should delete the curly braces around the if
block.  Otherwise checkpatch.pl -f will complain.

The commit message is fine as-is.  Please stop nit-picking.

regards,
dan carpenter

