Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F582C00140
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Aug 2022 14:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbiHLOPM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Aug 2022 10:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238916AbiHLOPK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Aug 2022 10:15:10 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90C61A83C
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Aug 2022 07:15:09 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id j6so834713qkl.10
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Aug 2022 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=gr3xJEF68aIrx2JrDgRpIsSM2UJRf9YlZlmbMyGrjVI=;
        b=5fMR8J1FQzOJMU3+wziIzIi1w2X4q439RCbF4O4LHcSX3vxuSjX2TO2NZUBDm8NN45
         JAFvOZtH3Qd7awS0hT+EceW9LpymDL1tpdnzmk9yDMFQt6SwIlaOy1kE8TB4H8ALYTF+
         6SuQNVkJ50bKCSLFtLrCSCgRBqKIa4r/l1EjlUN3yqDMz9Yp7QimmOdNc/a//o2NsRG6
         ZHRuWYlqswaPzcWMRH4q1qWezI6d9xAjHpIfBt3OR0mCUG0wVC5BLukMybjQASofAQbr
         xg1tWgBXVHC8V6GKPdExmnuBNN9dVKBUP7jw3aGgWOZDQdd/+St4yYbfDw/5ox7FPdwE
         Ob6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=gr3xJEF68aIrx2JrDgRpIsSM2UJRf9YlZlmbMyGrjVI=;
        b=EH3IMDraYMyU4dmhqee6g0X0oCkeh9oXKviD47yEHUUNyPa+SZSMnS0WmvzTwoBjdQ
         sAdi6ENHVDs87cF1Iwqm627w87/t1txx+GQ+S3hjXIWYfamOSfwzBb0jSfSP2ecIqHdg
         BfhNvDh06lPPR0TB8VFkOmz7bT2+sXqTz6XYZoVa6v8qXjUGCsJtLiWlJjz0AfRIOHNB
         3pPFmbxzrHMFYb4k4T61kSPRgc9sui1KfIt/uzRdQsqgccEEoYw0MwqGXaBNngkddTSc
         CFiwZBr1xDBNgfFaOmX35SpkO3PH8wa7dE3At2dj3W2UYCzL8PUnjhMyccMSfAcm32GN
         iUKQ==
X-Gm-Message-State: ACgBeo0nPUeI+saw6KAgwDiMoQTr1G56i3BXmM4FRbCv/ehSgVLSUEdp
        ecQ9ce0NPAEA/+4VOAn+sqoP2A==
X-Google-Smtp-Source: AA6agR7FZZwGrAEN4EtV30dhUAvcp9V2X7+8/6ETespdtD1NlnyBQS1+LdwSFcbbEm8Ht/g4V5RDAQ==
X-Received: by 2002:a37:9504:0:b0:6b9:1e2f:e5ca with SMTP id x4-20020a379504000000b006b91e2fe5camr2948625qkd.113.1660313708987;
        Fri, 12 Aug 2022 07:15:08 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id m10-20020a05620a290a00b006b5e50057basm1862058qkp.95.2022.08.12.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 07:15:08 -0700 (PDT)
Date:   Fri, 12 Aug 2022 10:15:06 -0400
From:   Jon Mason <jdmason@kudzu.us>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Allen Hubbe <allenbh@gmail.com>,
        Dave Jiang <dave.jiang@intel.com>, ntb@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] NTB: ntb_tool: uninitialized heap data in tool_fn_write()
Message-ID: <YvZgajV4lDVUyh3f@kudzu.us>
References: <YthJQqfMCb47jHbG@kili>
 <20220728114417.hkhnv4lkqy6uzqq3@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728114417.hkhnv4lkqy6uzqq3@mobilestation>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 28, 2022 at 02:44:17PM +0300, Serge Semin wrote:
> On Wed, Jul 20, 2022 at 09:28:18PM +0300, Dan Carpenter wrote:
> > The call to:
> > 
> > 	ret = simple_write_to_buffer(buf, size, offp, ubuf, size);
> > 
> > will return success if it is able to write even one byte to "buf".
> > The value of "*offp" controls which byte.  This could result in
> > reading uninitialized data when we do the sscanf() on the next line.
> > 
> > This code is not really desigined to handle partial writes where
> > *offp is non-zero and the "buf" is preserved and re-used between writes.
> > Just ban partial writes and replace the simple_write_to_buffer() with
> > copy_from_user().
> > 
> > Fixes: 578b881ba9c4 ("NTB: Add tool test client")
> 
> Looks good. Thanks.
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
> -Sergey

Sorry for the extremely long delay in response.  This series is in my
ntb branch and will be in my pull request for v5.20 which should be
going out later today.

Thanks,
Jon

> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/ntb/test/ntb_tool.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/ntb/test/ntb_tool.c b/drivers/ntb/test/ntb_tool.c
> > index b7bf3f863d79..5ee0afa621a9 100644
> > --- a/drivers/ntb/test/ntb_tool.c
> > +++ b/drivers/ntb/test/ntb_tool.c
> > @@ -367,14 +367,16 @@ static ssize_t tool_fn_write(struct tool_ctx *tc,
> >  	u64 bits;
> >  	int n;
> >  
> > +	if (*offp)
> > +		return 0;
> > +
> >  	buf = kmalloc(size + 1, GFP_KERNEL);
> >  	if (!buf)
> >  		return -ENOMEM;
> >  
> > -	ret = simple_write_to_buffer(buf, size, offp, ubuf, size);
> > -	if (ret < 0) {
> > +	if (copy_from_user(buf, ubuf, size)) {
> >  		kfree(buf);
> > -		return ret;
> > +		return -EFAULT;
> >  	}
> >  
> >  	buf[size] = 0;
> > -- 
> > 2.35.1
> > 
> > 
