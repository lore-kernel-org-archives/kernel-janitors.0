Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC35CDB46E
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Oct 2023 10:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235694AbjJLKkT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Oct 2023 06:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235698AbjJLKkQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Oct 2023 06:40:16 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B810C4
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 03:40:09 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405524e6769so4465925e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 03:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697107208; x=1697712008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6fBGv66jYc2kP0EhTg6b4IeqJJdAfPC3InwDkFeTIyA=;
        b=AKzwN74bLWFYfSbHpcwoInEIDR7BGv9cWxDz2cIurqZYRCSUWjyjlYcBzMMr+BJAIU
         jO872G/bFm9/p7/p/13tuJZQQPaJLnnFvJDXYEB10CT5zPSVMRCpH7JNgqswslovxsh3
         lB5zQ+DdOElErZxffy/oyetPq4Z1vZeRkf8gUjc/4RM0PVgQd3vkSg+HICoPNla8LRKy
         cJbaYc26AbXcEQIrWtCIdanVNAGsk2WA4GPOZ/fchJmzCvL1WJglTbMsaG2IHYj2jeKV
         CJxh2uOyx4pexgHhX5faDltt7DpQGfucUGKWB5OiAgSraJnZXbiOtOD44NjuoV1yNXjv
         /hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697107208; x=1697712008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fBGv66jYc2kP0EhTg6b4IeqJJdAfPC3InwDkFeTIyA=;
        b=lboVTbmxaEPa8YUk5BcBT1HqbXN3x2LPBuem8cEjcv6KFAC5k31M9gJZp67hJRldrZ
         n+9GEuY+CVOW0lc75fL+3PuKjZc1XkWjmfVah/1YWcu7aiuHw9+GtCtXwmgenGgoNLXZ
         1K5nw59DwM/zRhZolzehVQu3MNxS4Gb0uNmqsekA6oB9VSpwgYxZtqckGOYpV+oyM3gN
         8rcN1MbuzPRARFExc1qNGeM1M9O8orUtHMqdYwnDIYP+V6CyxU9uA9lKCtUYOxp5lLLM
         mHPyJtGYkNDt2DRxbfqLOtY3wIPonDd+6Oe2Z0RScc6v36NbFY24NAU7XAJK9sVazw27
         5ikA==
X-Gm-Message-State: AOJu0YzIDqll3HNrSM/Yivgd7HXEazTPDoYmIAFSTlbw8rkPaSMRxt3p
        uXG3XYGR45FLm9lXr2bvL1A7aA==
X-Google-Smtp-Source: AGHT+IF8V6MtmrGJXfoKWdkMTLSXJ0Shox2IXfQr1G5ZzSCY11ydmvnI2OuBxMZRARrCQZrzayKNqw==
X-Received: by 2002:a7b:c457:0:b0:401:c8b9:4b86 with SMTP id l23-20020a7bc457000000b00401c8b94b86mr19040636wmi.9.1697107207598;
        Thu, 12 Oct 2023 03:40:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a12-20020adff7cc000000b0031423a8f4f7sm18050789wrq.56.2023.10.12.03.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 03:40:07 -0700 (PDT)
Date:   Thu, 12 Oct 2023 13:40:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Steven Rostedt <rostedt@goodmis.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing/eprobe: drop unneeded breaks
Message-ID: <ef43db1c-c50f-479e-8747-3f3a0915eb70@kadam.mountain>
References: <20230928104334.41215-1-Julia.Lawall@inria.fr>
 <20230929203259.74d4ba263b3455172ef37f06@kernel.org>
 <alpine.DEB.2.22.394.2309291336260.3137@hadrien>
 <20230930181902.eb1d089243deca0017046437@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930181902.eb1d089243deca0017046437@kernel.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 30, 2023 at 06:19:02PM +0900, Masami Hiramatsu wrote:
> On Fri, 29 Sep 2023 13:37:08 +0200 (CEST)
> Julia Lawall <julia.lawall@inria.fr> wrote:
> 
> > 
> > 
> > On Fri, 29 Sep 2023, Masami Hiramatsu  wrote:
> > 
> > > On Thu, 28 Sep 2023 12:43:34 +0200
> > > Julia Lawall <Julia.Lawall@inria.fr> wrote:
> > >
> > > > Drop break after return.
> > > >
> > >
> > > Good catch! This looks good to me.
> > >
> > > Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > >
> > > And
> > >
> > > Fixes: 7491e2c44278 ("tracing: Add a probe that attaches to trace events")
> > 
> > Thanks.  I didn't include that because it's not a bug.  But it does break
> > Coccinelle, which is how I noticed it.
> 
> OK, I got it. I thought it may cause a compiler warning because the
> 'break' never be executed. (maybe it is just a flow-control word,
> so it may not need to be warned, but a bit storange.)

I don't think GCC warns about unreachable code, but yeah, in Smatch
unreachable break statements do not trigger a warning.  People like
to add extra break statements to switch statements.

regards,
dan carpenter

