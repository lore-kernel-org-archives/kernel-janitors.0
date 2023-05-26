Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EDBC7EE23
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 13:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243618AbjEZNUX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 09:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243593AbjEZNUW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 09:20:22 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F05B2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:20:18 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso5333455e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685107217; x=1687699217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQINrp1rONXCHe6H7w31VOnQpsmpECV30LxfyZoDH2Y=;
        b=JTDy1xUZtbNZlQ9HcX37vK8x0vbwOmwLJsTbFNflWUwQDQOuvfDLkBLAE3ivmNfh2y
         KYi2jCkxbBH5tFJCxTSuSWLybm77b1bilX1bAugvVkeJzs1IohVvTV4Z07wQJOKEG5CG
         thkIC9PZKDTfkOVsTanhUTgTD0+twGawjr26IhfL2oIj85yOJU7Fp2DQbIfjmRRbjCNf
         qs15ZZC52Nvdy8AESOCd9tbQEmuEZK9BircVrWbbX+gdU4vORL6cOxVl6vtetQruRrmU
         HJf90Q0xUMlSZS77b1FW85uw+DdFTW3vQKDIZItfBjOYPvNmNQ6Wud+UQdc7x/DFlRSR
         nGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107217; x=1687699217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQINrp1rONXCHe6H7w31VOnQpsmpECV30LxfyZoDH2Y=;
        b=SnEH8qXRGxMtI4oeaAVuKONmOtgz+do+0ToJ2RIcgJAnRbgeD2czIyGfvFuWR9dgfO
         Ox9XPcNmjHlp7pd2puT/lOhUsM0E3X9xSXzdAkSjY01NavpxRGFRzHIfBttHYoZypjre
         7FXQYyCfLoQKbKeIE4OqNuDmWATVOQ0M+Kn+k10MBYSa9XATfK+jqvVrn5n02aCxZsOU
         cBhczeQJvObv81DAgMx6cb4A5DJ7wDCMGLPa+FXzx1k8fXBpwAbWhioTS0+YX19Sbuxp
         H3U0wQtT1qlk3cLfVJp8GOD2wS8RjTE44eG3kWbzDpmv77/9l1UihFYwOiQJEGDNGoBS
         /nUA==
X-Gm-Message-State: AC+VfDzrwrXDOEliLMU3+NUHmawEyH2rCMmja/x9qRb0sXIvAQOrzjVr
        QM/FrpRfLTnfF6iXZ9xt0r9KqQ==
X-Google-Smtp-Source: ACHHUZ4ikW6D+KwftA6eC2t2dnn3IFyHnr3g07LynxCsbGEY7IY1kHvQ4Ngg1rKR5dNrpnyTgCur8A==
X-Received: by 2002:a05:600c:2948:b0:3f1:92aa:4eb8 with SMTP id n8-20020a05600c294800b003f192aa4eb8mr1450790wmd.16.1685107216850;
        Fri, 26 May 2023 06:20:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d554a000000b002e5ff05765esm5229256wrw.73.2023.05.26.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:20:15 -0700 (PDT)
Date:   Fri, 26 May 2023 16:20:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     David Howells <dhowells@redhat.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Jiri Benc <jbenc@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: fix signedness bug in
 skb_splice_from_iter()
Message-ID: <337838b4-e264-4d4a-87c5-548d49efc5b6@kili.mountain>
References: <99284df8-9190-4deb-ad7c-c0557614a1c8@kili.mountain>
 <760142.1685107058@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <760142.1685107058@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 26, 2023 at 02:17:38PM +0100, David Howells wrote:
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> >  	while (iter->count > 0) {
> >  		ssize_t space, nr;
> > -		size_t off, len;
> > +		ssize_t len;
> > +		size_t off;
> 
> Good point, but why not just move len onto the preceding line?
> 
>  	while (iter->count > 0) {
> -		ssize_t space, nr;
> -		size_t off, len;
> +		ssize_t space, nr, len;
> +		size_t off;

Sure.  Will do.

regards,
dan carpenter

