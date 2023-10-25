Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F973C07545
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 18:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjJYSzY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 14:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjJYSzX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 14:55:23 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED80F116
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 11:55:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507d1cc0538so33017e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698260119; x=1698864919; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ea+IU4ehea074DcLpflEicEjp7mZ7111A8Ss1boE9QE=;
        b=kXBynlRKt94YQiyyJviwBQA52fqjjHNIefrFGE8BuU8wXw84AxpZChcbjFCupFU41D
         IlCxU6Vy1PsepM4XPq2o0Hvrz6Q08lMzg+EM3JJBwK5ph0ziJvMxAq5wNvqXk7S65CHY
         i6K7VB3HeQYxvCvJ+iJYO6CsY3oUf+jyxTlIevrkECT3t1uKteBC93nLND36q7s18anQ
         kZqj1jZIza/y1Ow1BpMC+xkp1K5Uk+i+EBhOB7VyGKNK2La+chctDTS122bEQY3wf8NR
         k+YpBytzwH7ZrH1gCdTe7CehW+FUKSCqPdgS7sfN2V2kRo6Joj6ddqOjHZdfblXrCoNZ
         iU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260119; x=1698864919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea+IU4ehea074DcLpflEicEjp7mZ7111A8Ss1boE9QE=;
        b=lFdClRbMaE096whm4ITcxWRAdOJ0l+RzORdJNgoGgI1tPIW85f7RNbFPxZOPTxjnbC
         3Gndbrsy3FkoJInbeCulhOfTWXUqhA/0YwHxw3ifimK13+gK4lbK1BCUiAn7Xg1MhVOb
         j4rfQfbAlyEU2BtYAErdccR969DVFRa/l0TOWVrHFiKpdhWrgvr0cuJ7tqP4WRL/VwKo
         oubkN5lmrWbYnaBTVNrEh2wNNvnsoYW/gQjhTjzbunPpJlTCnkpgBa40AHlrAsjz7HY4
         0EMhLdysa7fImaSPjLR4qNQOZBB9O+u5617yp2Q9qf+GsKDjUkFv57lFrGP27KrWy25X
         2U/Q==
X-Gm-Message-State: AOJu0YxZXhimtzM7FNcgCtIjIihKroZNmeCAcj/uq2aiikawvvC56HtG
        ANMcN+gV84s40F/IycaU1A==
X-Google-Smtp-Source: AGHT+IEnT4k3cbyEdmray0a6gT/3dgaEKb+Xw20573gu9KyZTz7aSvSO1bpGLsnzhmryXVjKHTb23A==
X-Received: by 2002:a19:5014:0:b0:507:a40e:d8c6 with SMTP id e20-20020a195014000000b00507a40ed8c6mr10939873lfb.11.1698260118744;
        Wed, 25 Oct 2023 11:55:18 -0700 (PDT)
Received: from p183 ([46.53.253.206])
        by smtp.gmail.com with ESMTPSA id cq19-20020a056402221300b0053e31113ff7sm9945164edb.94.2023.10.25.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 11:55:18 -0700 (PDT)
Date:   Wed, 25 Oct 2023 21:55:16 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 25, 2023 at 07:45:55AM -0400, James Bottomley wrote:
> On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
> > On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> > > On 23/10/2023 20:49, Andrew Morton wrote:
> > > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter
> > > > <dan.carpenter@linaro.org> wrote:
> > > > 
> > > > > Yesterday someone on my lists just sent an email looking for
> > > > > kernel
> > > > > tasks. 
> > > > 
> > > > Well here's a task: write a bot which follows the mailing lists
> > > > and
> > > > sends people nastygrams if one of their emails is more than
> > > > 95%(?)
> > > > quoted text.
> > > > 
> > > > It's happening significantly more lately.  Possibly because the
> > > > gmail
> > > > client helpfully hides quoted text.
> > > 
> > > I would also point to reviewers and maintainers who give a Rb/Ack
> > > tag:
> > > 1. somewhere at the top, without any footer like Best regards, and
> > > then
> > > quote entire patch, so I don't know shall I look for more comments
> > > after
> > > Rb/Ack?
> > > 
> > > 2. quote entire email and then add Rb/Ack, so I need to figure out
> > > whether there was something between the hundreds of lines of text
> > > or not.
> > 
> > Here we all are, brilliantly talented computer programmers who spend
> > our days making amazing fast digital devices do amazingly clever and
> > subtle things, inventing time-saving tools and processing vast
> > amounts of data without blinking, but for some reason we think the
> > task of skipping over a few thousand lines that all start with '> "
> > is too hard for us and that we should, in stead, complain to some
> > other human to convince them to make our life easier for us.
> > 
> > Does anyone else see the irony?
> 
> So if I'm a brilliantly talented driver, it's OK for other people to
> drive on the wrong side of the road because I should be able to avoid
> them?
> 
> The point being there are some situations where observing global
> etiquette is way more helpful than an individual solution, however
> talented the individual.

It's MUAs failure. Microsoft "solved" this problem by forcing top
posting onto everyone, but there is no reason Outlook couldn't scroll
to the first reply in the middle of email. I use mutt, it doesn't
scroll to the first reply either.
