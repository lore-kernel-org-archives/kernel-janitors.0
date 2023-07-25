Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A53C00528
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Jul 2023 05:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbjGYFv5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Jul 2023 01:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbjGYFvz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Jul 2023 01:51:55 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52C9BC
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 22:51:54 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so51183495e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690264313; x=1690869113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LDa0fqzt30Ptcdn+Rp2moDt3uwTqaLbOBTSNBvQHsow=;
        b=Fm732xFUENH32uKlXGBO66pTUcan0hi8UvbXIOsmsajrmKgF65+VKuAsgwl0h2rEvm
         8bVGJCXxJ7Lo3CDTY397Y4mxix0VJtW/pkEXHkkLKO800NxhaPqfFFKex6vpdJLCOa4w
         CmI8aGs1OSFpz1ZKdyfS0I94dx6bSwxKd8BBKpUZIt+arN+GsWHCduZZv9YOaAYpEwDJ
         Kpqga4FAeLkxMrOnhuZRX4J7HcS3KeKVchXAMmblYLn9CvHnXCAxAdBbWFocNGUcqeMO
         Tu3SmXJtzR2hdcpIZzcJs/EIeI/+pl0EtvFzM5PA5rL69dp57n8daVKEcMuVDnfOpImi
         zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690264313; x=1690869113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDa0fqzt30Ptcdn+Rp2moDt3uwTqaLbOBTSNBvQHsow=;
        b=G57rkNqDE7bjkHJ2gwZQoM4QxD67gJrst1f33zgH+f0B3hLxOTyk+Ubq7CI0Gn5xUi
         f3nD27sH8f9peEhCv7JqPO39+/T1CM+PAYTSL5efEbHKmLm8kz6zeeFa37bR3GCMGGst
         Wv4rVPuoK07tZsPXVjqzDM81Ddclw7v2glc2DPYUegscpkk+YLZHOmbHdz63yAq1md6f
         7LgSij3b85V2tKn9mQQDhAbB3WteurpYE/S73TyYwyD4E6m77WT2Px5dBmtr2R/Tx+yy
         YydRYtvVGvYTlGmtDIBJrEv6pFEkNdLdsDJL3FwVE+3c6cmbi9dVZRCVIjyMpcjHTGbD
         uqkA==
X-Gm-Message-State: ABy/qLa/O8cJigKjBed30dys/af6e7Tq7exqMFOsYPdBznb+QCoU16gM
        h6TdQJ0jDhSdxYRx0jMYtFdUKA==
X-Google-Smtp-Source: APBJJlFxsS3y+cMdX48jiFbTMmksWQoLUG07CWaL93WGXpO5sZmPQJoOQhas8KWkVrn1RtL/72a08g==
X-Received: by 2002:a05:600c:152:b0:3fb:e200:b2b3 with SMTP id w18-20020a05600c015200b003fbe200b2b3mr9548144wmm.37.1690264313064;
        Mon, 24 Jul 2023 22:51:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w9-20020adfd4c9000000b0031423a8f4f7sm15243623wrk.56.2023.07.24.22.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:51:52 -0700 (PDT)
Date:   Tue, 25 Jul 2023 08:51:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
        airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
        ndesaulniers@google.com, trix@redhat.com, andrzej.hajda@intel.com,
        intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mripard@kernel.org
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Message-ID: <5d096bcf-c394-4dad-b307-3d7e33ab6e6f@kadam.mountain>
References: <ZL62X3/CnsJcWWU4@ashyti-mobl2.lan>
 <352f7c10-3592-4a18-abdc-ab554a992d10@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <352f7c10-3592-4a18-abdc-ab554a992d10@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The reason why the first five attempts had bugs is because we are
trying to write it in the most complicated way possible, shifting by
logical not what?

regards,
dan carpenter

diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 36b479b46b60..6997b6cb1df2 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -988,7 +988,13 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
 		      const struct tv_mode *tv_mode,
 		      int clock)
 {
-	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
+	int div = tv_mode->oversample;
+
+	if (!tv_mode->progressive)
+		div >>= 1;
+	if (div == 0)
+		div = 1;
+	mode->clock = clock / div;
 
 	/*
 	 * tv_mode horizontal timings:
@@ -1135,6 +1141,8 @@ intel_tv_get_config(struct intel_encoder *encoder,
 		break;
 	default:
 		tv_mode.oversample = 1;
+		WARN_ON_ONCE(!tv_mode.progressive);
+		tv_mode.progressive = true;
 		break;
 	}
 

