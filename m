Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B26EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Aug 2023 05:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbjHAFtH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Aug 2023 01:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbjHAFtB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Aug 2023 01:49:01 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6251BC8
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 22:48:48 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31765aee31bso4692115f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 22:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690868927; x=1691473727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Et0y0K2d+vVjwJdOfEnIsO7SeHd2XahanE6nhjTZtyw=;
        b=ZGI+j/vdjy03FGaaR+xJmI0DMD0W/H7WW0lm3ZBYDDRezadMv0/SINLUbiIcwOtcVB
         6rWtQ2cJvXxRZSulEQomaoyiqBzEnpaplbDFim591uXPwyf87YmFLWNt8bAd8yRX21DL
         GPjKd1X6TmlAbHcj+cjT6rSO288MI/s1Ly9eRctTJkVrb4crvbJvy2HCXg0B9TwHFNog
         exm46xW+eeXJaPHIok5LOyVhVurfSDya4DvT5rzGQTRfvdYmYkmfRftvjki7vmeyBJze
         IB5E8F2VxjFjcTuEPg8Qfyk/2klnS8EVtHCoM+VIx9+1reKs06NNxqmEiizsalvFHGLR
         NLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690868927; x=1691473727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et0y0K2d+vVjwJdOfEnIsO7SeHd2XahanE6nhjTZtyw=;
        b=SxQtP01kcItngjAXuuJokivXfAoLjCfxZSSk3keFMX32d/sxAT9HI4O4KvF0MYSMc5
         15xZKnUWvvMrvfC5YLOejj+3fqS0sCD4ewXON1+0wjkCpURYzvME2axd4zhd3RcEysM8
         kcdi2CaEyU5IvEux4PpLThEBfPd0C9OFFrgClNRtjOJd6NxtvNEhrR4qPr+APYgkGbI/
         sN7TShVci/dJp0EJIdmrwIZORSSIiaRXn7vtcKqb/upciVH5RIHvc9aFQZYCEMLlZsf5
         +UudCivOfd57QJa1btYeJKmgZvxb6f7etyW2RWK6ICDfMnffyhq5skdx6JKiMk+3Qwnn
         /L9w==
X-Gm-Message-State: ABy/qLZey2NlfWpezrweqDJ55CtdxOi8hJbdaVVdZUp9wshbSgCOmdZf
        6KrmLkEK0NQds2wyezNANXVs3w==
X-Google-Smtp-Source: APBJJlHhGeuATSL7uKZn4NPYaNxFYSoHPGkAI7laRJP7KUIdZtITolb3PfjPpmxMeGEj/ExyQbcwog==
X-Received: by 2002:a05:6000:1808:b0:313:f395:f5a3 with SMTP id m8-20020a056000180800b00313f395f5a3mr1408315wrh.38.1690868926808;
        Mon, 31 Jul 2023 22:48:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6184000000b003142c85fbcdsm14984240wru.11.2023.07.31.22.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 22:48:46 -0700 (PDT)
Date:   Tue, 1 Aug 2023 08:48:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     Tony Huang <tonyhuang.sunplus@gmail.com>,
        Li-hao Kuo <lhjeff911@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com
Subject: Re: [PATCH next] mmc: sunplus: Fix error handling in
 spmmc_drv_probe()
Message-ID: <042ff6f5-58d4-4e93-aa26-79411bf81c54@kadam.mountain>
References: <20230801052321.1328225-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801052321.1328225-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 31, 2023 at 10:23:20PM -0700, Harshit Mogalapalli wrote:
> There are few issues in spmmc_drv_probe():
> 
> 1. When mmc allocation fails, goto is a no-op.
> 2. When mmc allocation succeeds, the error paths should use goto instead
>    of direct return.
> 3. platform_get_irq() doesn't return zero, so '<' is sufficient.
> 
> Fix the above issues by adding goto instead of direct return, also
> remove NULL check in 'probe_free_host' as we changed the goto to return
> when mmc_alloc_host() fails.
> 
> Fixes: 4e268fed8b18 ("mmc: Add mmc driver for Sunplus SP7021")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/a3829ed3-d827-4b9d-827e-9cc24a3ec3bc@moroto.mountain/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---

LGTM.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

