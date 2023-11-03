Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A47748C
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFJBIYY3"
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A5F1A6
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 00:51:14 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so2833126a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Nov 2023 00:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698997872; x=1699602672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ym9iX7EdVXR2S6+R3iz+Hbxqluck98fveNsf4rAlw5s=;
        b=wFJBIYY3Rv4/6uycQXr4Szf9aG4Xhq/8UPXKklJKS5PWMrOqiXTZIsQ47QTotDxSOV
         R6gz8ZG6EfON2yjecjgFHsBVwc2vbSDTawCWk2qCtwnIHw/x13eJHtwNcBp2s+6qBLeH
         ais5cStdW/R9VdorvxNy8pnKgWshxTJQeVLrjpRXcg4cjbVkwrmy7IpIXcKXueU/PlbR
         6Omc5DB8oZEkWnINcaGxNTPMC/uHpEsrNeblBLVArGXPHflSy/Gd+287zpQ7ZjRBQq12
         l/SSllnUK8Jkl2Sqw4ujsMsD8E14jDGjQ3YMbQGblv7iJUbQDZKFNy2VW8I4J3vtzyvE
         jWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698997872; x=1699602672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym9iX7EdVXR2S6+R3iz+Hbxqluck98fveNsf4rAlw5s=;
        b=RwmAGkR/gEVbqdhZGfTDvtOWXcCV/9q7Lch36ZJB6uNdm/fnPvuBkecEyT67TIU+V5
         0Uuu0R/bYJapj05JxBh26mWVXcx1I7Lu6CTEHSr2NAhD3a+TbHl2KheKRbToHqGZ9Dvm
         km0W1raHz5wOGplJrLygcBHIT08l0heYpJorR97G9pIGP610xcXhsZJ0yTKMFwBlXTeK
         z0oV2xUfyKqYOV9fp+RZf+/zXDshplF7Mqct4lsY8Z+RaENpHaE2kNVzAkBJJDJ7BsWY
         wAHBYyFE2si6G00C3K+D7DQMn3mPamY1iPyzwxf1JTgcr16OEpsonqbLHAB+gCqzYeSg
         JPsg==
X-Gm-Message-State: AOJu0YyDeg9kupzsm+WFcmA51FSXHrV2MVyWdbZ2+fy9LZFreJfl4Kmx
	ATcGE166y8pF0+Q8w50doPUV0ViWDuEEJ8CAH2s=
X-Google-Smtp-Source: AGHT+IE56psjBxpQCnc3Bqx2RcyPYqJU4DYoIjaR8309BRNV66jIC2XAtF385K8UpSiUOawkV6z+lQ==
X-Received: by 2002:aa7:d1c9:0:b0:53e:5dad:dce0 with SMTP id g9-20020aa7d1c9000000b0053e5daddce0mr17131881edp.3.1698997872428;
        Fri, 03 Nov 2023 00:51:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q22-20020a50aa96000000b0053e3d8f1d9fsm665918edc.67.2023.11.03.00.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 00:51:12 -0700 (PDT)
Date: Fri, 3 Nov 2023 10:51:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <f47de73d-7741-4c2e-8a15-41264fb91e56@kadam.mountain>
References: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>
 <ZUSaccRE_lq5Mizh@kekkonen.localdomain>
 <f335560c-af40-4bed-ba3f-46a9efa339b8@kadam.mountain>
 <ZUSiGbcoutTPErJH@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUSiGbcoutTPErJH@kekkonen.localdomain>

On Fri, Nov 03, 2023 at 07:32:41AM +0000, Sakari Ailus wrote:
> > > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > > index 4a195b68f28f..21d149969119 100644
> > > > --- a/include/uapi/linux/v4l2-subdev.h
> > > > +++ b/include/uapi/linux/v4l2-subdev.h
                      ^^^^

> > > > @@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
> > > >   * set (which is the default), the 'stream' fields will be forced to 0 by the
> > > >   * kernel.
> > > >   */
> > > > - #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> > > > + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		BIT_ULL(0)
> > > 
> > > This is a UAPI header but BIT_ULL() is defined in kernel-only headers.
> > > 
> > > So (1ULL << 0) ?
> > > 
> > > uapi/linux/const.h also has _BITULL().
> > 
> > Let's just do 1ULL < 0.  I'll resend.  Is there an automated way I could
> > have caught this?
> 
> I don't know. :-) Remember to use shift left for bit definitions in UAPI
> headers?

Yeah.  I knew it was UAPI but I'm not used to thinking about UAPI rules.
I only tried to build this on kernel .c files and didn't try to rebuild
the usr/ dir.

I bet someone would have complained eventually but who would have
run into this first...  I see there are existing BIT() users in the usr/
dir, but everyone seems good about using __u32 instead of u32.  Probably
because declaring a variable as u32 causes an immediate compile error
for everyone but bogus BIT() defines are not an issue until someone
tries to use them.

KTODO: write a script to check that UAPI doesn't use kernel types

Maybe this could be a part of checkpatch.pl?

regards,
dan carpenter

$ grep BIT usr/ -Rw
usr/include/misc/uacce/uacce.h:#define UACCE_DEV_SVA            BIT(0)
usr/include/linux/psci.h:#define PSCI_1_0_OS_INITIATED                  BIT(0)
usr/include/linux/can/netlink.h: * For further information, please read chapter "8 BIT TIMING
usr/include/linux/cxl_mem.h:#define CXL_MEM_COMMAND_FLAG_ENABLED                BIT(0)
usr/include/linux/cxl_mem.h:#define CXL_MEM_COMMAND_FLAG_EXCLUSIVE              BIT(1)
usr/include/linux/nl80211.h: *  bitmask of BIT(NL80211_BAND_*) as described in %enum
usr/include/linux/mdio.h:#define MDIO_AN_C73_0_PAUSE            BIT(10)
usr/include/linux/mdio.h:#define MDIO_AN_C73_0_ASM_DIR          BIT(11)
usr/include/linux/mdio.h:#define MDIO_AN_C73_0_C2               BIT(12)
usr/include/linux/mdio.h:#define MDIO_AN_C73_0_RF               BIT(13)
usr/include/linux/mdio.h:#define MDIO_AN_C73_0_ACK              BIT(14)
usr/include/linux/mdio.h:#define MDIO_AN_C73_0_NP               BIT(15)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_1000BASE_KX      BIT(5)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_10GBASE_KX4      BIT(6)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_10GBASE_KR       BIT(7)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_40GBASE_KR4      BIT(8)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_40GBASE_CR4      BIT(9)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_CR10    BIT(10)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_KP4     BIT(11)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_KR4     BIT(12)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_CR4     BIT(13)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_25GBASE_R_S      BIT(14)
usr/include/linux/mdio.h:#define MDIO_AN_C73_1_25GBASE_R                BIT(15)
usr/include/linux/mdio.h:#define MDIO_AN_C73_2_2500BASE_KX      BIT(0)
usr/include/linux/mdio.h:#define MDIO_AN_C73_2_5GBASE_KR                BIT(1)
usr/include/asm/kvm.h:#define KVM_PMU_EVENT_FLAG_MASKED_EVENTS BIT(0)
usr/include/asm/kvm.h:#define KVM_EXIT_HYPERCALL_LONG_MODE      BIT(0)
usr/include/drm/radeon_drm.h: * THESE ARE NOT BIT FIELDS
usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_READ                BIT(0)
usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_WRITE               BIT(1)
usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_LBW         BIT(2)
usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_HBW         BIT(3)
usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_RR          BIT(4)
usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_ADDR_DEC    BIT(5)
$

