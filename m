Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0496C7EE2D
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 07:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238124AbjEOHgJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 03:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbjEOHgG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 03:36:06 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B289C10D0
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 00:36:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f41d087b3bso93729775e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 00:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684136163; x=1686728163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ogyt3w7itUo+rHlMTlZBSSla7TInVf3CNLCbZty+gyk=;
        b=jvPjK4/5XlZn+OlOsyK1ZW5x0wykse+Hn2H/3MMPXoIG0AiCiyty5Bn7a5llfJgm+C
         7DwCSu5k+v9gug88dOqEeYOQKIIMpC0YkHIG6doLmKR8HIvNFiPOo1qXLGh0AzCHpNlF
         ubyPVRgO4aBDcnJAHFMDFbK4uFf3VVysg8cB4yg9ATJoT16Em6+UN794WKwxvDGqwU02
         fX5Rz5F1rIpX0UTf5CHKIfobGv3xBK93rqgrJB4Oz1EHxav5z3uBf2zWu6gY0J79BB5y
         tipFCjOFrMMhgwoUw4YyGUvqmhAGPCljM9HaBkqI1BDBF3VO3kUMtSNMuqOWIYjZeO2K
         EPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684136163; x=1686728163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogyt3w7itUo+rHlMTlZBSSla7TInVf3CNLCbZty+gyk=;
        b=LtsR6ms0fmyKEb5hZssGvK2NP4R+3GpAxWh2xQct3+rxoxAhRCTM8GQUxvKnq1or4a
         CxrClvjvYOD6XDIJcioLWjymqPLiyY+H5Q6IJS/Upe+uuPiK4vkayWnZ5SEsXYDo9VNv
         Buqqia0vBJ8X/5DyEYBXIRdPoFPuJoZZfV0vNLt0bLTeLEixqWPB/FXy1k8VteMyzcfx
         BKj28C9aK4fJzvfP5J5Jo7wYt67zTk39/Wrw8gRTLabMr3phY2H2oN/nuECPkj9g9PHp
         N5pXs4kj9UbI9sNSu0erSawT4ekYjCHIpXj2UrsLNii3rQ/8oC84pE7LvKlZ0czpS/eT
         /zCg==
X-Gm-Message-State: AC+VfDxcLqRx/88a715RSSkMb0ayUD+8ybN88OMea8U+paFM/UcXsrIS
        Q8QSUGjAgtpAMt4Uwi/pH03xgw==
X-Google-Smtp-Source: ACHHUZ6v7H49onNtAu54KlMySdOPBK1eVP5sZkV6+UtBfjPI+Pqap2JYiybcZpMjEHXD4BVxgaL3qg==
X-Received: by 2002:adf:e448:0:b0:307:cb94:972f with SMTP id t8-20020adfe448000000b00307cb94972fmr11013717wrm.46.1684136163224;
        Mon, 15 May 2023 00:36:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r10-20020a056000014a00b00307972e46fasm23275962wrx.107.2023.05.15.00.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 00:36:01 -0700 (PDT)
Date:   Mon, 15 May 2023 10:35:58 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] coda: return -EFAULT if copy fails
Message-ID: <3e92c08d-9c0d-4fcd-bf15-0fbcac3be26a@kili.mountain>
References: <20230515061923.767680-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515061923.767680-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 15, 2023 at 02:19:23PM +0800, Su Hui wrote:
> The copy_to/from_user() functions should return -EFAULT instead of -EINVAL.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---

Could you add a Fixes tag?

regards,
dan carpenter

