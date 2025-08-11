Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3C1DF97F
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Aug 2025 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907385; cv=none; b=Xa0WxmjWAbDhNEgR4Or57NWM/sMsddv0+UhZKvjtIeU2EtHZO1lyBErGlD8zNzvwRWEx88a2NnoYf3SNf+RNtGyRdPAOCZkuSOY4e54x+o1GBkcq/IRU00QQq8geVwh1BdPVZcAIpz23yXg28MNUFH+NiIxdqZWQwWPB6LZ5dUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907385; c=relaxed/simple;
	bh=lhpccEjV4JvXC3iJXVnLG/g4BG5pKPBfPXPY7b7oLTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrkPFsWJzu4wpUqSV5DHMwqFaP+/pHSL9m8wSQ1q6dyvQ+gxWnu0MJupo0shJ/kFvr4eU5x30Arrf0KPgj+s306p5uUSJ1RQtNTObKsypyZcsHCYja8Z31w5s6AIYKcfoWqvLFnve+riAmaAx1pcABUehh6unltqAHQLzChjDMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5dC8xkT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5dC8xkT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b7886bee77so3153801f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Aug 2025 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754907382; x=1755512182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSpiiISpNVr4gQnCfkPUN2zjFrHk7VxPQMyKo4/lvmI=;
        b=D5dC8xkTcp3nFS538JH/hhv3krHlFCGwSBKAPtiByLb0kp+h8+Ll+BSqGkQbb0kEhu
         N9DpzYFtK94ABxbbbVGGw+jYDO2zgDpZhyA38ocwDE9mqk6PNoC6DOZ8SLnIu8U3MVfq
         kDb/qP7Y1SiPm581VJypfLvf07WKiqVafH5qjDTh50jZAqo0JGsidTpWi72V58sPlIjv
         dWUkjqUnQI8dGD2nFNYinpn28TfrvR/QRwlEq2ZQ2dt0ywi/eax/Pe6W1HyyIKYIGGy3
         crHLykKA6MfN7NCckrcv/M+B/HjsIGOP8nFtDGXqtS37k2o8mhyz2MSjp1C7qoq6tOig
         d4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907382; x=1755512182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSpiiISpNVr4gQnCfkPUN2zjFrHk7VxPQMyKo4/lvmI=;
        b=U24Mfm1vl3UaDU/5XstUAcpNze9Je+1ZtVxBS3Us3DFStJOdHALUba+cK4oxwJ3sHw
         IQr+QkOpDMBKyfEuMyesLMLT7paJ5dsWqM8r3PTAuBFmoVhhPk2XojCMqApiSaDpJ2qn
         xfC4Hvn7/hVOF8ivD88jzshF6BNS04ak/HnO3wfHNhBCigJ3yLPj2gZKDDBlbsoxvPUN
         WN18EQaQSQFE3u207fkVoE+ZkdhxlIUl8zzyN/Y0H3+oV612M/XOGWbGNEOHepvjuaeS
         zoAEK2knK//zkdASIDPPuga98+lyBr4z3COfpapWPRwJYuLg7t1gePV7B/3Fr9bVUV0h
         wbVg==
X-Forwarded-Encrypted: i=1; AJvYcCVMd9zJkaXbVMPIPH1w0eKv9AslImqwBYZeD8NHmYr0sx7M51MPq5MV7qfIJcOqPIwHcNa4maX7TL1GiRMm5kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI3/FJVgi2XLbRWtWe+0QZwrVjv+XGscgkvCc3waJxNO2qRHop
	1yBmZ0PSml1zCt9n1iCEmYeDIpVnttOCKF9ziPXbfWiDHGJyErkFGlMgNVH06HQIs/8=
X-Gm-Gg: ASbGncs1sppOX9HzfL5/PK8S1Mn9sVhTi1TCdFnkKSZhGGp6O6Xq2qPlLIYYf6XyUXe
	PIInXT+BqwI9COdmjDt0y8Bj4BztZxlukWTmMkM6cZt1qOS5ontcopAo2ng0HBjSts7Npf/TkUH
	QRyCoOnHifIyj0apMbF1lB077Sl7uWqNlfShgTKLbMnQVBORYN6ODIMIlaolrdLXJb2S1DvguJN
	gw0KPhCmlcnvSeP6e+GOs39y+knWytKeeyd6/wm1PfqrDEkv8IHKbqYv6g8XgJedZDGViRw4rIJ
	KAVhdR/DR+WXZJo1HEtXVCtztIOITzbnDxqT1azpMizXY79K0zhk54CeBsn/TPteshjxrHCUJb+
	1MabHSZ6GMcQGTmfrK1U2igSEM/6bXqVw
X-Google-Smtp-Source: AGHT+IG9ux2smHHV5RyT3jUtDRzIFajNvscvOmDcbzXkqY+4Xp89HRJqljXFsBnzKFxpMyuKABzgxQ==
X-Received: by 2002:a05:6000:18a9:b0:3b7:e3c3:fbb6 with SMTP id ffacd0b85a97d-3b900b7b012mr9878088f8f.31.1754907381530;
        Mon, 11 Aug 2025 03:16:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458b8aab8c0sm382668595e9.19.2025.08.11.03.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:16:21 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:16:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>, dmaengine@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Fix dereference on uninitialized
 pointer conf_dev
Message-ID: <aJnC8CLkQLnY-ZPr@stanley.mountain>
References: <20250811095836.1642093-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811095836.1642093-1-colin.i.king@gmail.com>

On Mon, Aug 11, 2025 at 10:58:36AM +0100, Colin Ian King wrote:
> Currently if the allocation for wq fails on the initial iteration in
> the setup loop the error exit path to err will call put_device on
> an uninitialized pointer conf_dev. Fix this by initializing conf_dev
> to NULL, note that put_device will ignore a NULL device pointer so no
> null pointer dereference issues occur on this call.
> 
> Fixes: 3fd2f4bc010c ("dmaengine: idxd: fix memory leak in error handling path of idxd_setup_wqs")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

No.  This isn't the right fix.  I basically wrote out the correct fix
in my bug report:
https://lore.kernel.org/all/aDQt3_rZjX-VuHJW@stanley.mountain/
Shuai Xue sent a fix as well but that patch wasn't right either but I
didn't review it until now.

It's easiest if I send the fix and give you Reported-by credit.

regards,
dan carpenter

