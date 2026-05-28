Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B202836F
	for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2026 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779928347; cv=none; b=GC4uDHbfJCQVqJ3wyKljq3zr8BEsnhdDSXvl8FU7wEV7QWLBQqMSsEkFm6ObSsHHndg4xcbSpnxBdSHCHBHD2Rljb0/mRfx3zzQ7S90S9AQsIfXO5aDpWsOTzAnSJfO5qC/fFVmJgR2DT5AxAWtOKf3N0c1F1oMq6d+qsmkEhY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779928347; c=relaxed/simple;
	bh=SIdgCfvVi8ryrtDQzE292WHB3pDjoSEA5ktRL6ryWJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGkZb9HybBtORcU0lmUn73P8OING/H4/QsR3ySy2Igp0+YZSxl01RGNmZkYI5V7X10PkZ+e7E0cTBH33dhKKAvL5Um2uJVuc+NUCUwK/8ClYIDaOCLLD3OYFBFkyU2TaGwXNWlP9MccQyr83bdIEHDagS9i4I+j+sMjVBJSUCek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dyisPlEH; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dyisPlEH"
Message-ID: <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779928342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NU+WkG0JMZCGGSqCR8dN7ZBIBOJxhf8qjGX+ma2NsKg=;
	b=dyisPlEHNGROmDO3PIu1xSoLKqbJ5ya7lkt4PEAUuiOJahBM0lcV7KL1qiKyDISpRWGvHn
	PU9aaAfjRJt1t0zYYK+VV8AbVWnhtYyWhAho5LVkMGWMq37hd+4E6BJrMBblf7z4Ug1ArL
	mdEYdaIAxL+2EOtvyfHtndikc337ELA=
Date: Wed, 27 May 2026 20:31:59 -0400
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm: zynqmp_dp: Fix uninitialized variable in debugfs()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <ahP3Xagt1LJrhmFl@stanley.mountain>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ahP3Xagt1LJrhmFl@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/25/26 03:16, Dan Carpenter wrote:
> If the *ppos is non-zero then simple_write_to_buffer() will not
> initialize the start of the buf[] buffer.  It doesn't really make sense
> to allow non-zero values for *ppos, so check for that at the start and
> return -EINVAL.

non-zero ppos seems to be handled properly by simple_write_to_buffer.

--Sean

> Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 7fb11b0a44f0..847179476041 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1888,6 +1888,9 @@ static ssize_t zynqmp_dp_pattern_write(struct file *file,
>   	ssize_t ret;
>   	int pattern;
>   
> +	if (*ppos != 0)
> +		return -EINVAL;
> +
>   	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf,
>   				     count);
>   	if (ret < 0)
> @@ -2028,6 +2031,9 @@ static ssize_t zynqmp_dp_custom_write(struct file *file,
>   	ssize_t ret;
>   	char buf[sizeof(dp->test.custom)];
>   
> +	if (*ppos != 0)
> +		return -EINVAL;
> +
>   	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
>   	if (ret < 0)
>   		return ret;

