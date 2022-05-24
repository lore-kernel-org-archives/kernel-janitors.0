Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5726C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 May 2022 15:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbiEXPgQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 May 2022 11:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238999AbiEXPgF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 May 2022 11:36:05 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0552DD
        for <kernel-janitors@vger.kernel.org>; Tue, 24 May 2022 08:36:02 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 190so8727617qkj.8
        for <kernel-janitors@vger.kernel.org>; Tue, 24 May 2022 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cPQAjM1m9akK4S/p/8R8csriFuLb7VstisXFAwUzXYo=;
        b=nCLgI1Z7r2MYelWfBJ6/7NIKa0r3n3l4bq/XPb0mTEaw9SG3TLOCPcUI3x+RCvjFLy
         B0U+Mg5KS+K++CgUTx1f4YzjqKm95xixRDoxqG7E+1sK9n1uwV5ewXlMoV/E0BxJVJ4g
         bvPae0UDCBQB1GnvoGEmJahCwcfIBbEHoqWZZGTuRR6nsXcMsalmhPg561vZ984AlqWt
         QkkaaAO6/y0ZupUW4tk9F7I4IUo2wcoO3x0NbuqPlDX7Ni2qu52IV/DCLa3jW4dETq+k
         RNUT9SBNmsbopNNm7xxH6duIaW7IX6m8Wp0c1WMcJeNXuVYb0VFgbB9hDXSyj0v0XcXx
         PYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cPQAjM1m9akK4S/p/8R8csriFuLb7VstisXFAwUzXYo=;
        b=R3JfKFIuhkHDD1x6pId3HRZi1ccxHErV6z6YZBkCm5RRz8ZDqn3cDXkRJGI/1TwnmU
         vfRshwAeosksGdjop30aGFqpUzMv8zOY9hfItdvvcy1ny7Qe4Gx8eMP4p3cO0D0qS87n
         Ez6r7nP/bZ62cjUEqzCKM9kotb7MpDNMPvvi3TVbcfmzco0/gCjJ662nArYpGPmJ5OjI
         RJehtloNKGbSlnkyEyVLKnEElelY7BTu8PU5uUJXjh7pLjs4tBkOFO2a8xtYYu4Tszlg
         kjOTTanoZCSSAc4XVWTLYA6hMvCXXL8n/Knv0tE9Oiad57bNZ4yuf4EV3fZbFcUksnK2
         i0IA==
X-Gm-Message-State: AOAM531lsJJBY2f1j2jD+95KXlUXnb5+FiI1ivDtdsNcduuwnTNfYgBE
        /mdyg7ev3/Lo+mlqBgXE+FROPg==
X-Google-Smtp-Source: ABdhPJy2kN6jMzJ8FabEKdoZ5b3xGnUcC8YHL7qwvQqgMAn+1+twTSuVYplEAcIVesviGhNnLk+iVg==
X-Received: by 2002:a05:620a:3714:b0:6a5:564b:222f with SMTP id de20-20020a05620a371400b006a5564b222fmr3156277qkb.648.1653406561417;
        Tue, 24 May 2022 08:36:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id k12-20020a05620a138c00b0069fcc501851sm6072009qki.78.2022.05.24.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 08:36:00 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1ntWZk-00BGBD-7b; Tue, 24 May 2022 12:36:00 -0300
Date:   Tue, 24 May 2022 12:36:00 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mustafa Ismail <mustafa.ismail@intel.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/irdma: Initialize struct members in
 irdma_reg_user_mr()
Message-ID: <20220524153600.GB2661880@ziepe.ca>
References: <Yoz4iXtRJ8jw6IeD@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yoz4iXtRJ8jw6IeD@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 24, 2022 at 06:23:53PM +0300, Dan Carpenter wrote:
> The ib_copy_from_udata() function does not always initialize the whole
> struct.  It depends on the value of udata->inlen.  So initialize it to
> zero at the start.
> 
> Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> What I know is that RDMA takes fast paths very seriously.
> 
> This is probably a fast path so you may want to implement a different
> solution.  If you want to do something else then, just feel free to do
> that and give me a Reported-by tag.

This isn't fast path..

But the bug here is not validating inlen properly and should be fixed
there, not by zero-initing and allowing userspace to pass in an
invalid inlen..

Jason
