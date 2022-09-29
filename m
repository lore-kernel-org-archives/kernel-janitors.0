Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4F9C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Sep 2022 23:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiI2XjX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Sep 2022 19:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiI2XjW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Sep 2022 19:39:22 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A29114F8E7
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Sep 2022 16:39:21 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id x32-20020a17090a38a300b00209dced49cfso192412pjb.0
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Sep 2022 16:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=406PHi1E3zQxmMChBF9K8IG+zjCzhZM2d2hHmY4Q4BA=;
        b=cgJgHsUAGCFMQ3CFDi3AgcrQiOvlEV35DecVLMmwLMl3Mdex18zzkKu24C3g+oYUwQ
         ukCPFcotbaV/BQzlbkBhRM+bc9mGQ6dyCFZWcSLWR25OPAR8PrOXVwhT+RUET4sjXMF0
         nw7RCJvzf1x3Ti9JDeG3d3bCcjISPfBUfs/vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=406PHi1E3zQxmMChBF9K8IG+zjCzhZM2d2hHmY4Q4BA=;
        b=aZFfWhgG1Ms7FU/3Inm40wlM9kMRTPCXJd9wqIBi+VLJhVwZraX0HjiAZv4jDS6Kzy
         eTPNOy6x1KXe+7kh/lNIBCpedyZnasKtgOhH/b7Efa8saiyVqz8O/T477jSX1jF/U1ZG
         EljZ4QwxH9/wRa3IsqYh+C2wA3+WYV8jINV7mMnBxMc7DsZK6b2TuEf7a55lk21VjYTa
         hzEAUxk77tDB+G3E42YWmb4yGJknqhiW9Gi5GAYebpIWDufuZwMvvcdKbOVlCIFjjTBd
         yRoulcumFyEVvWWtbBoEA/mqxqhPv6s56Nbdia7yul4CS9T8O7Uyqy+p3lJROYb0vJjj
         9TBg==
X-Gm-Message-State: ACrzQf0tw4xfucuVTGytY7Rk0c9sKFYis+1/xn4LHaSRqtuNt+O8fot8
        u8pZPj9i1Ji0UHS7j75wj7FGPQ==
X-Google-Smtp-Source: AMsMyM4zpLGflr4v7oe8USvwOdE1CTEZ8QnadhucyD+2vGwk217VqucBLy0urdyL+4oHeHdsyaYTrg==
X-Received: by 2002:a17:902:a606:b0:178:57e4:a0c1 with SMTP id u6-20020a170902a60600b0017857e4a0c1mr5805722plq.83.1664494760865;
        Thu, 29 Sep 2022 16:39:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s13-20020a17090302cd00b00172dc6e1916sm427601plk.220.2022.09.29.16.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 16:39:20 -0700 (PDT)
Date:   Thu, 29 Sep 2022 16:39:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binfmt: remove taso from linux_binprm struct
Message-ID: <202209291638.BD0B8639@keescook>
References: <20220929203903.9475-1-lukas.bulwahn@gmail.com>
 <87tu4p3jwn.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tu4p3jwn.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 29, 2022 at 05:17:28PM -0500, Eric W. Biederman wrote:
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> 
> > With commit 987f20a9dcce ("a.out: Remove the a.out implementation"), the
> > use of the special taso flag for alpha architectures in the linux_binprm
> > struct is gone.
> >
> > Remove the definition of taso in the linux_binprm struct.
> >
> > No functional change.
> 
> Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>
> 
> Alphas binfmt_loader is the only use I can find of that variable
> so let's kill it as well.

Ah, sorry, misparsed this -- you mean, alpha's use (now removed) was the
only place it was accessed. Agreed. :)

-- 
Kees Cook
