Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828D7CCA47F
	for <kernel-janitors@archiver.kernel.org>; Tue, 19 Jul 2022 15:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238024AbiGSPjz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 19 Jul 2022 11:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237998AbiGSPjy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jul 2022 11:39:54 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B375A176
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 08:39:53 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id n2so10096320qkk.8
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hOY4CuQZcGE5+DiEJO7y8J3c5vg/AkJQXHGmscUeoYc=;
        b=Em71Qmq9o6LE6CoGPVSgydM0JCQURVbeF7iSLQUMNBLqBxaKNag09j+SPusSdf3Lm7
         yXqtzk3cUnOmK646jIwo2TRZF6aEl23mnzuo7i+KdAjIJ1QBV0jZH7Dqoe+qVhMuAg/Y
         Pr8C5vkAMZB5PkkuvHlN/lvjWLX+PXX+WQ5H6wiw3voPU3sRJQWaepogW2vhlN9YVh53
         NTz4ZiLW8l43K1BSWUAopyOn4uEqZFtNia7RA2oTW4GqXYuCq+agYSjnW0tGc1JEsTje
         SsmRwH+K9L/IAHTkmanimqk3MyqEY+CbL75S1yW9u6yA1Om/Eulc0XSiiP4VsPlLqFhN
         VLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hOY4CuQZcGE5+DiEJO7y8J3c5vg/AkJQXHGmscUeoYc=;
        b=vPmJyRpGdpNNEf6cMAoEfdOONR1xDajCVyXQqZQq2wM5XnhzV2QXwf1lgyKJK5WV5P
         9ybrB+WIdQXj2cZDebvXl1DXupFHjY00M6vykab7wQv2tIb7d6NezJ8/HrP/iUdjIUS+
         cm1UAZJaZDX3UpAsbESJuiYjqFK/ECKXZ0LDGq0/BJxt3YnBT03qKspwfDEVsWnBcorz
         VRQOSKKBLWCSEbvFYmcfN/39pTyeBAqSRLHor52nCysaAgZtwasYJsP7+nzAYXb5hcV2
         UdWMTefn3zV7agbL2rfqvTG4x1gX/0by4EG/gtJJ1YtrrFmT5NR4V8jF0PdL4WvFuxTo
         5j1Q==
X-Gm-Message-State: AJIora9PCC4PbGGSyfeG08UuI18PsTFLOsL690Jn60n9HHSeSfL1s928
        IyBor1RZ376pG++6x4yc6n/wjw==
X-Google-Smtp-Source: AGRyM1ubY1Snyi4CgyTbowBekYHuXwEbWCTnyMyOed8scTtWtvtdfjS3amI0YoUS7hjIBzl0q4JHlQ==
X-Received: by 2002:a37:b483:0:b0:6b5:8688:5299 with SMTP id d125-20020a37b483000000b006b586885299mr20854022qkf.147.1658245192575;
        Tue, 19 Jul 2022 08:39:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a410800b006b5e533e954sm7453151qko.5.2022.07.19.08.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:39:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1oDpKB-000mo6-AH; Tue, 19 Jul 2022 12:39:51 -0300
Date:   Tue, 19 Jul 2022 12:39:51 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Cheng Xu <chengyou@linux.alibaba.com>,
        Kai Shen <kaishen@linux.alibaba.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Leon Romanovsky <leon@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-rdma@vger.kernel.org
Subject: Re: [PATCH 1/2] RDMA/erdma: Use the bitmap API to allocate bitmaps
Message-ID: <20220719153951.GK5049@ziepe.ca>
References: <2764b6e204b32ef8c198a5efaf6c6bc4119f7665.1657301795.git.christophe.jaillet@wanadoo.fr>
 <670c57a2-6432-80c9-cdc0-496d836d7bf0@linux.alibaba.com>
 <20220712090110.GL2338@kadam>
 <20220719125434.GG5049@ziepe.ca>
 <20220719130125.GB2316@kadam>
 <7075158a-64c1-8f69-7de1-9a60ee914f05@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7075158a-64c1-8f69-7de1-9a60ee914f05@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 19, 2022 at 05:36:36PM +0200, Christophe JAILLET wrote:
> Le 19/07/2022 à 15:01, Dan Carpenter a écrit :
> > On Tue, Jul 19, 2022 at 09:54:34AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Jul 12, 2022 at 12:01:10PM +0300, Dan Carpenter wrote:
> > > 
> > > > Best not to use any auto-formatting tools.  They are all bad.
> > > 
> > > Have you tried clang-format? I wouldn't call it bad..
> > 
> > I prefered Christophe's formatting to clang's.  ;)
> 
> checkpatch.pl only gives hints and should not blindly be taken as THE
> reference, but:

Oh, I think alot of people don't agree with that one, I know I don't.

Jason
