Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BDCEEB596
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 06:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbjIOG1A (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 02:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjIOG07 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 02:26:59 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA04B1FE0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 23:26:53 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401b5516104so19076365e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 23:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694759212; x=1695364012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yCzLWCleGTrH60yMtoTcAtGGH4fS0a6XxniUnrVCyg=;
        b=uDE9yv3AkcNm7F3xBpHWXKuy94VK4j3UNmoNiMM6AFPv7iD/5fJ+Y8vM7nXZgz4uJp
         UGjvQgjRMPqQJnx2vLGlTosqNYQoaT7H/P0Agblzns1CBs6932s3qtPB3H+kwxFd25r5
         GRi/794AHK6LcLAvHi6Exywe7nOiUKfj0uZCQW/QMpYv5nWqLBnHcJB89H0EB4u46Sfi
         2Z4Na4UgbB+F+otHxbG00tVwdTqVibSDrhkxIXZIUM3aCRk4Go1bZbwEe3Y/wOqpiXKt
         RYBoeXqq65g6sxOf9rCJnagipD1PaD2Hr8wDeiw5hp4avfm1IOo7D7eL+lTZWRbHEVm1
         eCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694759212; x=1695364012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yCzLWCleGTrH60yMtoTcAtGGH4fS0a6XxniUnrVCyg=;
        b=h5u5e8i5Udq3anwLR2JPeqLAWmsiG6ET4eeJYGh0JJL0GEN4Pvk00GNVLgMzrHhTsZ
         iymBdnquNPSTK6gB6Kn7e7b3/kRcliQzzkFzA6rhF4yjHPmqgd8Ei1ZUvxRyWJ2IzHqB
         aTx1EVL4ONu8m1MegZhZa2UWBad3kZu44UavIJe+938eJdd6mj2E3H+UkRgKj0qBvNRj
         foLqN/n+TW7iC/polIZ/iUehFnThgcKpdZ5yO++cuFWsa/71M9r1/3E3Bq9VBuCT3uq+
         MV5p72nMI2PuIqLhyuf+BavnbvG2S/IpYPRKaG1DuKH4ptNFBUmkPZeWSciCmuaORTid
         oU8A==
X-Gm-Message-State: AOJu0YzYND5NXWnrnT8KadwCJAkm11cUQHD5/SN5dx9IL0aK+ijM6SwD
        5WflZwlmLNasxczGGLa8PPe2Fw==
X-Google-Smtp-Source: AGHT+IFDWReF+6kPGekoGZgsON+6DD/KP/aL3jH0gtGbfkBOdEKeWgHNjSczETHZcSeaUSj32oIFmA==
X-Received: by 2002:adf:d082:0:b0:31a:e728:8682 with SMTP id y2-20020adfd082000000b0031ae7288682mr550499wrh.68.1694759211469;
        Thu, 14 Sep 2023 23:26:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d6804000000b003196e992567sm3599584wru.115.2023.09.14.23.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:26:44 -0700 (PDT)
Date:   Fri, 15 Sep 2023 09:26:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Kent Overstreet <kent.overstreet@gmail.com>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/3] bcachefs: chardev: fix NULL vs IS_ERR() checks
Message-ID: <bb309472-7165-4654-a00d-eb9374338908@kadam.mountain>
References: <6f3b0d3e-d20e-47fc-a3e5-4ad4c03d58b8@moroto.mountain>
 <043689fd-b686-429f-a4bb-602c37578370@moroto.mountain>
 <20230914195604.vjshvlv76zknbgvu@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914195604.vjshvlv76zknbgvu@moria.home.lan>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 14, 2023 at 03:56:04PM -0400, Kent Overstreet wrote:
> On Thu, Sep 14, 2023 at 05:58:48PM +0300, Dan Carpenter wrote:
> > The strndup_user() function returns error pointers on error.  It never
> > returns NULL.  Fix the checks including the commented out code.
> 
> My preferred style in bcachefs is
> 
> ret = PTR_ERR_OR_ZERO(p);
> if (ret)
> 	return ret;
> 
> It keeps things consistent when we're doing a goto err instead of a
> return.

So you want people to write:

	path = strndup_user();
	ret = PTR_ERR_OR_ZERO(p);
	if (ret)
		goto err;

I don't want people to look at the git log and see me writing code like
that.  :P  You're going to have to do that yourself.  That's yuck.

regards,
dan carpenter
