Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48013226888
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Aug 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909214; cv=none; b=X47AisBCaHoy2fyTJAV6tZQYYe0pbgKqr7E3tGLJFbRDPRfYjpLcOQM70SJnJN5qhTOy9rGqqGXuIbSmSqo2Z97+Re+79sQS+aHavdhi2S7nPitRbmRHq6Tf/AmPGi+9hgWT0pFNawBKGIV93vNjfrHiSL05L4k3cJBbkeIC7r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909214; c=relaxed/simple;
	bh=KQjwCDSr5jTF/NVTREyzCmEWp0l/PPEJli2cAxTuyEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcLrhr6r+Xab7/SASl30kaXUONSfJwTaWGJ8lwO/vXVwtkYgTU2m1eqaqLxSGs7MIP7+4Mhi6X7s5TvsD8H/Ls+n4rFifqnE6vPFws7qL3RN5+PFXU0426AspaaZMS1SstHNjjlkTe2tQWxoVThkgUYpYgWqIbNAJPCLGNMYEsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4gIi4V/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4gIi4V/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7920354f9so3486500f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Aug 2025 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754909211; x=1755514011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CtlLyamwVwRjM02auBJdL15wK1iRYbhmPTYPeAKkJwI=;
        b=P4gIi4V//S7bTvnrSDnZHHsdev+ZeWw6XeLLEqrznSy03dNjB0KQNo8hERHpw0bXGq
         ot/cG//W615H9nwmjMZB7LoExvo66ppVyFkyDX/fq61akCdcahmLVFeLw3yMHVn+aGyJ
         rFgnlGS+eDr9XHFst/WVZVh5rxCQp28qBRuwiWER7bjqSMF151l8gULW79DpAcAzh97n
         0PsIGKpZC8un+jt/MhDWTPOsBEiE5uiRa6iktpRFmHrxwX+d6VRkbcoMGl62kXWtR4gZ
         luY9iKHHPtufetwe593vvO2ZygEZboCx42QyEQgoS99oUrIxyj+BXCWx8SQDJbfhI5Zk
         eLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909211; x=1755514011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtlLyamwVwRjM02auBJdL15wK1iRYbhmPTYPeAKkJwI=;
        b=M6i3m1OrjHDXCGeRPhvnXm4m3Ieh0uYdsRj/Gugk7i7lZOGTkh+d8rtbLMQc1ougOU
         Wd90MzP7tb7nPJoLJRM6nG5bcqykKfHBAGpqK6vXzyGPvA+YswHui/u90Fvq7sSqrnmV
         KTG6dRR03xu/QH13mggjzM4mWuwVcXKpmo4cqmKZvTEXk7SP3xIBwjbmG4Hj90BjvIff
         ugAiRNlWAYaIwC8dSbid+Aptle/66uQQA8nuhcaM2VJsTsbSHy5EX5oyK3YaxVrK1JzW
         3Unc4BPgxzlacFFfLX4VH4TKaiGO6kjbRvUDx16/9I9ql3hDBKZiaJTxFeo/KWKWYgqG
         xU8g==
X-Forwarded-Encrypted: i=1; AJvYcCWYnZEFpfGhE/xnkbczFHwB/Z9pODW7NFsTqItLmBvYu0fCJ+7ab1yMJuOa0aZNXRQe98v6G3gHEteLlkhkqrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO87KN/6xeJc3eYbjVn0XeROWQFHv6alD1Yop++r4dAb0eOFi6
	C9fpuJU9ZQIPtb0wDqPYiVjbF3chU63ULo8LxPgnLws88OU8PapAV5bEPcYHTCOY/E8=
X-Gm-Gg: ASbGncsOY/PD3FqQ3UOhKynTXPAhguOQsnfPvBqsg46YnEpHtqQlPqZHpIBrThp7PIi
	lU6wCHjGR0edLSa2nHoLpWc6gf100IrMy7R0uIej1IS8KdqX+uV86FBF+8KUSX6pIdhu0aDKbXS
	G1HdzEaeAb25+XdI0hVnuaY0wBRBbf2S2swf69kNVFyE8RzZicvGRg3+EQDTq6b7m3KvIeC25hd
	/jNrurDLpna0zR8pcnjE/GTajfQAqbHuEF+TPbSpU/RDObmGvgkkQvwImCDkcN1VEwa8waC26LZ
	XlfKJylMNPjktDfTMYrXZ2Z0RLycocqsUVxvSuoZM2Ls02U+wm3prO+VP5Tx0P/KNyJ/J313bA2
	6b0XdT0qt41hOP9Ng4Y7YYC7/+po=
X-Google-Smtp-Source: AGHT+IEqVTwXhwTo7wvqPa+EmRjt/aKNN/yf02N51BBRSP3bPmO4761RJTTOJAX9B9e1QYT6x1ySSg==
X-Received: by 2002:a05:6000:4305:b0:3b7:76e8:ba1e with SMTP id ffacd0b85a97d-3b900b4bf24mr10266286f8f.11.1754909210556;
        Mon, 11 Aug 2025 03:46:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b90fdc85a4sm898125f8f.60.2025.08.11.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:46:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:46:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
	Fenghua Yu <fenghuay@nvidia.com>, dmaengine@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Fix dereference on uninitialized
 pointer conf_dev
Message-ID: <aJnKFa9YHc-pYori@stanley.mountain>
References: <20250811095836.1642093-1-colin.i.king@gmail.com>
 <aJnC8CLkQLnY-ZPr@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJnC8CLkQLnY-ZPr@stanley.mountain>

Actually the error handling wasn't so bad.  It's just that one error path
which is buggy.  The idxd->max_wqs variable probably can't be <= 0 (I
haven't checked, but I assume it can't).  Anyway, I've sent my prefered
fix but an alternative would be to do the below.

regards,
dan carpenter

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 35bdefd3728b..b603d7dacf3a 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -195,6 +195,7 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
 	for (i = 0; i < idxd->max_wqs; i++) {
 		wq = kzalloc_node(sizeof(*wq), GFP_KERNEL, dev_to_node(dev));
 		if (!wq) {
+			conf_dev = NULL;
 			rc = -ENOMEM;
 			goto err;
 		}
