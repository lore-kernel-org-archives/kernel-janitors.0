Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257F1C77B7A
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jun 2023 12:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbjFBMIm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Jun 2023 08:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbjFBMI1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Jun 2023 08:08:27 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7051A7
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Jun 2023 05:08:25 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so20173925e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Jun 2023 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685707704; x=1688299704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6N5RSBDUYVnk68nNFO5iJo36EpLGHeNx7EXSoald+6Y=;
        b=vbCorPrw3tzdPss9fLKN2Jev52SLfxSgOQqoKYqSY65ZLrLB+P74BJBRbJMFFlcFg2
         V7Ot2gZjxhSVBPFfbnvwW9yQnphdHhOVXVBSwm4xRuxJ7ex+cLBItdHMh0IW9kYNykOa
         7ioPtcQlOz5kRi11B/L0Pqn/A4DqxsPhLJciZSe5it+Ilkag+UN92q1nxXIWDU/bW0qK
         6n+AgA2OZjG9C+NW4fCSkwSci3fkVM85PC1Jj5pey0miF/c1R/uevQGKz7/OoRj2qh4D
         /Wvth9lpOh+tzo6e1tyb8kTh0oojqqD8BaMgr10akG2ABdWDuoArukXsPjYCzyfN3h4D
         0dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685707704; x=1688299704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N5RSBDUYVnk68nNFO5iJo36EpLGHeNx7EXSoald+6Y=;
        b=FSXIQUvn9X/LxQk8Z8I4pvDcYz7kDXoZeNEv5y6h7/eH0rzztRX47kxiwyL4SfL0bb
         CqsUBOlKRVASRgoqVQ/lIXKS99lWVRPxuI9g2P3A49v/LiYs+E1d6GZKczfrWWIBBwF6
         /oOkZaQ4QvDhYUBUWR01bfPIYcmCQalrYqa283913APcvZi04j38klkRK+pHz59YHzjB
         0F4jAYFGweAskzQu/QJo0PrIoqmiXzkObqYB3eHbXLuaGJaiF/dedlvIKN78YOHmlM5W
         f2GhYcU1jlMAz1y3pHN9dwOxe3yI50BZ54H4JkFH1W4FrJ4EQiPk5+QixebEQnz6rNG7
         U9fw==
X-Gm-Message-State: AC+VfDx3n/u7OwSz/dmrlbNvejT2ILL2a9YwPiRTT0E8IkGjWh8RWZUo
        QZmk+8cmwOZLuGrYzfdsy7yE8Q==
X-Google-Smtp-Source: ACHHUZ7oZo7G5GE5Au7PiQOHzixE8gijDSexUoXlU0n8rp+47guVjLqwzhNWj3i4s1C/PP2kjor3sg==
X-Received: by 2002:a7b:c3cb:0:b0:3f4:c28b:ec88 with SMTP id t11-20020a7bc3cb000000b003f4c28bec88mr1799069wmj.41.1685707704172;
        Fri, 02 Jun 2023 05:08:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a19-20020a05600c225300b003f42d8dd7ffsm1784513wmm.19.2023.06.02.05.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 05:08:22 -0700 (PDT)
Date:   Fri, 2 Jun 2023 15:08:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Janosch Frank <frankja@linux.ibm.com>
Cc:     Colin Ian King <colin.i.king@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] KVM: s390: selftests: Fix spelling mistake
 "initally" -> "initially"
Message-ID: <bbd79f29-f490-4fe4-b5b9-2a0a85c31431@kadam.mountain>
References: <20230602102330.1230734-1-colin.i.king@gmail.com>
 <f0f0587b-5f19-82bd-3d58-bdb89ff59f8c@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0f0587b-5f19-82bd-3d58-bdb89ff59f8c@linux.ibm.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 02, 2023 at 01:07:45PM +0200, Janosch Frank wrote:
> On 6/2/23 12:23, Colin Ian King wrote:
> > There is a spelling mistake in literal string. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Hey Colin,
> 
> I'm not a big fan of such fixes since they are most of the time more work
> for the maintainers than they are worth and accepting one can result in a
> flood of similar new patches. If this would have been your first ever patch
> I might have considered picking this but that's not the case.
> 
> That being said, if one of the other maintainers choose to pick it I won't
> stand in their way.

I kind of get dread when people ask me to fix a typo in my commit
message.  The drudgery of Sort by thread, Up arrow to the patch, Hit e,
Fix the typo, Add the v2 to the subject, The little note under the
--- cut off, and Hit send.  FML, right?  So I sympathize about not
caring about spelling.  But this is a user visible string.  Kind of.
It's testing code...

You should improve your process so it's easier to apply patches.  For
me, I type "i" to review this patch in context.  Then "ESC:q" to leave
vim.  Then "ap" to apply the patch.  It's six key strokes.  Anything
more than 10 key strokes to review and apply a patch is not Web Scale.

regards,
dan carpenter
