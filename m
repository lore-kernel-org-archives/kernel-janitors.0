Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5301C001B0
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jul 2023 06:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjGLGb6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 Jul 2023 02:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbjGLGbV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jul 2023 02:31:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6EA1BFB
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 23:30:36 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-315adee6ac8so222999f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 23:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689143415; x=1691735415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uxEaWwLWc+hET0h2ug0P32dKE47X3QWgDKWE9FH9+fo=;
        b=UGg8jCMk6ynJOyfH4RBv2S99OtAXpP9hX/3eQQHJgFiMMsIAwm9P/FfdSEvEUs/Rc5
         OjfHXG/bb3KqBmOC5rbHTZDSPC2fo/g+kj9jOgZGUYR3hFfQFJ9k0PjONKxmgnnEKfJI
         TH0fCjHCB79ifCpnE6TSvQfctd1TPpfVPyA+xI1seFBPAUGPNu5Kbdp22cA2tb8sSTqm
         UT0Um28/Fm0VRPalVWmfNVKioQhY0y6/Dxlhg1aGRZodK7BtsUfHrxA/77o3qCAjeIFL
         88UF9mN8TjXah8wD8GqOpY0EAfMs8JDe7vAEl72Ex7U+Pyd68uWGFuPk78gUm4efLuNZ
         9PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689143415; x=1691735415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxEaWwLWc+hET0h2ug0P32dKE47X3QWgDKWE9FH9+fo=;
        b=epyPU2/w1fIKJKQWM/z0o/BtefGiBRA72h2ICU8ZjGy6M2bvHFwT485j0RsEY5cuRB
         hj77W5XxkvNWCTGGGMtF6LJdbxvgJWEqhMzWunFV/XB+avN6w8bqUDVp5aQp1M+fzju6
         XnG6T7ex7wRatlvCZJ7EEo/1o+Z+O6T52fvuV0dSVfMxv7e34kRAuGO74l4h0EJcLqO5
         3KdhOOY0U6VeNtWrojXEvKzbv0kvtc+YHGmTngmGJKlZuxtDfbU2I0F5PEQd4QJAZ3z3
         HZ6QUo1QhmeuJUj/pNNhkQcaEXTKC0FmRlGtX/d6h3wsD0qWAZ3POks1vSCRj0FRlAg+
         OHhg==
X-Gm-Message-State: ABy/qLaJ1r6YvONxnEocIp/Mck+WqSufwR8esxdpVE2nHkuq0b3o/8sC
        SvDfgNLu+1ZVN0AJSNfihdXeKA==
X-Google-Smtp-Source: APBJJlHGmnVc3EpBQwXKiOhdyq/llV8bMmbe8E+i7Qo5aLAq8hkemnOpVTPP7cuECqjzs2xq6j9Nqw==
X-Received: by 2002:a5d:590f:0:b0:313:e971:53af with SMTP id v15-20020a5d590f000000b00313e97153afmr15585202wrd.32.1689143415239;
        Tue, 11 Jul 2023 23:30:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020adfe812000000b00314417f5272sm4085101wrm.64.2023.07.11.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 23:30:12 -0700 (PDT)
Date:   Wed, 12 Jul 2023 09:30:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/5 v4] accel/qaic: Improve bounds checking in
 encode/decode
Message-ID: <9af2a1c9-a59a-4f7e-a195-82cf5cbd68c9@kadam.mountain>
References: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
 <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2023 at 11:33:25AM -0600, Jeffrey Hugo wrote:
> On 7/11/2023 2:20 AM, Dan Carpenter wrote:
> > Fixed in v4: Send the correct [PATCH 1/5] patch.
> > 
> > Fixed in v3: Redo messed up threading
> > 
> > Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
> > the >= in encode and decode to >.
> > 
> > regards,
> > dan carpenter
> 
> Did you intentionally drop tags from previous versions?

Sorry, I kept messing up the resends.

> 
> For 1-3, 5
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Looks like 3,5 are reviewed by Pranjal and also good. I see 5 is also
> reviewed by Dafna.  Expect those to be merged.  1,2 need a review from
> Pranjal, but I expect all is good and will be merged.
> 
> I did not see feedback on my question for 4.  Would like your feedback
> before queuing that one up.
> 

Sorry, again.  Yeah.  I think you're right.  Could we queue the rest and
I will resend 4 separately?  I know it's a headache.  If not it's fine,
I can resend them all.

regards,
dan carpenter

