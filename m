Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90634EB64DA
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Jul 2023 07:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjGTHEU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Jul 2023 03:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjGTHET (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Jul 2023 03:04:19 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55531B9
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 00:04:18 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so3086905e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 00:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689836657; x=1690441457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9AlU95qM4t9xHPBYL7DWAvT1cUkDalZV3dRJmbFdb9U=;
        b=dU+ORkJC8RNWsmM5SVA/u5VDWKga3el11dXhQWod28uKQxqV27WsfA/tglMuF8ytal
         oR9rHhg8Ffr8qjFOlQqJ2TP9mDjnM8aHh1J5JZ0M85wyO4MFq/InWjdqlvlmOCXT18oi
         QjpSMQRBEYEVQB6VKcMyoKiOj/fWRc9bltCj1as7WQq4ikJK1y9pA9lypkyLy0PS/V31
         fqTMXHOhDDccm9U/ddyDmuiSNegiYxGBV02zlmpbfcFhi+ia8+CoZbqjukiyT21EcZhf
         bHGNBBO2nLGsAxMvkqHDWb8OMWWqLsO9IvKBYvV6AmrR7RC1LKD/Z8ux8r9zTLpiZhoR
         IGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689836657; x=1690441457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AlU95qM4t9xHPBYL7DWAvT1cUkDalZV3dRJmbFdb9U=;
        b=W7LgG+IKgWT+LQCpaFOCUmEtUvztKPwHh5sghdaGm8fkDrIjPREUtgywawo1iWJQZQ
         BTMKkGh5e9+xdTqh5wW1MakSN483JNlOcV/ZTv32KP7FSRGVUEKCc+PgEhnVdyUW1URb
         sYaOf2MTK0uXTzB54dQ8Kx17z0hxboekR+NPYFIuLfee55MS2x4AbVH/5mQO7Mqnun9t
         IG20HDKLhlfnLb2nh7hoQjAgKcMzGTV9bzWllqU/ENg+g4GkFEEILNhrqfJUZNCGzBVC
         BEbVPpvBcd0sDjBufhsmNWU4D7cjAdQDHcpTSgudEZ1sbkU2QutcuuNNYtI7z84jWpr2
         Yo1g==
X-Gm-Message-State: ABy/qLYGoCVq3AMeqd1qEfe1wEEtJNqA+h6aRTsEVIu9GBlXFqfnVWqO
        VcVwSEXzZwS+92uSaPEhrzsVqA==
X-Google-Smtp-Source: APBJJlETKoi7x80wxBFFAxwsjGt5k10dYMeMuHD3TbDxOf+1dqUg2RtWoOiart0Ss3Mt2QyTH5e1AA==
X-Received: by 2002:a7b:c390:0:b0:3fc:62c:8447 with SMTP id s16-20020a7bc390000000b003fc062c8447mr1061669wmj.9.1689836657174;
        Thu, 20 Jul 2023 00:04:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a5-20020a05600c224500b003fbc9b9699dsm419216wmm.45.2023.07.20.00.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:04:15 -0700 (PDT)
Date:   Thu, 20 Jul 2023 10:04:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in
 fun_exec_op()
Message-ID: <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 19, 2023 at 11:55:01PM +0200, Christophe JAILLET wrote:
> 'op-cs' is copied in 'fun->mchip_number' which is used to access the
> 'mchip_offsets' and the 'rnb_gpio' arrays.
> These arrays have NAND_MAX_CHIPS elements, so the index must be below this
> limit.
> 
> Fix the sanity check in order to avoid the NAND_MAX_CHIPS value. This
> would lead to out-of-bound accesses.
> 
> Fixes: 54309d657767 ("mtd: rawnand: fsl_upm: Implement exec_op()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Good eye.  I'm assuming you did something like this:

#!/bin/bash

FILE=$1
WORDS=$(cat $FILE | perl -ne 'if ($_ =~ /\[([\w_]+)\];/) { print "$1\n" }' | sort -u)
for i in $WORDS ; do
    grep -Hn " > $i" $FILE
done

regards,
dan carpenter
