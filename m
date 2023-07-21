Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49C7EB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 05:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjGUFhO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 01:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjGUFhM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 01:37:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517541719
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 22:37:11 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso12978425e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 22:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689917830; x=1690522630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vX/JkYsTJ988R/jCJEP3BfL7G/1slMZU41YSurteI2o=;
        b=cRa+TxE5YsEqvBdKD5o7cITaabLFv6sjdy6P6XfGu8K/hmOCOfl70qGcRIwYPv5c7Q
         t8k+5TNSqPwr5k0C4Kq7aF6a3XvJ24z1Eh8s0wo/HpkRQf3xO58UqcJD1mn3XM6QZFGR
         u+W/lqKUM+ne+jyeXsBHnnf8qWpgFgoxo4trX85idDJ+j/MtiA60gevN4ajdbHSXBBp3
         nOMsDtAm/npF8oqBGE4SHQDIQeHkxicP3tnUmGk5Mb3J+1kbEaYWJBSj2EJpIoRppjPr
         rIfDnSqmtOD+YFuxLOYfhJ1st5S3wOX8RqWHa0BcSxhpNcSO/vYJqhraZeT8Yri3yn+u
         TJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689917830; x=1690522630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vX/JkYsTJ988R/jCJEP3BfL7G/1slMZU41YSurteI2o=;
        b=f+BoE2mE/W/2t2Dm6q06hOp9wivkurKl3p8qNeI29RhkbT2eDW/GklY+yTNnNFD3zi
         HXI3QOM3MGGZ9MlppJjz0+JV24LC+GkNdd6jQ6lNjIShpAM5x4Xc3sPYbZocojgGA8G5
         34z8Ln3pGIOVsIuTdIE+QYUMTVr6RMf0W+kJ6H3KHTA+k2gJySHkcLMBNmT/DHs3xmSi
         dDQDCknALgYKuu8l4T4F7i1zCISIFwGqKEJkEBtIVK8poqoHUgZnei49N98eAlyo0Cz3
         H9xTEhrV59Kfmg5RFVWoVZ+CgNKq4+0Ro9cTJTtYprRpBeJl0s1HMyS5ivqkcxGaT7Dr
         EZBQ==
X-Gm-Message-State: ABy/qLZTPiMfoijU39sPNNfx3gAakeEEIXoECRVnjiIb3o24x/g1kahD
        Pk7wT1vtHuSDdobnuD6jdSNK9Q==
X-Google-Smtp-Source: APBJJlHuuEtVJXP90otgD42oqbE5kUntVWwp5lSVN+QyO4G3yrhO6MftAcWJefiLMXZjXf/Ea8z+Vg==
X-Received: by 2002:a7b:c401:0:b0:3fb:bc4a:46ad with SMTP id k1-20020a7bc401000000b003fbbc4a46admr497865wmi.9.1689917829691;
        Thu, 20 Jul 2023 22:37:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c229300b003fb40f5f553sm5409400wmf.31.2023.07.20.22.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 22:37:06 -0700 (PDT)
Date:   Fri, 21 Jul 2023 08:37:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mtd@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in
 fun_exec_op()
Message-ID: <604b0c70-01cf-4cbc-b387-8c709c972fef@kadam.mountain>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
 <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
 <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 20, 2023 at 08:27:28PM +0200, Christophe JAILLET wrote:
> Le 20/07/2023 à 09:04, Dan Carpenter a écrit :
> > On Wed, Jul 19, 2023 at 11:55:01PM +0200, Christophe JAILLET wrote:
> > > 'op-cs' is copied in 'fun->mchip_number' which is used to access the
> > > 'mchip_offsets' and the 'rnb_gpio' arrays.
> > > These arrays have NAND_MAX_CHIPS elements, so the index must be below this
> > > limit.
> > > 
> > > Fix the sanity check in order to avoid the NAND_MAX_CHIPS value. This
> > > would lead to out-of-bound accesses.
> > > 
> > > Fixes: 54309d657767 ("mtd: rawnand: fsl_upm: Implement exec_op()")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > 
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Good eye.  I'm assuming you did something like this:
> > 
> > #!/bin/bash
> > 
> > FILE=$1
> > WORDS=$(cat $FILE | perl -ne 'if ($_ =~ /\[([\w_]+)\];/) { print "$1\n" }' | sort -u)
> > for i in $WORDS ; do
> >      grep -Hn " > $i" $FILE
> > done
> > 
> > regards,
> > dan carpenter
> > 
> 
> I did with the help of a coccinelle script.
> (which can certainly be improved, so adding Julia in cc: :) )

Harshit and I were mucking with this about yesterday.  He made
Coccinelle script as well.

We found three bugs in max9286_parse_dt(), hisi_inno_phy_probe() and
jent_testing_store().  Only the one in hisi_inno_phy_probe() is real
life bad because the others do an out of bounds check followed by a
mask.

regards,
dan carpenter

