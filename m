Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143A7C001B0
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 06:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjGXG3B (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 02:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjGXG3A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 02:29:00 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574E6A9
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Jul 2023 23:28:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3174aac120aso850108f8f.2
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Jul 2023 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690180138; x=1690784938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZMHw5ySxpMILXlb19cVm3X1DSn/JeHNvZEDgpJzQ2Y=;
        b=eSibnaCNTqBO716RSCmoRZy5NKQKS5Xhy5kcoNWmpUhJB+sz1weSoiX1wdG1wHCPBS
         /uAvkDYLXE9kiXI+2LUTEsZ1cQTGQGL87g48k610qGB1/vS9Ceq1C1NPvlyk2nU08P7R
         oWSphU3u72bW+6gyVacgKILhalTpdLF4awSwkUSRPDoyRvBUAT9PL+4EO4KRvJFbO1QX
         rb3dLHQMmUGp4l3ECn6Z5Pfv7FGUm1fblDIpNuDqkpLh9OMVnDsbxI/5kgYVm0bAwZnI
         lTFd+vo4hFfwj7NLH5BUdwYvNGlRLGddxsqNN54tstZ1pu8VNaCygeMxkztxICDHZ5qA
         bz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690180138; x=1690784938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZMHw5ySxpMILXlb19cVm3X1DSn/JeHNvZEDgpJzQ2Y=;
        b=QQuteXcGn/pvxEPTjwv5plCZ+5ayXlOQUPHFMrqBVzP0q9GnY1OFDtz2Kfskjqdbg0
         AvY+BoXkrQLvT18hnRH+i1apmNCZr+9jTyJHdWOTgazGqzjXSHq4MNgXX6QZLsxSGg5j
         pgsV7vffD/tf5fjfJYxAAtaU+eG+QXgT/DcIIj1s/mlWLHaSCARaR04Of6dE0UWwoXn7
         c86okXHo/DhVdAiQuA5YegLsvlYjbutu1BkECyV0OZw6HRYc8Cr1rcZzXl1dWHoyvtbm
         tP4yFlaEQiZoUMwoB1niPW9whXo0Cvvl7TuaPt/HPxbDKxA44dCQPbXQG9dIYvUjmPH7
         Ah+w==
X-Gm-Message-State: ABy/qLbw81+Ev4xiy1pkmlIop/6W3vMv8cuQlKUYB94hTqMeAkrz3Y5r
        NaPkgsG/YyYbqQLfqF5urWaZug==
X-Google-Smtp-Source: APBJJlFSBAQ9CJKqsVzHpAjfwM0r+MywCfh5ToI0XJxlm0ZuQd9F/MXyEMU2LUqOmciCRnHz+3ZVqg==
X-Received: by 2002:adf:fac1:0:b0:313:ebf3:f817 with SMTP id a1-20020adffac1000000b00313ebf3f817mr6177241wrs.22.1690180137709;
        Sun, 23 Jul 2023 23:28:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d6382000000b00314427091a2sm11622491wru.98.2023.07.23.23.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 23:28:57 -0700 (PDT)
Date:   Mon, 24 Jul 2023 09:28:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Franziska =?iso-8859-1?Q?N=E4pelt?= 
        <franziska.naepelt@googlemail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        Emily Peri <eperi1024@gmail.com>,
        Guo Zihua <guozihua@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kang Minchul <tegongkang@gmail.com>,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>,
        Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Message-ID: <720bd622-a9a4-46d6-8296-f7ec644ac091@kadam.mountain>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jul 23, 2023 at 12:29:57AM +0200, Franziska Näpelt wrote:
> Hi Greg,
> 
> Am Sa., 1. Juli 2023 um 17:00 Uhr schrieb Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>:
> >
> > On Sat, Jul 01, 2023 at 04:43:09PM +0200, Markus Elfring wrote:
> > > You should not put only your own email address into the field “To”.
> > > Please reconsider the distribution of addresses between message header fields once more.
> >
> > Please do not comment on staging driver changes anymore, it is not
> > helpful to anyone involved.
> >
> > greg k-h
> 
> Am I supposed to adjust something here?
> As far as I understood, I can ignore the comments from Markus, correct?

Correct.  Just ignore Markus.

regards,
dan carpenter

