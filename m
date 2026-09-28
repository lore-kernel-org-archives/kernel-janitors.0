Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C181632470F;
	Mon, 28 Sep 2026 20:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627470; cv=none; b=tVQn97VjqKVc8bwzTCbPpjjEwGZTG17U7c6NLs2JV7b44n1Lbx3ogiuxHF78NUxqiZSpmAKBpSVH7fwDIoRFyu5O8Kq0qvzE+sfMUMc06mZZHJk325TveidYHZWmK3ZB2JhkbQirzlIRo4sA6lIjqFxzSBbWg6hVDTeithNIgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627470; c=relaxed/simple;
	bh=2F+hPDFbwnoZcyw8wrOklAYNTScHJfPxXqNOlhubNeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqBI4eurL4zrLv5h2knngFAFCJo/I94YjTbWq7yJzxPTF1DYFoe5dy+KBGiU8LrdzqI54Pu1Bw5C+S4FOezW6Y2J1EBDQkeskOqYSppY8sT5mx0FmQ7kzBY94yZiU81JtgkL4Mz/4IpZKkmNIguFRvG9X9yJJ/OI377OH7CBqvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e/bDjCkZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e/bDjCkZ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39BEBB07;
	Mon, 28 Sep 2026 22:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790627356;
	bh=2F+hPDFbwnoZcyw8wrOklAYNTScHJfPxXqNOlhubNeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/bDjCkZiYzUlgujPH1WYW2cXsBDpfnQ6Av59JkFcjClU1zByiDQwsLVvWr3ninWA
	 LSJaP7r2eqTYKRjoUxyEhlQ61TT5rvYxtJtPKtcoI/lKPIhmMzMQIsVg351mxoTHhr
	 /P0mKCFHAiyTD7jBqvUqzCSPMj4726wLRbty5BRI=
Date: Mon, 28 Sep 2026 23:31:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <20260928203105.GJ4406@killaraus.ideasonboard.com>
References: <aq0siVcghDe6x9cs@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aq0siVcghDe6x9cs@stanley.mountain>

On Fri, Sep 18, 2026 at 03:20:25PM +0300, Dan Carpenter wrote:
> The "idx" value is a user controlled u32 so we have to bounds check it
> before calling test_bit() to avoid reading beyond the end of the bitmap.
> 
> Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

What's the status of this patch ? The issue is a false positive, do you
still think there's value in this redundant test ?

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83f1d..f157ed99be4e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
>  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
>  				      u32 idx)
>  {
> -	if (!test_bit(idx, &mapping->menu_mask))
> +	if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
>  		return -EINVAL;
>  
>  	if (mapping->menu_mapping)

-- 
Regards,

Laurent Pinchart
