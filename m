Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B526C00528
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Aug 2023 09:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbjHCJK6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Aug 2023 05:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbjHCJKx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Aug 2023 05:10:53 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECF6E53
        for <kernel-janitors@vger.kernel.org>; Thu,  3 Aug 2023 02:10:51 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so7482625e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Aug 2023 02:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691053849; x=1691658649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJpah36ty+h1V+d/yS60/V9o8V1RRKpQA+HMeX/JC0I=;
        b=zRU32KM/s4kejwypSNsftglC4dId0r9jmFUNmjuS56xQIPZKXicT/nxtm7K0Vo7rmt
         e7H37M922zt/gFoHsDGnUXQLs+jyzey5hfJLzRcvYwBowjqlU8tySGn/7oiJafC/5tde
         f0qol4Y3xusJ/wEZBTGEpSqzTQrZyMkwmTnWZt8bZ3Tewr+DkOsdty638egRkk2g/4RZ
         Gp+cfU27t6obG+V6TwMCjrKMsu5o2Q9dpUtpXZ7eTD7DWf6DMOf/+GepJGqhF1etOI8/
         fW/zxjuzkaC17izXgyg1IuPbrUX7RvxojGxpwHiLncGwtQrfSDDRQxYkZnkgT1TZKiEn
         hHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691053849; x=1691658649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJpah36ty+h1V+d/yS60/V9o8V1RRKpQA+HMeX/JC0I=;
        b=ARd6PvQcoD2LHLux59PagDQd/K4iLoZqDesd2DNtD9v/Xp8iU78uEy6B113VAO4kSC
         KfwY5T2jau931lXFmMTHPg5OUyz3m1p0m4w3x1zY/b2EkZFNo3Cz2F84072IkA3vTzPz
         DXtxyIvAau6GRKlK6sE8Yv5h8PTqNkkw7C/XajT8WQUTXlsMRVClYcHRBmGeRlQIiOBk
         kxZ9ZgKMwG6aVk/2E3UiZZ5tCTx6vojaidxzswEl6BGdHHwhLPPCTKjvY5bACmZV7H4/
         7m1jumPf8yWLfZe7FcY4TvU7raKmyNbcqvnozYOZ5eCo25KC7fYXNtm/0LyBlF/DLzKG
         0NEw==
X-Gm-Message-State: ABy/qLZmc4m6pO/jmubUDWPhBRLuwtfkUW+bmolNF0GXSrkuDKwt1oUL
        BN/Fue+TqS2TjoCuDFs/fUzF1w==
X-Google-Smtp-Source: APBJJlG1QbuLw2+H8HhnJeVT1Av59WDq9CwoIWlgg+11h4NWNHUKX3rJlFzg7p+nNHtO4/ZveaIgYA==
X-Received: by 2002:a7b:c34d:0:b0:3fe:179a:9eee with SMTP id l13-20020a7bc34d000000b003fe179a9eeemr6942588wmj.30.1691053849395;
        Thu, 03 Aug 2023 02:10:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bce0e000000b003fbc9b9699dsm3702132wmc.45.2023.08.03.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:10:49 -0700 (PDT)
Date:   Thu, 3 Aug 2023 12:10:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, chuck.lever@oracle.com,
        jlayton@kernel.org, neilb@suse.de, kolga@netapp.com,
        Dai.Ngo@oracle.com, tom@talpey.com,
        trond.myklebust@hammerspace.com, anna@kernel.org,
        nathan@kernel.org, trix@redhat.com, bfields@fieldses.org,
        linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs: lockd: avoid possible wrong NULL parameter
Message-ID: <057a4eea-d55a-4402-81c1-46b04b405a73@kadam.mountain>
References: <CAKwvOdnRwmxGuEidZ=OWxSX60D6ry0Rb__DjSayga6um35Jsrg@mail.gmail.com>
 <18edc2c7-2fb0-493b-9a9f-549acce4e87a@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18edc2c7-2fb0-493b-9a9f-549acce4e87a@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 03, 2023 at 12:16:40PM +0800, Su Hui wrote:
> Should I send a separate patch for this bug and add you as Reported-by ?

I feel like neither of us know if we should add a check to the
intializer or remove the check from dprintk.  If you know the answer,
than absolutely, please send a patch.

regards,
dan carpenter

