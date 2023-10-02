Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DE6E784A4
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Oct 2023 07:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235782AbjJBHgk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbjJBHgi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Oct 2023 03:36:38 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4B4D3
        for <kernel-janitors@vger.kernel.org>; Mon,  2 Oct 2023 00:36:34 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso12645414a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Oct 2023 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696232193; x=1696836993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8TgiYq+wn9fPs2sstUM34/3tbN8lpchGjTxpN3osFc=;
        b=EYcTIe1rA5iMT9Eckl75edHfhjI2D9SUeW2wCe3HFLYHXWuxwOgTZgpt6Z4iwjUTES
         s4ersIvJVc++7TZ+J8kJOkFvuOqa2DRihG/rYeoatuYKdMDtbiepbwDoOryk6a6nn9m3
         y9uwYMVUPlfjSUYEdwLj2h09wNwEfTgEIFC/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696232193; x=1696836993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8TgiYq+wn9fPs2sstUM34/3tbN8lpchGjTxpN3osFc=;
        b=BKChlSHfkAJzUB7F/x1UXJ2RoCE/gA/OKTsjNc33Ms/UseIw8kyGkQx85PLMxI99uk
         6jLKFw5dGF9sNxis/uBshM5dpx/S7cYHp/WDQgnJZFc5vcTOXPZeN04zYaPtIPM3B83l
         GnF375oA5SXkyTx+ZJLtnOiEvAEzIrkPFxgYLU84Eoqiu+vEMPxu5ZMDoHQsOi2clpOd
         uOJ+81JdqcC2Hgm1xqSGHEf0wSLnoXIxOuRnXYfjgKIwGY0jK4xMQ7Pi7LUVM3LQ+Z9V
         5vRQvj11zJi73vZnqghTHaIml7UXPmBdBzO0fu/Y9FZOIw7jkMfD19TSOvlVYirqgThA
         B90w==
X-Gm-Message-State: AOJu0YyvQBrL/p8y4MGHcGl/R7CPuxZqdjdLcceEF9y5fnihfSKse1tv
        I2qsVyzX5WEnyV+yiLW2rrxg4MQ+b+MeX+HfRDk=
X-Google-Smtp-Source: AGHT+IE/4RrZBVTAWpHkJyOr41YZ89aixqnrkCQ1kdzSx+Qmep1XqZBJfajMYApMeMqYNsEHfwK1sQ==
X-Received: by 2002:a17:90b:3644:b0:277:1bd8:abe8 with SMTP id nh4-20020a17090b364400b002771bd8abe8mr9560405pjb.18.1696232193693;
        Mon, 02 Oct 2023 00:36:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a194600b00278eb908f78sm6274500pjh.19.2023.10.02.00.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:36:33 -0700 (PDT)
Date:   Mon, 2 Oct 2023 00:36:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Kees Cook <kees@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] comedi: Annotate struct comedi_lrange with __counted_by
Message-ID: <202310020036.864B735D60@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
 <202309301342.5B5BED40A1@keescook>
 <alpine.DEB.2.22.394.2310010945130.3166@hadrien>
 <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
 <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
 <202310011405.7599BA9@keescook>
 <202310011421.C4F19D45@keescook>
 <202310011515.D4C9184@keescook>
 <alpine.DEB.2.22.394.2310020737570.3166@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310020737570.3166@hadrien>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 02, 2023 at 07:38:42AM +0200, Julia Lawall wrote:
> The sizeof with an expression argument is treated differently than the
> sizeof with a type argument.  So you need to write:
> 
> @allocated@
> identifier STRUCT, ARRAY;
> expression COUNT;
> struct STRUCT *PTR;
> identifier ALLOC;
> type ELEMENT_TYPE;
> @@
> 
>         PTR = ALLOC(..., \(sizeof(*PTR)\|sizeof(struct STRUCT)\) +
>                          COUNT * \(sizeof(*PTR->ARRAY)\|sizeof(PTR->ARRAY[0])\|sizeof(ELEMENT_TYPE)\), ...);

Ah! Thank you thank you! Yes, this works great now. :)

-- 
Kees Cook
