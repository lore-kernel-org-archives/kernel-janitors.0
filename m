Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693D7E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 06:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQHNXNdW"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7291AD
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 23:34:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-543923af573so2954145a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698993269; x=1699598069; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUSFDpSLRhr004/t6MtVre5IXfBX4gh3FzzO4X/g14E=;
        b=ZQHNXNdWx+dHhfTpf6HaNPxoUrQnAwAaqgxXHg3Imgf85GJpuLC+Ys/nrul43cLvaG
         hS3/bZ6G4kGMqh1VjqlxpuBhlOKb6nYKpRWnHaJhigTls+EVOXvHTQJM6ZX5wtm+Vf66
         aJpALyJNMmJJZlK7SrKZ16prYUaOG/AthIviqWbbPu4SWVIaB7wz2qKotyrR3EzbwU9I
         mD6biJb8Z6XmOv0TUR7wXDpynMNYFYLVNfFm9u8zX4aTVPoINY90idOvPxhYEjKROyKD
         WwodZLZglBUDc+5SzkQ+hPslLxTg26tDlAUNykpkCluWmV7BV4GyCRBqNHFXI3TUkeZG
         jtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698993269; x=1699598069;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUSFDpSLRhr004/t6MtVre5IXfBX4gh3FzzO4X/g14E=;
        b=bCo9TT9v/5pLQMzwrzZxfl8V1ZURcpuHrLyAvgSVgcYn5je+He2DNk4FLEL0Ge/0Mn
         jj4kuFuSpSspvz4PBZeSybVCh5Q7i1wU+KhCY8WOCXpZHhtdfbeEX3Kg2jLwHe0j2XCF
         Cu5X5RB1NFHyKHsIx6zqXRQ1L2ZqpAKHSNPgbNJbbciH+3l3YT6HhrzvLIXI1Oetc/uQ
         2SdIU7LUJ7FblT2uSXf1ww5b1K3L6XN0s1D7srUy7V2jbE85xUVeQbVIVbu4bvCiA4eR
         Miy9Zcs8OOq4vCRoSiXm8Lt4GPQsj8uevU7rZ3w8CH2Z1JxF/KcoGEKAOIzMRc3aKlz3
         aB2A==
X-Gm-Message-State: AOJu0YyNP0xoOOC/wedCnVoaE8fOWS651O+Qsm0vWia/H0ME8HK3+lPO
	A0cmNTOSB2XwulFNTT3HeockkA==
X-Google-Smtp-Source: AGHT+IHUxr/13ZJwmsjF1s1nibtvQQcOSPGuNRBFGnGJ5rb0tkUfVpIIYcuZ3a6a1INjx2OCw2fBig==
X-Received: by 2002:a17:907:a687:b0:9db:df62:fd82 with SMTP id vv7-20020a170907a68700b009dbdf62fd82mr2546315ejc.31.1698993268925;
        Thu, 02 Nov 2023 23:34:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gu13-20020a170906f28d00b00982a352f078sm534511ejb.124.2023.11.02.23.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 23:34:28 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:34:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The problem is this line here from subdev_do_ioctl().

	client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;

The "client_cap->capabilities" variable is a u64.  The AND operation
is supposed to clear out the V4L2_SUBDEV_CLIENT_CAP_STREAMS flag.  But
because it's a 32 bit variable it accidentally clears our the high 32
bits as well.

Currently we only use BIT(0) and none ofthe upper bits so this doesn't
affect runtime behavior.

Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 include/uapi/linux/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 4a195b68f28f..21d149969119 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
  * set (which is the default), the 'stream' fields will be forced to 0 by the
  * kernel.
  */
- #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
+ #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		BIT_ULL(0)
 
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
-- 
2.42.0

