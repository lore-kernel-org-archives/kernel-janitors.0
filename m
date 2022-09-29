Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD2AC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Sep 2022 23:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiI2Xgc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Sep 2022 19:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiI2Xgb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Sep 2022 19:36:31 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C16914D338
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Sep 2022 16:36:30 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f193so2780257pgc.0
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Sep 2022 16:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Xbz67oZK82CtGclYCJkU8C5apLwvJO6ocDW2GQnKsP0=;
        b=AUn3kZDM5lNvy5m2+3Ts9Kl9mS+Bt4VFAtsVryc4ezGL1WMAmzOAlrP87i9nHVp7A5
         VZZypx1I4Z/tOJTTDsGmlHyxag27HLBJi+gMYjZEt7Tg9PggmlXUdJpR0sRwSOp2Ab7O
         cqN4IvhgOSoj5j1zwMctOnj01LrTNiFVO6lJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Xbz67oZK82CtGclYCJkU8C5apLwvJO6ocDW2GQnKsP0=;
        b=X7tQwuKxrGdeUFObUrOJ4bxz/O3aoHUrMAbqq4jDYhb2y490g0M/9hor9+gZOEX0vG
         9o/fNQpZPb5jXtg0hmwaj1UHT3YbsRPPY9cqU2tiXFT8yRBhhfbf85GYV5IrhxQGnfR5
         Rv/77SLbc/71Yh9R7o9PTS5r/48pGyETohxXwzZBh9xixtATMoVycWWblYifExFmhmIg
         ndfNpI+0v860uBldP4dNh5ctC62uQ8a/6R+JVaYfmfpU7JUWhBf2udT27l6I+s5LtD41
         a+YFN2fotS+WiVvtF0D39A145tJiTe4TrCb5xymyG46bWJhzuIcRDrf2vc9+RCKbNRi6
         9yiQ==
X-Gm-Message-State: ACrzQf2KE+fITkekdmNFn291Ru+UxG1oxfhaKXtR8yYnJtw+bzh3bNt2
        GPTGAeAAub4/qizCROAVdXw/Nw==
X-Google-Smtp-Source: AMsMyM5unEH1nAScJeckvDRNethcxnyDUrHMMmmroXgAknht8ekkwWtouSRGGxJA4MKsFbroz9alPw==
X-Received: by 2002:a63:f518:0:b0:43c:403:9833 with SMTP id w24-20020a63f518000000b0043c04039833mr4829720pgh.461.1664494589889;
        Thu, 29 Sep 2022 16:36:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ij28-20020a170902ab5c00b00178af82a000sm452969plb.122.2022.09.29.16.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 16:36:29 -0700 (PDT)
Date:   Thu, 29 Sep 2022 16:36:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binfmt: remove taso from linux_binprm struct
Message-ID: <202209291635.EA24FCEA@keescook>
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

I can't find anything using "taso". Where are you looking?

-- 
Kees Cook
