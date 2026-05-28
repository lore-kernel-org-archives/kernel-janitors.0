Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166B352FA5
	for <kernel-janitors@vger.kernel.org>; Thu, 28 May 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955282; cv=none; b=Em5WpElIzLRGjYXZwYCP4M2oKp8JaxqBTLe8DPUF8vecOo5dmU+yKwfywwRcgCsAnRJxjlZcApNvOk3AjRM8xvlxUuL1eeqOyUfT1DGRpwFnaUxg7oZU4tbY0r9h10hB8IPueJwmtU5w1mJ1vvxJrz8BohC5PxKw1Mr5MVkgDPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955282; c=relaxed/simple;
	bh=7Q+oPQZDyhnTDekREt1PDvRyE8IUHZ1dpVUnsPssGds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OhbjeANgp+QlqG1bEfI7c91rKoIUughQ7mEOOrCDWC9GmEyvb/JQ8l3+0gY3InKLASnSakkdHiHRH4zKgzuIaPl2dTYZo57SSbMMjrCDEWAuwncu+5xG001DEKz/TqGhPfO8NVsIeWzcRMertQKEuDJDXvOkuuZwfFkTH5WnA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sigEYBE9; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sigEYBE9"
Message-ID: <9189701d-168e-1e63-8a6c-f6926029c336@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779955275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BqU1KULHNpKd+dvxOvwz5A4nP7Cq63wMOTMOE8f41c=;
	b=sigEYBE9VG+Z7WKjCq6mMqJ6An2dyD6r9Lrla0s3BB0zMiKJHdpR3N+nLodLHJ+C5XkfeO
	Di2f0oyz2YX9JdWcKHiX+SyjMdr12qfPYBbptiY4A19UMS9A86esUUFaKuFuL/C+oO0Tdc
	Sbn3/wI0m2vOEP9/ScSKCwsqmq4+IO8=
Date: Thu, 28 May 2026 04:00:53 -0400
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
 <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
 <ahfeOh091V3BuuaB@stanley.mountain>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ahfeOh091V3BuuaB@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/28/26 02:18, Dan Carpenter wrote:
> On Wed, May 27, 2026 at 08:31:59PM -0400, Sean Anderson wrote:
>> On 5/25/26 03:16, Dan Carpenter wrote:
>>> If the *ppos is non-zero then simple_write_to_buffer() will not
>>> initialize the start of the buf[] buffer.  It doesn't really make sense
>>> to allow non-zero values for *ppos, so check for that at the start and
>>> return -EINVAL.
>>
>> non-zero ppos seems to be handled properly by simple_write_to_buffer.
>>
> 
> It's not an overflow bug, it's an uninitialized variable bug.
> 
> The simple_write_to_buffer() is designed to handle partial writes so it
> leaves the first "written" (scare quotes) part of the string as is.  But
> in this case, we can't handle a partial write and the first part of
> buf[] is left uninitialized.
> 
> https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is-complicated/

OK, that's a bit strange. Can you add this to the doc comment? I certainly
missed it when looking around for appropriate functions.

And I like the explicit copy_from_user variant better, especially since
we are setting the nul-terminator anyway.

> Also this appears to be dead code since fops_zynqmp_dp_pattern is never
> used.

It's of course used in zynqmp_dp_bridge_debugfs_init.

--Sean
