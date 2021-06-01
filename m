Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A5CC4708F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:41:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 245476101C
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhFANn0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 09:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbhFANnZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 09:43:25 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A336C061574
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Jun 2021 06:41:43 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id g17so10084320qtk.9
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jun 2021 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Kt7iWpHULKi9OKx5/+s0Mq8sqYmJSbUeCrR49osguk=;
        b=G9TCc+Iu2NXQEz/n9F2xi+F4OaZe0VpE8b0l+iLofSzWzkyCIZQ8/9CE4l5BYzdBUj
         WjNgEMBtEKREjQxjWgudiygCjjHKbCkgaxPVkoMNTFcnS9T+uSZViT3XTZxad1DSpZ/2
         qFLLaY8lh2FbmHT8kwnVmsjRvTgX8Ns6KK7BXdUfHVtmd8kpiQXVfHQ20DkV8sd7lCow
         r9KNjBA1Qt5xBMeldtNRCwSMcohrhPC32tfIYDtmWu72kQ+003Fj1muGgtU09l8O2OAE
         25pAJcjc5e6w6Nd7im0kPoFjrEjnjoVEQ0SukHpWk+i64FR1wiYa+faMAuYNxzRBeNoz
         nnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Kt7iWpHULKi9OKx5/+s0Mq8sqYmJSbUeCrR49osguk=;
        b=TNXN2NOsbWFG9IVFJqEXDVp7VitVErYk8x+haL1h57FRKXHUU26ximWcWczGm3cURw
         X3okX0vFkxGycQrELdk9rowroRSPa0P6D+HmF8aS1s4Wk7Lr45z9V270wQMtTD14ytr7
         IrjmJE5fzTEoJ5BjMpDcMvUysVdEPmUbpA2STMuZECdb0m87oufd47nPdSoZzjeSoteD
         xkQVp/ZitDDId+nc1RpRI2siPyNq4EAECCKk8XR6tJw8EB4g/AMmj9pG7VctqaHB9nhh
         EJ50r8JHIgwmFd1yn8c0G3vhsQaQYZsbRLUbtg+m6XBfC6dCW/AoJpWl+/QBvjB/hJ+G
         ti3A==
X-Gm-Message-State: AOAM533WNqwcAtogrTXVhgdIj9GRstoCCj40HewZ3jljUg1dJ/RBcJZt
        qwG+WDKknIhaUDmMA4bsG4I=
X-Google-Smtp-Source: ABdhPJyvYvkUkdSUXPPFQ/bzb4o7cZVSH2D640y9mEAaUk1opaGY0bZ+xQ17h9RPXZVHlIbtAQqMgQ==
X-Received: by 2002:ac8:5e90:: with SMTP id r16mr19600786qtx.95.1622554902627;
        Tue, 01 Jun 2021 06:41:42 -0700 (PDT)
Received: from fedora (cpe-68-174-153-112.nyc.res.rr.com. [68.174.153.112])
        by smtp.gmail.com with ESMTPSA id 42sm10305505qtf.37.2021.06.01.06.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:41:42 -0700 (PDT)
Date:   Tue, 1 Jun 2021 09:41:40 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] NFC: microread: Pass err variable to async_cb()
Message-ID: <YLY5FK07BDcl8SFH@fedora>
References: <YLYvcbjuPg1JFr7/@fedora>
 <20210601133757.GA1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601133757.GA1955@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 04:37:57PM +0300, Dan Carpenter wrote:
> On Tue, Jun 01, 2021 at 09:00:33AM -0400, Nigel Christian wrote:
> > In the case MICROREAD_CB_TYPE_READER_ALL clang reports a dead
> > code warning. The error code is being directly passed to 
> > async_cb(). Fix this by passing the err variable, which is also
> > done in another path.
> > 
> > Addresses-Coverity: ("Unused value") 
> > Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> > ---
> >  drivers/nfc/microread/microread.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
> > index 8d3988457c58..130b0f554016 100644
> > --- a/drivers/nfc/microread/microread.c
> > +++ b/drivers/nfc/microread/microread.c
> > @@ -367,7 +367,7 @@ static void microread_im_transceive_cb(void *context, struct sk_buff *skb,
> >  				err = -EPROTO;
> >  				kfree_skb(skb);
> >  				info->async_cb(info->async_cb_context, NULL,
> > -					       -EPROTO);
> > +					       err);
> 
> It would be better to just delete the "err = -EPROTO;" assignment.
> 
> Literals are more readable.  Avoid pointless indirection.

Yeah, my bad. v2 sent! Thanks Dan!

> 
> regards,
> dan carpenter
> 
> 
