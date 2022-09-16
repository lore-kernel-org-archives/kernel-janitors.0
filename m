Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4926AC6FA86
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Sep 2022 21:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiIPVbb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Sep 2022 17:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiIPVba (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Sep 2022 17:31:30 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0898B99EB
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Sep 2022 14:31:25 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id g4so21533476pgc.0
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Sep 2022 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gAOpf4VaiyzuyzEgBlSDI/rb/mxIT2fGVc3O4sRyz8Q=;
        b=ESaZCkLet+Qy6/RvuyqCTnQHokSf4VLHnPureVwo7ogYklmGP1Sztila7n66Rd4Rpx
         p8mM7GZYSPEVPVnneskMYs3iQhwxLf9yo9KPvmptyMHSHdIHgLLpttwzX2mDEzYLLpST
         vioqg93hpJQCo9Uc4aIg3ueQPLLjc07hHzXxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gAOpf4VaiyzuyzEgBlSDI/rb/mxIT2fGVc3O4sRyz8Q=;
        b=XtDdb+CUNmDIzskTSW2dtjs8VYYVc6y57b91BYmCxM7F+EMtH6uPJz89kX60kQltdB
         MUgnYTSJts18m6qfq7f/X72VvpBW/ebb+mu+odbjmjeda8/YAoUoStUmjcprcCIfi8Kk
         LMuYBIPptk8WZYsC9quHLsl6uZgMKQVIVzKw0udDrYXZPTuiqoYjdIUXCnQlt0JMDiXT
         v6FtbnCWbt8/D8ZbLsz1ZL+V/1Snk39VGro6cb6VBTkZ60zUQ0Mf5caI76KCBoLBKG3b
         y9eLuOv4UBbqhTLtP/FrsgJU0LRZ4XfR0kbj4UCuxU+0lSKKWn3xxsPNy7ALfPf5prhz
         lg5w==
X-Gm-Message-State: ACrzQf193FYkR0l84vhQ73d4oi3KFOwXAuxP/9V0YDUUUIIWfCHARNk1
        9jNtiJ5+0QWgg2bk6TiM71Vvlg==
X-Google-Smtp-Source: AMsMyM6NXdExmvfrm3oknYIgGPotEd25We5Echz9dev/PyZDMj2iXCY/P49FQgqOgPGc3Lo0M3EjBQ==
X-Received: by 2002:a05:6a02:309:b0:434:d151:639e with SMTP id bn9-20020a056a02030900b00434d151639emr6100944pgb.124.1663363885331;
        Fri, 16 Sep 2022 14:31:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm15307582ple.62.2022.09.16.14.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:31:23 -0700 (PDT)
Date:   Fri, 16 Sep 2022 14:31:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <202209160812.2B4AB7FC@keescook>
References: <YyMM8iVSHJ4ammsg@kili>
 <YyMt2cWtHC2SeG62@work>
 <YyMyKQnWgu0SL6jj@kadam>
 <202209160101.2A240E9@keescook>
 <YyQyfaI0WCsQ8F48@kadam>
 <202209160630.CF7AE9708D@keescook>
 <YySOewo2YUY+fk1l@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YySOewo2YUY+fk1l@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 16, 2022 at 05:55:55PM +0300, Dan Carpenter wrote:
> On Fri, Sep 16, 2022 at 06:31:45AM -0700, Kees Cook wrote:
> > On Fri, Sep 16, 2022 at 11:23:25AM +0300, Dan Carpenter wrote:
> > > [...]
> > > net/ipv6/mcast.c:450 ip6_mc_source() saving 'size_add' to type 'int'
> > 
> > Interesting! Are you able to report the consumer? e.g. I think a bunch
> > of these would be fixed by:
> > 
> 
> Are you asking if I can add "passed to sock_kmalloc()" to the report?

Yeah.

> It's possible but it's kind of a headache the way this code is written.

Okay, no worries -- I was curious if it would be "easy". I can happily
just spit out the source line.

-- 
Kees Cook
