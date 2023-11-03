Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1FB7E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJIV3Ty1"
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742E2D44
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 00:24:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9d10f94f70bso253234266b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Nov 2023 00:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698996283; x=1699601083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YdeXO9jXSni1A1hnTGjPjHrrcJZHgfJ3MfApuy6Aqo=;
        b=jJIV3Ty1J/J7AiswJkC5MjhIjiTDPjQ1Yp3NGOL2aL17WPwwQGQsrreXNS57KlwGrh
         EmBzjSFW6irOk8WeqMbk9FK9TmJU9d999d41ZzKC2I1DjyM+rDe+mnREz3GVIdPWcJYn
         n2kMSflE+ztbCt3fgiYTOfS6ccrySnkxujxKqupS5DzlRL6STFA/GO4K97eHTfhHhcFi
         JmaFjdrRRFThiVSkNULb1gIT+y1kKUfK2UC+7tA2SkhF4z6m7zcF86FPGePRu28+xSn6
         3wrNXO1MQQEUDoD7ZQzvdbmtzjFk3fvYTraY5d1/ijl76iInCIG2ncKt4ZShGn9FcDbc
         TTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698996283; x=1699601083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YdeXO9jXSni1A1hnTGjPjHrrcJZHgfJ3MfApuy6Aqo=;
        b=D4a4U9hjxmIL1P1HHDipLs/We0zQei8GvxX5SwOPkaqPiGqxZkr386MGOcnfvQF/IF
         PpYaB3yTLMN8uEnPvhTJwk9ZFFQ5xW6h9AX4ZCtGVGt4oPB85zOGlc4lNTTKippEdR5f
         eUzKywuLa+LlsAGiYseRVoV1RmZXeRPYG71wcrfUnf/7kl5aj5XrMBV8WU6FvUQkdqAQ
         vAXajajlNRnNYogq8luYGv47EoclxAluYlbxZE37VFJEMinQ5spBa/mIx9VLwHdKIZns
         2hmyiqFoS2b9scobJrzhSKLVOplYjC13FJnclfeN+iuHNkpFGvj17GkitFgfRhiPR1el
         BT7w==
X-Gm-Message-State: AOJu0Yz6eo0So/FNEpF2oVBwAUxu3xh3ow9yvv2nHzes2tFL1u1JkqbE
	ILoLYaZynx3i0mZ6qCD64kBKuw==
X-Google-Smtp-Source: AGHT+IEMbmepwtRNRU87sLnv0uDTDE/yKB3fEm4/KqhLudIePrpmK4PB5q6SNKsQ2X42CT+scv8Hxg==
X-Received: by 2002:a17:906:dacc:b0:9a1:680e:8c54 with SMTP id xi12-20020a170906dacc00b009a1680e8c54mr6049886ejb.71.1698996282910;
        Fri, 03 Nov 2023 00:24:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906269500b009a1a653770bsm576461ejc.87.2023.11.03.00.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 00:24:42 -0700 (PDT)
Date: Fri, 3 Nov 2023 10:24:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <f335560c-af40-4bed-ba3f-46a9efa339b8@kadam.mountain>
References: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>
 <ZUSaccRE_lq5Mizh@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUSaccRE_lq5Mizh@kekkonen.localdomain>

On Fri, Nov 03, 2023 at 07:00:01AM +0000, Sakari Ailus wrote:
> Hi Dan,
> 
> Thanks for the patch.
> 
> On Fri, Nov 03, 2023 at 09:34:25AM +0300, Dan Carpenter wrote:
> > The problem is this line here from subdev_do_ioctl().
> > 
> > 	client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> > 
> > The "client_cap->capabilities" variable is a u64.  The AND operation
> > is supposed to clear out the V4L2_SUBDEV_CLIENT_CAP_STREAMS flag.  But
> > because it's a 32 bit variable it accidentally clears our the high 32
> > bits as well.
> > 
> > Currently we only use BIT(0) and none ofthe upper bits so this doesn't
> > affect runtime behavior.
> > 
> > Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  include/uapi/linux/v4l2-subdev.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 4a195b68f28f..21d149969119 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
> >   * set (which is the default), the 'stream' fields will be forced to 0 by the
> >   * kernel.
> >   */
> > - #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> > + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		BIT_ULL(0)
> 
> This is a UAPI header but BIT_ULL() is defined in kernel-only headers.
> 
> So (1ULL << 0) ?
> 
> uapi/linux/const.h also has _BITULL().

Let's just do 1ULL < 0.  I'll resend.  Is there an automated way I could
have caught this?

regards,
dan carpenter


