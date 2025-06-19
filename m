Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634DE17BD3
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Jun 2025 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750310991; cv=none; b=FAv86jh/YCfSnmdUyr+OyVbtX3iZ7BLGw1wcpvvgMrf/lfH+tU787oIpIUIt99Q9aNfXLBeckXQdTXAxRhatXSTj0sVz9D4Y1v3N51JJv0nQLJGHOd4ozMd6IzyRZ5JM14jYOlnaWmwhvL1qIxSvHkx/LOxtmlyPx7EHqIQjHyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750310991; c=relaxed/simple;
	bh=Q6mJE1FrwhVKG1y6OW4fACJwCs7O6gqcR0V159taI0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS+vB4fK/ZHkeWyDS7LUk9TOeKggyAX3RVk5jzl4beh0bNsuLvXZY2Q0RQN98s+fIujBZeP2orrvmTy2p0lePHsSLBFIppiTi1oMvlBKxlpD7tle1cUqdEAQn8MUPyDIhqhFMToYWyA0BcZdrsgTmddXU38aTMnCSFEm7MPOMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wuj+uGMH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wuj+uGMH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso296802b3a.2
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jun 2025 22:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750310989; x=1750915789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQS9Lxe6KMVKWq6jlz9fspv/s4lvVJZPXjqcxfFFWDc=;
        b=Wuj+uGMHuo5xB0CIZ/O8Pqo35utQzdZvIxdhAx2yn6aTlk6BSDML4N9iM8A3YFcwqL
         HaHjYvxEX49/jGkqccn0CZ/+KclNCZA2aTmR2BhPrjNtBMbRCSkrpgNpXubqDo5LQvne
         nRi2QHoRhMsWmLx59hgDlvFnlElst5D9b2NaVW0/0bYgOp6El2t+FTTZX2TgbVpELhgE
         YsHBfempwTg2YmMue0ekkbiJAob4NklOlR615rMGN3lPpYwG2DHTcveRjLcVFs3piRHT
         FzSfumVg4RQ07Dxkpnau3rbCXO578eTPxT1sYSlPUASNYmc7YlJY6wBjOtTnFXygA1fo
         V4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750310989; x=1750915789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQS9Lxe6KMVKWq6jlz9fspv/s4lvVJZPXjqcxfFFWDc=;
        b=G3Ln3hmIMIr0RCiBqPNLRT735qZ1LyAuV8C/d0osyukaClFba+YWv+kGGai1ODkggo
         +mGB5LSS+iwmgwa9DYVneMCZ4/o2yCEwCmSHBQBRVjtyZlDOLCb/asbADmjlG+SK4Tqn
         Xe3yEDo07RHuaIDI+e6RN8EJW7EJRNWIp4rIhmFAkhDWL51XClmianiyz30TEI5GR88S
         1krW9fne3NGd6rjKYiAIrr9c4vX2SBe6jML774qNd6ZgM/7tJM/HLtnytAZrAzzcBTEc
         MRltg76hCOClLPOhfbtkQV4rblT+JxuIA2ivyxTGmg8UiMnYLldCd56EVO5N0ezKh0qi
         mSYA==
X-Forwarded-Encrypted: i=1; AJvYcCUqkvTFGUpbBVMCXnvvXTs1Wt/FCRawEqLrSLSOZWM4ltIky4EWDwHm/FcT+ik0zrtjDFtDWL9jzaQGjahb4XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjkHx3ORR2BSYX/IhOhT4SS69NFf8gw+NjfC5x+qMuWOFZ8uR
	gjoQJ61f0/0cTiMI9vDoTHriSHQmXb/f39nSoaptpOA0JV2IG75+Cz3GiX5MSZK76LqPARxwK1S
	tv5pK
X-Gm-Gg: ASbGncuZ7f2yyc0jKF9WCBBFYR8KgxJpxLUM0+1r/pyddsOtzOyDHkIA+k61iWrPaCl
	37eD6ysnVn6UYnUEB5t6j8t69s86G6xZjHa/ZQ6NegE1u64C747+ElYTVYyS6eNm88xfSEhke4f
	qiDITIe8+o0e4KbQw2SucG3mGXpHl6DMYgSfjXd939OToZhBHFkQumUFdyAz+mndBuEOGs1dwvD
	ydtOHsQGzooSWS5Q0M4DlSSZG6U5ZNPs1XvfgrIEHr2CUGvAjffalQfjWzm7NlMdrq0Heo02FRa
	ui3muy4hp0E/6Rk//SWZ7q+Fx2ApdRwquVqNKhWfrgkq+KlZHDV2sQCbALMkoHI=
X-Google-Smtp-Source: AGHT+IHs0qkQQ9P1OW9zuYuVIZrbXgPrpgwTWEkKN73iA54Gmmj/4HG7CqyvkiEQR/yv4yS/zeyBYw==
X-Received: by 2002:a05:6a20:4391:b0:21f:5532:1e49 with SMTP id adf61e73a8af0-21fbd5825eamr34809155637.35.1750310988725;
        Wed, 18 Jun 2025 22:29:48 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e0fb4574sm3604428b3a.114.2025.06.18.22.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:29:48 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:59:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in CPU HOTPLUG
Message-ID: <20250619052946.nx4mzst3rxyfxhod@vireshk-i7>
References: <20250616140108.39335-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616140108.39335-1-lukas.bulwahn@redhat.com>

On 16-06-25, 16:01, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current
> CPU ID") adds the file rust/helpers/cpu.c, and intends to add a file entry
> for that file in the MAINTAINERS section CPU HOTPLUG. However, the added
> file entry is rust/helper/cpu.c; note the subtle difference between the two
> file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
> complains about a broken reference.
> 
> Adjust the file entry to the intended file.
> 
> Fixes: c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current CPU ID")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
