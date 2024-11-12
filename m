Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D3C1FE0F1
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731422530; cv=none; b=QegbbstW9xjYxkJktUe5EVM5XjCpPXD7JPegaPdtBLL4Dn88jWwL49FZN9sQDsNYwmBBKMGspUIdjg/h4nFV4LTNCx6q4OMeRrBhgYihxNNc6HnSgzi3zGD5NQlxboPvCZh2c5BBauLyDHQ/qeEOiS5cTss/fZ6CfYfekAHiVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731422530; c=relaxed/simple;
	bh=C55enUx95lzHdkblDU+VDmJRQxUKFGzKW2v8XrKPHNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rjrq39T0QS0nzf8yqbbeH511r78wotJOS6XH/xfdFczxGfJHuCbbp9v0sM3R892TwRRcugBqKzK00C9lVCR7YEjWTHBffZCf2kx5tKohLFteAWmbIlt4XmPIsdvjN/gVzx1Z5QXNYiYtGn0pWvGnz4olmXme8vuJPdGzDBKkVyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nCt+95HR; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nCt+95HR"
Message-ID: <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731422522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TjtCuBHtQgDpU3KQOdG6+r1FPPieI5NsRRxpX2bOTVg=;
	b=nCt+95HRT/HZ9j+8Iud0gJu10W5OMu+C9+GoNpLHisBXJCDIyhTT6aebp5aN5fV/EiM+1R
	n7hYjSLiCSfA3qiuOxDHyPUgLsVe4H+CKrNEH3UuzayqLotGsBxOgsHLaPb6hkJoWaUBmc
	CnfZaHKi7D6ckeK8Dc5H4SR/IGcev4g=
Date: Tue, 12 Nov 2024 09:41:58 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20241112052754.GB21062@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/12/24 00:27, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
>> We added some locking to this function, but accidentally forgot to unlock
>> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
>> 
>> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
> you've added in a7d5eeaa57d7 with guards ?

I have no objection to that.

--Sean

