Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5D7E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 07:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqhF+MjW"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35632DC;
	Fri,  3 Nov 2023 00:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698994807; x=1730530807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P5QWGqi1aXETst95U7iqc5Utnw56ymqQfZ+1ZYzLznc=;
  b=NqhF+MjWo2K8hvjEwjPh5GYiPUJsdFUMzpA/qtBMOtMsTVubaf9XNthf
   TQ87oAGzNIGPam4wLYV6t5A1/0bes5GHaHP3fIdVlEVmKue+GcSy24870
   nLTZRQmQcypDSlm8VbeUMccWjdKKmjzTK40BnAsEq4PTIDbCV1uZAkULp
   iGbrXdyVJgUCnd7/aM7YpJZZTxUzXc2RvV676k0mrJ63cXjJbm1mL+E8p
   uw5AVj7yxWwqmf/ejj/durpzYOBUIyTRotCh70kQZ1bW9OQ9Z2ppQu7lw
   5zoY1ln15j22lWYhLxQo/X8ph9bs5oA19xyhi+RgFFk00vg7do7Qi76Cx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368237876"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="368237876"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 00:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="755061321"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="755061321"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 00:00:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D06E5120F5B;
	Fri,  3 Nov 2023 09:00:01 +0200 (EET)
Date: Fri, 3 Nov 2023 07:00:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <ZUSaccRE_lq5Mizh@kekkonen.localdomain>
References: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>

Hi Dan,

Thanks for the patch.

On Fri, Nov 03, 2023 at 09:34:25AM +0300, Dan Carpenter wrote:
> The problem is this line here from subdev_do_ioctl().
> 
> 	client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> 
> The "client_cap->capabilities" variable is a u64.  The AND operation
> is supposed to clear out the V4L2_SUBDEV_CLIENT_CAP_STREAMS flag.  But
> because it's a 32 bit variable it accidentally clears our the high 32
> bits as well.
> 
> Currently we only use BIT(0) and none ofthe upper bits so this doesn't
> affect runtime behavior.
> 
> Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  include/uapi/linux/v4l2-subdev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 4a195b68f28f..21d149969119 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
>   * set (which is the default), the 'stream' fields will be forced to 0 by the
>   * kernel.
>   */
> - #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		BIT_ULL(0)

This is a UAPI header but BIT_ULL() is defined in kernel-only headers.

So (1ULL << 0) ?

uapi/linux/const.h also has _BITULL().

-- 
Regards,

Sakari Ailus
