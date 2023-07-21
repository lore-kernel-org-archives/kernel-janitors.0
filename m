Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2E1EB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 06:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjGUGzL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 02:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjGUGzK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 02:55:10 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C35B270E
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 23:55:09 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3163eb69487so1729781f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jul 2023 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689922508; x=1690527308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNmlJ3n3qyZkESUqFDbn55zZvGbTykf04wh3VlzzJ2M=;
        b=fA2EDLuWemqTcPzlzlAmx7gqs4R8GeoY0s3ZvqfB0cD8eyNdOxy9CggCCu91rSNuZZ
         tDHGmUIRj8MaHRkmSDPWVXK3IG8+qR5LMkm4heBVzehUyUuxRh2wrCKebGEUlEvzWzHx
         6HwfhGGzKLBEsJjAkXgPoyfokKEmEhJcpmkcL7zWQg9b/4jbXzUxJFrUaB0dnURAV8rn
         bttkywZISAzbLjykzQPS5FJBtBvPVb4kbPR8wywfHPYVxqSS4pnv8aaw/BwfVK/bU0O9
         J6Mz7sD5ZOR/bNfkcEBfMu3DxC9JZKmA+KVTOifgkMkQrojTzDRSvLpBJyuR6Cw35sHp
         6q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689922508; x=1690527308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNmlJ3n3qyZkESUqFDbn55zZvGbTykf04wh3VlzzJ2M=;
        b=JAoukkL4fXw0Y2wVUDrBXXvohQgMQ5arDn0w+HAy/OhUV3LpzKwC2q1XcNn0vlv2Vs
         k+iDaN0FVGBO114CES9H7f9IckwulYXTiD9+A3WN1n0lshXLeyW/3l+j0YzNL2PI5Ls8
         rkdI9vqZ23PIGu34TmWYwqfODdTG0jDZDXGm7Jc5I/cu+DFlWOf0Q1jZj1y72x8TuNEr
         VM8D3TkZeYJ3iGIuTA0k/5tp+eNTNsCmqMzNRnqgx0cDVgn13+lixvl1t1+01AkCfdkL
         y6NUO2ibX79t0QsLMNiX4YwKWCX5AaRVNU8mH7tUXXSki/mjqzSvbV4As/pYY5Vx97Rw
         1ZTQ==
X-Gm-Message-State: ABy/qLal410Fd4xC5DlDVp4JZkJv/jgFqAzOWQBLg7uiHfpse+DhkDiX
        k/9Pj3947KEHKpc222gVSibCKwaDWrL/OYsP/m4=
X-Google-Smtp-Source: APBJJlHAMjvc9srETZeqqF2QeqDhmDxQakmm/3s+sSUcsZ9fpOqqrCeUyx6rx6fxFezazMkoh84RmA==
X-Received: by 2002:a5d:4564:0:b0:314:1096:6437 with SMTP id a4-20020a5d4564000000b0031410966437mr847140wrc.19.1689922507952;
        Thu, 20 Jul 2023 23:55:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d5252000000b00317046f21f9sm3276880wrc.114.2023.07.20.23.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:55:05 -0700 (PDT)
Date:   Fri, 21 Jul 2023 09:55:02 +0300
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
Message-ID: <587c59c1-17f2-4c16-b2b7-1b1208e7c128@kadam.mountain>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
 <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
 <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
 <604b0c70-01cf-4cbc-b387-8c709c972fef@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <604b0c70-01cf-4cbc-b387-8c709c972fef@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 21, 2023 at 08:37:02AM +0300, Dan Carpenter wrote:
> Harshit and I were mucking with this about yesterday.  He made
> Coccinelle script as well.
> 
> We found three bugs in max9286_parse_dt(), hisi_inno_phy_probe() and
> jent_testing_store().  Only the one in hisi_inno_phy_probe() is real
> life bad because the others do an out of bounds check followed by a
> mask.

Actually wait.  hisi_inno_phy_probe() is not a bug at all.
MAX9286_NUM_GMSL and MAX9286_NUM_GMSL are both 4.

I was wondering why Smatch didn't find this bug.

regards,
dan carpenter

