Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C6DEB64DC
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jul 2023 08:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjGFI2e (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jul 2023 04:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjGFI2d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jul 2023 04:28:33 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9557172B
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Jul 2023 01:28:32 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-314313f127fso336765f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Jul 2023 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688632111; x=1691224111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xdgSXkLW8btnJKUBXJC+TeWedvbKjdiDMe6ulQpDuH8=;
        b=XJV62+zlp/K4ml2ErtWJOpPTQLWSjeHPy+ncWelv1YSfL5T/oIKfUBIJP08CVA7p0f
         r7oWZa+Avh1hlP60A664f+m9xe3EPXcEB6S3zOvHzHrfrcenPdxdlI9ilVktxxM/0dYh
         aRIpJfQkrPhDksSFjvjqeBeEK1J1M5rPZVBTaHNmOpkJtl8xaGAu1k36IrIp12fSxNLs
         7us8sHelvghMPDUzzH13PuKUmQNiH51PsypRSaKvhCmb6V6Q4jT9/drV2tmiGtNhjRMd
         hH5LASNt0xprVVOS5UwjsRlGOmprtUHF6tzzPraEK1kwX1As6zGEj1X0dZCkIdbjN5X5
         lUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688632111; x=1691224111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdgSXkLW8btnJKUBXJC+TeWedvbKjdiDMe6ulQpDuH8=;
        b=mFIT6hluqUcu6hp6fZxztWWTuZGa5Fc1rtcbUGfXiVHfiIqLD6t13tsZ3WADDuyOG9
         4vUCUg9d2rqF+8dABfMGQLKSV5RwB+NnGwknSH1G8WCvX6nhRX6Z25CsN5deBTidSE8h
         REVT7HiWpYurmDCRmXy1D7QuRvvm0Xnses9OpGWX8oDqPlkX7jHFtRanpNJzepjHbBia
         GRSKXB1XqkoE0RFiKRC8aVfX/EYF+Nte3KpxRBwjC0VHrgjJxXpdIM1DwrpFK9ei57Sd
         92pkZNVsHJ0zq/atlgEPXZ14Z7mgrYCLhFLrjrxKZ9N1vjd9AEd11ttgobQ7A9IkALsb
         A7Ng==
X-Gm-Message-State: ABy/qLaToVn3Ufeit0InFnp7cW42JTvskmL4Q51LQCuhtwy6/hWDH3uv
        RvlfFjG3dMu13QPjDs/gr0KuQw==
X-Google-Smtp-Source: APBJJlEZb3nPZqefx4c1NG+fq3u2P2HPtqyiUlSmHOa8fdh5zvO02GNVGBScZyFzHbbD4oZYR7Si+Q==
X-Received: by 2002:adf:fd47:0:b0:314:268b:21f1 with SMTP id h7-20020adffd47000000b00314268b21f1mr899410wrs.18.1688632111297;
        Thu, 06 Jul 2023 01:28:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s16-20020a5d4ed0000000b0031411e46af3sm1188648wrv.97.2023.07.06.01.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:28:29 -0700 (PDT)
Date:   Thu, 6 Jul 2023 11:28:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Wang Ming <machel@vivo.com>, kernel-janitors@vger.kernel.org,
        Dinh Nguyen <dinguyen@kernel.org>, opensource.kernel@vivo.com,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in
 svc_create_memory_pool()
Message-ID: <083cfb82-84cd-417d-b5ac-2b831b24710e@kadam.mountain>
References: <20230704082706.1721-1-machel@vivo.com>
 <fe780326-2150-a3e6-e451-ea82be65e0cf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe780326-2150-a3e6-e451-ea82be65e0cf@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 05, 2023 at 08:21:02PM +0200, Markus Elfring wrote:
> Please apply a more appropriate patch subject.
> 

Markus, a number of people have asked you to stop with this nonsense.

> 
> > The devm_memremap() function returns error pointers.
> > It never returns NULL. Fix the check.
> 
> Would the following wording be helpful?
> 
> 
>   Replace a null pointer check by an error pointer check after a call
>   of the function “devm_memremap” in this function implementation.

No.  The original was fine.  The original commit message is more clear
than your proposed commit message.

regards,
dan carpenter

