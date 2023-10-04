Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BAFE7C4D0
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Oct 2023 15:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242934AbjJDPmA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Oct 2023 11:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233666AbjJDPl7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Oct 2023 11:41:59 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B51C1
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Oct 2023 08:41:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4054496bde3so22367695e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Oct 2023 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696434113; x=1697038913; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1fYBE+D/H40WZ29bqIIM4ddluYNMO47D0wiUkl3/pXQ=;
        b=Hi1ztbIv3H1MBOsbNIgLT0Dpo6XzGAdGz6dMuauno7aiSe6fcvKMKtQ6iiQ4h0pnCr
         a2A5Off3sOQl4KZWLDIoPjV29+jMQFAOLxtPj2tlH9fYuMBAgMHar5ZrlVm1B6f5m/Zh
         wX29Y4KvGCAgaTVeF/YB+NdKiAYytjmVng1KfguVuttVt1Qy1zYRxdYyzU4AlaRR+rkz
         lcZxTmxngecoXCwNRxh2P08lln7FAGjYyXa03V/UDb3xap8va7eYgZdSa44rzWLbL4b3
         k54utCnY6zAysVy5dFsbP8LJtF6UuxUraai34Q6vCMG15y0er5e1qE2Uh5//JoMgFf6p
         httA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434113; x=1697038913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fYBE+D/H40WZ29bqIIM4ddluYNMO47D0wiUkl3/pXQ=;
        b=evZf1VqwXPfNfZ1Khh70A9/+ailYRZ0pNYuDHgMYVWOqUZNSgMblTi5RvlNRF7FOuN
         xAL7YhbmlcRS/+rKU1332mMWYzE6Jo65MFP/jNCfJ/xzS18gMW9+5lCNwegaSpXne5K1
         9IAdAaBK7CCaOkzt5agKhxRYLeJJ1Mft3BJlHILoGs/2txLyAISy7RPdZAQ4NhXr2wSw
         UDmN0/VVuFaW3YnzXdyNwxHSErXAN2t0ECDtCPfRUVjl4E7H/741EMTiyci+oILXl7wq
         9Jjmzg1cF+qIdpSCtpoq1lw1JUeHeBtnSJLUzsrQYN9o+CT1pS8STsZw/2TrIKO5rjrj
         tdtQ==
X-Gm-Message-State: AOJu0Yz0XLWcPXQDw7GnbRQnTS4DmBoj4j3GI7lGz2+RKIS8mFr/TTHw
        6VwK91CTiR7qfsVVn0wTg3j3A3pPP/PM2PcBjuY=
X-Google-Smtp-Source: AGHT+IGFd8FyollRJQnInGARMr7Fhz4l8Mx0Bq1RCByXh9FoB0JY/VBD+2OTiMMg6z7MzEAs3vNokA==
X-Received: by 2002:a05:600c:210b:b0:405:1dbd:f77 with SMTP id u11-20020a05600c210b00b004051dbd0f77mr2510920wml.31.1696434113152;
        Wed, 04 Oct 2023 08:41:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y22-20020a1c4b16000000b0040642a1df1csm1795414wma.25.2023.10.04.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:41:52 -0700 (PDT)
Date:   Wed, 4 Oct 2023 18:41:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Su Hui <suhui@nfschina.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] driver base: slience unused warning
Message-ID: <d98f7107-56d7-44a3-8b77-b8766cdc02d9@kadam.mountain>
References: <45027fa0-cda5-2a80-f1cd-ed805d2717ee@nfschina.com>
 <alpine.DEB.2.21.2310041557310.61599@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2310041557310.61599@angie.orcam.me.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 04, 2023 at 04:02:01PM +0100, Maciej W. Rozycki wrote:
> On Fri, 8 Sep 2023, Su Hui wrote:
> 
> > This variable is been used but never be read, so gcc and W=1 give such
> > warning.
> > 
> > drivers/base/module.c:36:6: error:
> > variable ‘no_warn’ set but not used [-Werror=unused-but-set-variable]
> > 
> > I wanted to use "__maybe_unused" to avoid  this warning.
> > 
> > However it seems like a wrong using of "__maybe_unused" as Greg KH said:
> > 
> > "But no_warn is being used in this file, it's being set but not read
> > which is ok.  That's a real use, so this change really isn't correct,
> > sorry."
> 
>  The warning itself is a real issue to be sorted though.  Is this a use 
> case for `#pragma GCC diagnostic'?

I thought Greg liked using __maybe_unused in this case?  This is
drivers/base.  Do the rest of us even get a vote?  ;)

If I do have a vote then #pragma is always the worst option.  Linus has
taught me to dislike pragmas a lot.

regards,
dan carpenter
