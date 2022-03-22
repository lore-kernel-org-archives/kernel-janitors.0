Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D66BC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Mar 2022 13:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235858AbiCVNsD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Mar 2022 09:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236045AbiCVNsA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Mar 2022 09:48:00 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86D026AF0
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Mar 2022 06:46:32 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2e5e9025c20so107988317b3.7
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Mar 2022 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQXVtoNNOTzoC5qZU7/1ecuc9O/zDp2OQHUTN6wFNH4=;
        b=qXbsV6VDEGOklazgM3cMrjtcJViQEQD+5sjq/f8HPRSOkw9PfJbLmANL2XxUdpi8nU
         kg6sSs8d6uPoAfawQLGXG2TWj7dBOySsSfG8Fb6RH03xwEx8SaWEWfS35xIQbuHBL7jE
         aaeKfKFPuOfsoaulDr6cv6o3aIeJ/udNHdKCSKlieJ0kzF6RJDNPd81RZ+y/3BqFmfx8
         qgGJaZSdQqwop60RX1HT58wL91s7krigV8jwHibUgizeSB3IE9DmeTeG4/nP3pBXxRKJ
         q/BKLJ2G6rBiS/5tdRicXh/eY/ZltWUa4hwkcC5/5430zPwc1CZ/coRxWKFjzAGz+AxD
         SABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQXVtoNNOTzoC5qZU7/1ecuc9O/zDp2OQHUTN6wFNH4=;
        b=GmuUBicrFTYKansE+Tfqb+esFVOWGtz/VsaDPSy4bnKB5NK4ePY+BDS4mnzQSNuK+I
         nU4wqfczdMzESpMX36vdYVbC2nEeAffIuoP/stTNqB4Yg2baCfp8vYUKmXuIdu5jy9kB
         tprKAKgWfSrlYKy+QNNJNOW4FrCj6C37KH8cpf8I8S3XlXt56bAiIGNubAPOEsYbG/li
         aU4w9Ia5lAw4v/snbvCUj8+O/YArJJ414FZyxhaOkQiJJlnjBXRAbXfPytOOptLM6Ehh
         X6dWDaXeQROR8YmLP11xE4fNaJHVSGW5kE2yvnDcu1weTQspow2MwhGylY2kfpuHMfvR
         XHJw==
X-Gm-Message-State: AOAM531Hi4CWltS1fodDzqkcoOUTHRRDrfLrYuRqQZGWghja2QE0eyH6
        GDpsIhi+ghkOiqtX5S6wY2LoSilVkCxCv6almCQNLg==
X-Google-Smtp-Source: ABdhPJzFT8gy0YTryuzIkqAwXuMAOd4TJntnOiSZt+GqRpVTvpk3Jc9rNKAQjUkIPCmI5srs5BWm4mxrQHc9KwFPhb4=
X-Received: by 2002:a81:5dd6:0:b0:2d6:3041:12e0 with SMTP id
 r205-20020a815dd6000000b002d6304112e0mr30293148ywb.331.1647956792172; Tue, 22
 Mar 2022 06:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220322121338.27428-1-liqiong@nfschina.com>
In-Reply-To: <20220322121338.27428-1-liqiong@nfschina.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 22 Mar 2022 21:44:36 +0800
Message-ID: <CAMZfGtVxFieFwEB5Xw0yKbri39og97u2RngRABTAUVXZSD_2Vw@mail.gmail.com>
Subject: Re: [External] [PATCH] mm: remove unnecessary (void*) conversions.
To:     liqiong <liqiong@nfschina.com>
Cc:     =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, yuzhe@nfschina.com,
        renyu@nfschina.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 22, 2022 at 8:14 PM liqiong <liqiong@nfschina.com> wrote:
>
> No need cast (void*) to (struct hwp_walk*).
>
> Signed-off-by: liqiong <liqiong@nfschina.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
