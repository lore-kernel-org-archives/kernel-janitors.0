Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F05C77B7A
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 May 2023 15:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbjERPiF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 May 2023 11:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjERPiE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 11:38:04 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B99193
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 08:38:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1479155f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 08:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684424281; x=1687016281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EsqRahVjgJpUZh6L0rqmJqsCsD3Ji967F4vfy8t4TUw=;
        b=HO2FVk9puzG36uh2mioXhBi8b2uoG8/EIB3zEx5FwRcyHjNwcnbbIUvs0BqRZevCTk
         SBxzbn/Ko6s0sWpsS9yncIf6lpgSi8t+GNNxM7y97XNJftb+GY3eXIAUjWyPR4FWkClT
         zyLVNsnyTJ9PisVEXcs/gJWJFi3YZyEK2dUT35AlydtAfeLocGzwmc//9FlwJnjGwFW7
         tW9QkOroJTrLpn5SyYHAF24VeYOCJaChxGcUZwgrM7WIgBDCvIu5pfewR5HNLxr3CFrx
         /XC++k2GmN4x/Uv5keVKTByU9IKuhr9OEN12CFLZQMO7XMU1wlHSPkctR+ZsV0zU1Igi
         p5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684424281; x=1687016281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsqRahVjgJpUZh6L0rqmJqsCsD3Ji967F4vfy8t4TUw=;
        b=Cj6K/2DaWXpxKndM2ICcqmxQodYo3cV5AXH4G20n5E2j88o/e6uAOoWlc/Xvw8nBdx
         bghaFc2S3L/SmxQkWQqY7WKANrxkaMYYa08Ve/y4YKY6OxPfhcp6JD1BUNWhGPyiL5sy
         EINzzO2C68qd3ImKbfXQEPO952WzvjRp4FA+ajFpzDXIafBLIx8LoemAvU9ev6vguAMB
         eGgibshyL/obf4Q4s9AVEYoKJ/qaARM7iGlToPn4p5NjfTb8K0ogxKt8vauQVDeW/gcx
         NSGVxjmXOgILXKTEKPkAkYprFQmsVP34F7EaJgtAx3E3WbbdPpURCGe0YsbpJjqgxWHk
         Gz1w==
X-Gm-Message-State: AC+VfDxmFLogM7d4My3CvKUPD6s1FyEmPPQ1ZXSpnwUq11LE9MJARM9q
        9d370lcDmdWuZg1/LZxOgOM7Wo/DdxJuecGwzLk=
X-Google-Smtp-Source: ACHHUZ6sltYH68Hr3UaVUefGyPkXw6Laj+pYOTabF+LGZHz0GgUxbeHveV1LrZFKiVrSItj8AEIOFQ==
X-Received: by 2002:adf:d081:0:b0:307:839a:335e with SMTP id y1-20020adfd081000000b00307839a335emr1855736wrh.44.1684424281497;
        Thu, 18 May 2023 08:38:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b003062b6a522bsm2509765wro.96.2023.05.18.08.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 08:37:59 -0700 (PDT)
Date:   Thu, 18 May 2023 18:37:57 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     smatch@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: devm_ on lists
Message-ID: <5b4e1510-f8a6-483f-97f8-1a5c16a99d11@kili.mountain>
References: <db0e0930-d76c-426b-9d9b-366f97d7e167@kili.mountain>
 <a2866a55-f3b0-ff99-b17c-8f0fc9e55e9b@wanadoo.fr>
 <fb977b9d-ae61-78fb-8cd8-f4d34711aeac@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb977b9d-ae61-78fb-8cd8-f4d34711aeac@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 18, 2023 at 10:02:01AM +0200, Marion & Christophe JAILLET wrote:
> > Nice!
> > 
> > A really naive:
> > @r@
> > expression m;
> > identifier alloc_fn =~ "devm_";
> > identifier list_fn =~ "list_add";
> > @@
> > 
> > *    m = alloc_fn(...);
> >      ...
> > *    list_fn(..., <+... m ...+>, ...);
> > 
> > 
> > also seems to give some decent results.
> > Written as-is, there is a lot of false positive, but is a start.
> > 
> > I'll give it a look.
> > 
> 
> BTW, in such cases, should a Suggested-by, or something else be added?

Suggested by for the script or for every bug it finds???  For the script
obviously that's a suggestion.  Otherwise if you're finding the bugs
with a script you wrote then take all the credit.

regards,
dan carpenter

