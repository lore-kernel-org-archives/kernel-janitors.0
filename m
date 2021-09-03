Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D14C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Sep 2021 12:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D638760E8B
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Sep 2021 12:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349140AbhICMZV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Sep 2021 08:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235264AbhICMZV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Sep 2021 08:25:21 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B487C061575
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Sep 2021 05:24:21 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id gf5so3000331qvb.9
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Sep 2021 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AjVVv2ndb2u5Bt4uUF9TlcBGvkr2yBKHs0BYvFEiwhM=;
        b=gGIslmjuvjmkuQE+MEw2D09EW4vDOuMlNxsSM/ktZ1WBAGN0rCOgOC0WBF8Pk+FMaE
         7i1joaB5gBAmJUqpqz9IMmHXWUaSQ+HttFLCkX4i/TTtxUI1WCJ+bIIbMTZoKG1P1PVP
         rRp5XhWoUPlhKABNFH+Z1T5wARWdSGlN0tqqXO84rUiWuaMeUFfgB8WQxzx0Lng+HFEw
         +hy0WhoOTknyTagvlH2TBDMgG5qEz2hTr3ob4IxVCA951tzGMvUJjg+muXTKr/02rEIS
         1Ydj6mmRRXAbe5t23lTGLiPPIzkKfPXKKTl94e4F7ZES4BTQdhObBaI+dHC5c2Vz/ysO
         15LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AjVVv2ndb2u5Bt4uUF9TlcBGvkr2yBKHs0BYvFEiwhM=;
        b=fQGpK67bTtG11pyEnG1038154sgaWOaKUKbLdI4NI5XNBDYnL4xrowi+KxCkBinfOU
         uBNbp6bVPW07YszT1LAguh/m777yR4JiNmRxZsTg+7guBQ8gKPmQhClEW8x30x56EkeG
         xHRB+sEA0ybb/4f8vY5/EUqSnx//m1fR747rhjxyiRm6qUmcwO4v9VWLXlRYIuovUhKN
         sXH2g09xOnE3QIt0/chegIG+HajvF61b9YfidM7TZ/aywdJTHlNQbQ+L8VZiXj6P37Y5
         4fUBUjuZMDEuhjpsUekeTwFtws7JeU5aiW3z/ap8jg2uuMUlvH7QGIUc9zXlkASyk9WS
         tNNA==
X-Gm-Message-State: AOAM530ccGmpTSacqyMlAgEP+H6mXCQDU2lx4hUvfuJQFhNx27/JNTcc
        Z1gVM5ZPqwk2CkLyc0FMqgAsSQ==
X-Google-Smtp-Source: ABdhPJx0ZRB4N7U15Yq2f7MIxv4JxXW05wcJNeaYCXXvbjwj/xN2sCap7XlcXbOyT6yjd1yWliCKqA==
X-Received: by 2002:a05:6214:21cc:: with SMTP id d12mr3132616qvh.22.1630671860349;
        Fri, 03 Sep 2021 05:24:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id c15sm3703514qka.46.2021.09.03.05.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 05:24:19 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mM8F0-00Agea-T2; Fri, 03 Sep 2021 09:24:18 -0300
Date:   Fri, 3 Sep 2021 09:24:18 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] vfio/pci: add missing identifier name in argument
 of function prototype
Message-ID: <20210903122418.GU1200268@ziepe.ca>
References: <20210902212631.54260-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902212631.54260-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 02, 2021 at 10:26:31PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function prototype is missing an identifier name. Add one.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It seems fine, but is there a reason to just pick this one case and
not clean the whole subsystem?

Eg i see a couple more cases in the headers

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
