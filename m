Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9D7E9271C
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 17:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjJERnY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 13:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjJERnG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 13:43:06 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590BD30D2
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 10:35:47 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so1221203f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696527346; x=1697132146; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DjV18W14VGFP/nPsNY3gbJ8MeDRf1lFLKLsprrYEXF4=;
        b=L99fiU3eN1Ewbc3VaKl00+GKGMnC3ASchekCeK5C6J4KOG3vykLFdZBkse7fo9ucAY
         vK9l4wAnwP92pJn3r2JpHMNzDxXZn31QsN6khPi1dWeRgL5MsqCF6NRi9TPLZhcuE05e
         Zp8TPtlncSPBIiIQ6jYrphOQSHlbbZUebBoTRUdo42EKXT/5jPqFsPOx9zHOjmqUF/hB
         aGLs9ML39s+bBQf/F1M7fPA6ODLwbUuP8ikN1wMQo9xSR/CkN1qrQTzw0Z3wyBgRA6EQ
         DPNuvGypJKvKRLKg7rYTLUZH09q5xxCe1lM7yPwkH6+bo0d1fx1Pj5YFiAeyTsHj3OEp
         PrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527346; x=1697132146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjV18W14VGFP/nPsNY3gbJ8MeDRf1lFLKLsprrYEXF4=;
        b=PtAio6NVRUmxReehCtWEizp1hAf2G3MT4oI5mFCAvTwguMDyLx/GbKXHcpXseRU4Wl
         01vzRiCPMysAF/nruRMBBfQWrfpHnnHBVxMkAF2Jv+fmAiMjs5BQqNGfXQAECcJI3b3l
         tY4pdk7+Ydq6PkVRcsZsEkiFK/XqAryWIRky8BYATho7NUYZEcrRHakZE2qLtsddUHmG
         5axgqNBDzEcUPbnSf87U5MLHMn+bx6n/LJxhDRkpq/QaiaR6xuMDWfDTtJrZGOt+5cTM
         Sm/NuCqPvEJsguSU+hcJ1RlHuaIaZhN7E3j0RmVufQJx1USXCzuiIdjMolYCKhKMS6ST
         ptlA==
X-Gm-Message-State: AOJu0Yz0KbnRuOJLjV+CSapSm2OXTeqs6DuIunCBXVX8jedxy6xsXqsg
        h6UaFOZuEYadDi8YT7AqKi4ALA==
X-Google-Smtp-Source: AGHT+IFmcAEhWMBTM9kJv/GJNm6kTZFgP/zz+kPOVn3qP9dzEJqrpUFektXsZSq94T8eVCfCO0byMA==
X-Received: by 2002:a5d:4b92:0:b0:31f:ea3d:f93 with SMTP id b18-20020a5d4b92000000b0031fea3d0f93mr5783055wrt.40.1696527345789;
        Thu, 05 Oct 2023 10:35:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b2-20020a5d5502000000b00323330edbc7sm2249544wrv.20.2023.10.05.10.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:35:45 -0700 (PDT)
Date:   Thu, 5 Oct 2023 20:35:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc:     "Williams, Dan J" <dan.j.williams@intel.com>,
        "Jiang, Dave" <dave.jiang@intel.com>,
        "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
        "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] dax: remove unnecessary check
Message-ID: <4a73c30f-ebf8-418c-be67-420302641153@kadam.mountain>
References: <554b10f3-dbd5-46a2-8d98-9b3ecaf9465a@moroto.mountain>
 <21381c1e57c2fc2aa7579d4655ea7d3f1c74f6a5.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21381c1e57c2fc2aa7579d4655ea7d3f1c74f6a5.camel@intel.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 05, 2023 at 05:17:17PM +0000, Verma, Vishal L wrote:
> On Thu, 2023-10-05 at 16:58 +0300, Dan Carpenter wrote:
> > We know that "rc" is zero so there is no need to check.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/dax/bus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> > index 1d818401103b..ea7298d8da99 100644
> > --- a/drivers/dax/bus.c
> > +++ b/drivers/dax/bus.c
> > @@ -1300,7 +1300,7 @@ static ssize_t memmap_on_memory_store(struct device *dev,
> >         dev_dax->memmap_on_memory = val;
> >  
> >         device_unlock(dax_region->dev);
> > -       return rc == 0 ? len : rc;
> > +       return len;
> >  }
> >  static DEVICE_ATTR_RW(memmap_on_memory);
> >  
> Hi Dan, thanks for the report - since this function is only in mm-
> unstable currently, and I have a new revision about to go out, I'll
> just include this fixup in it.

That works.  Thanks!

regards,
dan carpenter
