Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A22C43334
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 16:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbiGFQSS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 12:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbiGFQSQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 12:18:16 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387DF27FDF
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 09:18:15 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id g14so18918601qto.9
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Jul 2022 09:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z5AtWZPe7XoqBJU6Mk4sFJpC18BYt1O5VeJ13XcQzX4=;
        b=Ewz99xqh8v2JGDRnfSIbSELjNOHHdsxNwR3glx8EoOGGev5aohpcw6bWI/kSKPXG0P
         eN6PsAah0mHTRNi3bHI/PD93M4mNRFT9xFR7Xp1ALIJ7MO5UqM1gbfU0vtFnJL4eAXBj
         7HrxdcAznMe+kLEOERuVkQ9iw6gfkPre8defoP11IpiTfUbN7erJSe1v4uTtXgHQMNYK
         qNiR89H3qjJgEivlIv3cciUWJwZPYmnvfH/tVJ18bh+iMtLrA+MY48Ku6YwKjZlJHlyQ
         gsVePEmk9eXsyuDLBOad6mIO/zu+2ZipibQZ/do77BtbkNy7IWxAJErql/N1oRbG6ebq
         Ozqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z5AtWZPe7XoqBJU6Mk4sFJpC18BYt1O5VeJ13XcQzX4=;
        b=44L5H/wL+eXsG04msfmhyqMGNlHGUWhEKuhT/00EMXvrxiF0VjnLN5iRSSWo5cmuxT
         XT9hZYlLWiXQbMoiTxirm55eNh+/sALBjpb1qDCFXYMgl5BOVsfInAYFXfMxuhkuiRMa
         Xzhig/87N5ZwTjYJlx6seNwOPPQ5GLU0MU9UQs2xUg1rOzfk/TGkwmwIXmeS11hR0Mh9
         sjzlLnHuP2FRTSn2QleWsOky7DjJxuf4TpsJ4SlM0j1uxJvY51oqc/QCA2grKvjjlMhm
         qCh4EpXZB9UMSPtK1urKgJGcLQsbQ10OfwVuQ9wGfBaL/6x3idPTNlWRkT3Oqb1unn6g
         B+1g==
X-Gm-Message-State: AJIora8GSod6xsxJdQ94w0PLqwv4V0+1meQK6kS0N7sYS66DoFzf2dRO
        vAuMfKwQjO2stSKthl3vVQ9y2Q==
X-Google-Smtp-Source: AGRyM1uj3Zv5IfAsAH88CBXvJ1B+xqPgTHtuEYaKAMVSg+irD6dNO967VZRHDnXBhdHxHFqYCJ6SLg==
X-Received: by 2002:a05:622a:450:b0:31d:3a5d:fc50 with SMTP id o16-20020a05622a045000b0031d3a5dfc50mr22010953qtx.433.1657124294361;
        Wed, 06 Jul 2022 09:18:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id v18-20020a05620a441200b006a701d8a43bsm24578677qkp.79.2022.07.06.09.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:18:13 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1o97jA-0076he-VG; Wed, 06 Jul 2022 13:18:12 -0300
Date:   Wed, 6 Jul 2022 13:18:12 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Longfang Liu <liulongfang@huawei.com>,
        Yishai Hadas <yishaih@nvidia.com>,
        Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vfio: hisi_acc_vfio_pci: fix integer overflow check in
 hisi_acc_vf_resume_write()
Message-ID: <20220706161812.GJ23621@ziepe.ca>
References: <YsP+2CWqMudArkqF@kili>
 <20220705180649.GI23621@ziepe.ca>
 <20220706055124.GA2338@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706055124.GA2338@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 06, 2022 at 08:51:24AM +0300, Dan Carpenter wrote:
> On Tue, Jul 05, 2022 at 03:06:49PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 05, 2022 at 12:05:28PM +0300, Dan Carpenter wrote:
> > > The casting on this makes the integer overflow check slightly wrong.
> > > "len" is an unsigned long. "*pos" and "requested_length" are signed
> > > long longs.  Imagine "len" is ULONG_MAX and "*pos" is 2.
> > > "ULONG_MAX + 2 = 1". 
> > 
> > I wonder if this can happen, len is a kernel controlled value bounded
> > by a memory allocation..
> > 
> 
> Oh.  Smatch uses a model which says that all read/writes come from
> vfs_write().  The problem with tracking kernel read/writes is that
> recursion is tricky.  So Smatch just deletes those from the DB.

Oh, maybe I got it wrong, len is the user input, so yes that does look
bad

> > This code was copy and pasted from drivers/vfio/pci/mlx5/main.c, so it
> > should be fixed too
> 
> Sure.
> 
> I created a static checker warning for this type of thing but it didn't
> catch the issue in drivers/vfio/pci/mlx5/main.c because Smatch says that
> the bug is impossible.  Which is true.

How come it is different?

Jason
