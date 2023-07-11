Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3579EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 15:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbjGKPsi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 11:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjGKPsh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 11:48:37 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1AAF0
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 08:48:36 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b8baa836a5so43359105ad.1
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689090516; x=1691682516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMRM+V8aFzozPK+1eStZnFAVQQXz06JbYH2PUPwSbRc=;
        b=KyZIEX2efN9dTSaXYjPypC19rP5SGSxCiwirikn2xdKQ9obqcwBQtmxC9XWu5v+2Sh
         8t1iCuWeL9CE6V4nenudNsyCktdqubs6qUoegGOs+nN0+Dj8/anyyDkWa/2hDOFqOgRt
         cuMdyVgDds2JHO6nVXNOUZDb+NSXB0uijCqzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689090516; x=1691682516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMRM+V8aFzozPK+1eStZnFAVQQXz06JbYH2PUPwSbRc=;
        b=hhVL00otFubrJESowa8yegj/GaqReKVOFtnz364Y91dtvRFSzSyyZGaxjwyVM5WUzY
         rJGaf4a5yy8MHWMJq1nC6GCjCs1BEBlO9jIcnvGHfJFq3m61i+jY/o+SOc7FBpNxNnpu
         VIsa5XPUoUsFLlhs054FV9rad3fHDb9hpmIyWBAbtDUXjyKulvW9map4RyI+Omc46Mv6
         59cdgYxpM3tlO1tx2msnvPJgsy+vm9frqUry/LllS1C2HIA50WLX444Qp74a1dNUR1L9
         cxkN30nSu5xYZAHEFkYZcBu8hfrWnh3U3zd+zK6t62JOzn+5uGcXUg4wnHPmqsfjuels
         lZtA==
X-Gm-Message-State: ABy/qLYGq3+A8GVR9oKj+0baE6XL746NCII5Wqx+zmrPX/y2C/bunr1j
        /e0ZfTEK/mIy7yACJH9jE15aGQ==
X-Google-Smtp-Source: APBJJlFW+i8logIK1uoMz5/q5X4xKTTQaFRkN6PBPOYxC0yirJfLOQLBYPK/dD4D0oz3RT8WnLvPPg==
X-Received: by 2002:a17:902:f94e:b0:1b0:6038:2982 with SMTP id kx14-20020a170902f94e00b001b060382982mr14614382plb.41.1689090516040;
        Tue, 11 Jul 2023 08:48:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o13-20020a170902c50d00b001b03b7f8adfsm2087574plx.246.2023.07.11.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 08:48:35 -0700 (PDT)
Date:   Tue, 11 Jul 2023 08:48:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>,
        Tom Gall <tom.gall@linaro.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v4] checkpatch: check for missing Fixes tags
Message-ID: <202307110848.E0389C3004@keescook>
References: <f3ac6084-8def-4b57-9e6e-0497555e2784@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3ac6084-8def-4b57-9e6e-0497555e2784@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2023 at 04:48:14PM +0300, Dan Carpenter wrote:
> This check looks for common words that probably indicate a patch
> is a fix.  For now the regex is:
> 
> 	(?:(?:BUG: K.|UB)SAN: |Call Trace:|stable\@|syzkaller)/)
> 
> Why are stable patches encouraged to have a fixes tag?  Some people mark
> their stable patches as "# 5.10" etc.  This is useful but a Fixes tag is
> still a good idea.  For example, the Fixes tag helps in review.  It
> helps people to not cherry-pick buggy patches without also
> cherry-picking the fix.
> 
> Also if a bug affects the 5.7 kernel some people will round it up to
> 5.10+ because 5.7 is not supported on kernel.org.  It's possible the Bad
> Binder bug was caused by this sort of gap where companies outside of
> kernel.org are supporting different kernels from kernel.org.
> 
> Should it be counted as a Fix when a patch just silences harmless
> WARN_ON() stack trace.  Yes.  Definitely.
> 
> Is silencing compiler warnings a fix?  It seems unfair to the original
> authors, but we use -Werror now, and warnings break the build so let's
> just add Fixes tags.  I tell people that silencing static checker
> warnings is not a fix but the rules on this vary by subsystem.
> 
> Is fixing a minor LTP issue (Linux Test Project) a fix?  Probably?  It's
> hard to know what to do if the LTP test has technically always been
> broken.
> 
> One clear false positive from this check is when someone updated their
> debug output and included before and after Call Traces.  Or when crashes
> are introduced deliberately for testing.  In those cases, you should
> just ignore checkpatch.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
