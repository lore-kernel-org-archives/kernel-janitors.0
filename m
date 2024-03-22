Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4A3A8C3
	for <kernel-janitors@vger.kernel.org>; Fri, 22 Mar 2024 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711107247; cv=none; b=M3mQvcf+SvoLZKZdxo4UB3Do2A2EH/nZsi8dK/lORu17lmRYK1yRMwxeyoF7tAe05+zXSQRMibMRj338bf5pkkkQx/RcWrdaKD6DwnpftZZuvI5UBOYNM+ZVUBDJtqH490xNIZoveCEyjqj6T7bCr7YhWEqcSZPylf62OFpD838=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711107247; c=relaxed/simple;
	bh=EDLSzvHWzWJckccgae9InvdeABzJhvqCfI6ieGm1XfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cItyCMWGfI+rB/Rv21qz1B9yVNusjIQc5DdjArJyYC9QAi5rAeftaCPPH7ohW2VvOC4sAKDdB6h/Q4g+XibXDYRtm34kfbRfFRNfGvxduu732QZDNpO15/NayMWWvbslNC85zg6vS/lO32UV51BC068dvs6NpJ8is8Q6wIHGZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=okH1hJuq; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="okH1hJuq"
Message-ID: <3140f17b-f7b4-4705-877f-df2c0af460d2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1711107243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t678LVHSCoxay4XYSJ0VwadhX/XRd8hTe6DYJoC6mOo=;
	b=okH1hJuq01MrIEXSupw5A53MiUW/2sSEI/CQAe86vH5rhfU/RMX0OWgs5aFfX1JjGmV2GW
	SLYsrw6Wch8TknYz3eqO+exU46APFpUXiNS0KqhsZ8WqnLI/kjuUBetNm2TSieVCaO4XK3
	p0X42SIwucnQ0gwKMSL3lOtd9lGMAVM=
Date: Fri, 22 Mar 2024 19:33:56 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [next] drm/gma500: Fix spelling mistake "patter" -> "pattern"
To: Colin Ian King <colin.i.king@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240314163511.2372458-1-colin.i.king@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240314163511.2372458-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/3/15 00:35, Colin Ian King wrote:
> There is a spelling mistake in a DRM_DEBUG_KMS message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>


Reviewed-by:Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

