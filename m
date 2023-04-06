Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0103C7618D
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Apr 2023 12:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236610AbjDFMRu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbjDFMRs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Apr 2023 08:17:48 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDBE5B83
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Apr 2023 05:17:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id q19so36244520wrc.5
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Apr 2023 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680783464; x=1683375464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n61jYAD6dPbw2otCpc4Oe8515REV5GC/8MPBAjpZGx4=;
        b=pwP0uwEleAdlRfKZhE0uiqwhlnA3U7GlSgk3rUVwS5G/kOUN3xH+7PxvvgcidbdkMl
         fENbAOvC1T6CvM7u4vNo2GgHMjhU78JDEJFjm0bfTpzGd+qzyZucl5A4cApaEe1Qekkl
         lNj7skaOIVzE+UbjOoJm3Lv3XTKdSpeLQWAaUDYXRx7RpOnhWb/QTUX4XEhh06R90n3g
         4kdIOBOejsNsTLZBPyvkP5G+jZg6auWR7qUGMu5AtUfGOvkjlHwvPRUO2kUdCX0UJkrS
         siKJegkxUKRil3bxcciqkACy9fyWcjA94ik2BZCTiqCpQtFWyL9cKb4CzQ4XzABd7GTn
         9aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783464; x=1683375464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n61jYAD6dPbw2otCpc4Oe8515REV5GC/8MPBAjpZGx4=;
        b=UEBl/SYX02MingCTgprnB1o+NeOakKxbeQaNT1BapsWU+1T7WvUIkj5qrADfnBRM2B
         pem5Aoyva996mRuctGt8RAwYFY0Sx8CYWgVTsIocL6c6IWeymyCqnhkopGavWXnA4OqG
         hlAFT5akV4Elvm1+/hBPjdmAjIaNDW3paa/sdMXssNap07Roo/d0moDmnTfdBa7WnHtn
         8IsM/rQ7YRQjrkAeT3o5leTviPwjhQeL6em68CcCk+RkwI7yJlxW0D6C2sVock6cLcQi
         F/OMJuBQ0oMg6+E29xPUdFFWwLBASgXu3miWk5Dp6k/nMm81DH7g5bjKuuTpQRIvBDLO
         Afhw==
X-Gm-Message-State: AAQBX9dOrO0HhCGFNiTURmfXzlpVPB0Ra6Hf7hoBZHOJPlLKsvuKtxTS
        DtKX1j4z1dDPhlLxy29JD/8=
X-Google-Smtp-Source: AKy350au71EVpD159cTUd4VgIxLFQjQvHIgjYwc5kQMc1R19GrugvM5hnbCNZANl56ZOuAii2H7xBA==
X-Received: by 2002:a5d:604c:0:b0:2d7:6035:7d20 with SMTP id j12-20020a5d604c000000b002d760357d20mr7271212wrt.15.1680783464585;
        Thu, 06 Apr 2023 05:17:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d7-20020adfef87000000b002daeb108304sm1634365wro.33.2023.04.06.05.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:17:44 -0700 (PDT)
Date:   Thu, 6 Apr 2023 15:17:41 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soundwire: amd: fix an IS_ERR() vs NULL bug
Message-ID: <a668e9cd-d19d-4647-8ecd-6a9fc03f68c9@kili.mountain>
References: <3be30516-a1b0-412b-8379-06011855e46f@kili.mountain>
 <701bef7f-77bb-63a6-429f-1293519a6b21@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <701bef7f-77bb-63a6-429f-1293519a6b21@amd.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 06, 2023 at 05:32:21PM +0530, Mukunda,Vijendar wrote:
> On 06/04/23 14:26, Dan Carpenter wrote:
> > The devm_ioremap() function returns NULL on error.  It never returns
> > error pointers.  Update the error checking accordingly.
> >
> > Fixes: a673a8dfc214 ("soundwire: amd: Add support for AMD Manager driver")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/soundwire/amd_manager.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> > index 9fb7f91ca182..9bb8ae8c5f32 100644
> > --- a/drivers/soundwire/amd_manager.c
> > +++ b/drivers/soundwire/amd_manager.c
> > @@ -910,9 +910,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  
> >  	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
> > -	if (IS_ERR(amd_manager->mmio)) {
> > +	if (!amd_manager->mmio) {
> This will break the functionality.  Condition should be
> if (!amd_manager->acp_mmio)
> 
> >  		dev_err(dev, "mmio not found\n");
> > -		return PTR_ERR(amd_manager->mmio);
> > +		return -ENOMEM;

Ah crap.  You're right.  Thanks.  I will resend.

regards,
dan carpenter

