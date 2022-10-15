Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7673C4332F
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 Oct 2022 03:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiJOD46 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 23:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJOD45 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 23:56:57 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C717A773
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 20:56:55 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id x20so2603536ual.6
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1XtuVADnAOBONC1M17shsTaGM9X/1vdcEzHMBFOcvXk=;
        b=SICoSPjDMfDyxBWTvI7h9j4rOaw3W2JVixNlEFSxzdTf6iuhFXBogtg847ozW9ItTi
         iDSArywWSE3DkZw1FNys8hKdxU3sUjMxau4rTklao5ix4vsIiiONwe/8BXURq//KJx+D
         fNIo9KEwNEfqsa3Ef3Uu2pBfrzPRaF0qH7pp411E6JrQryl+ADOssJ0e+daZPOlgPxzc
         c6My6fhbMjtQYxj/9xPLCJ6w2rXqSN0/hV6APJtyCBtdRyiUdsrwmXysPLc2a05g0+Ta
         EkrhdH2ZpUkMlbylrfbwzXDWieqPKsHzGFeblUcz/gI9hdI6RLuvJzPwUAWxs+rigjT6
         gNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XtuVADnAOBONC1M17shsTaGM9X/1vdcEzHMBFOcvXk=;
        b=OIJ7+PiDO1vNirgG7j6te7EUX0mIQe3swiBWsNkNRFIXSG7iSgy5rVmsQJwvG1jWPR
         Jghe42I2RIlgCsMKwz/kHFv799f+cgPlwe/KFjENFdk/3Nj48f+XeU8uKuZDQvvpB/0+
         TUixfC1PZI3DEpQ2vDK1OYGQNulJnsxfSW8NAor33AmE11tKBuK1nj11TvxQcPUWlv1A
         kPHJqNRa3iYiGFayVGERNrcrmli5Dc8yZsmlGSFwwTuaDEePpbei8e+N/op3Pj9OnCq4
         xlS/os8taogu7F1E64QEISBf8NJiB4LiU81vp4iqD0ywQyySHtL3R0X6MAqOwFevVlan
         Tz5Q==
X-Gm-Message-State: ACrzQf184bA6RvSTg1QHHdsvkqWBaj3z3SbQKchgmIg3SitClu+ArGg6
        vpEhFG44Q/CS9quPiG1aRjCyNRnypA2WYYBewyQVXCvsC7o=
X-Google-Smtp-Source: AMsMyM473JkJYVq3qyMVSEZ/H2A3T4g6IsXoU0uUO2ER+bROjWbRK2mptRijTTlqIqKwYqfHd0rHvvyL8dMeIHpWimw=
X-Received: by 2002:ab0:7412:0:b0:3d1:c2f7:3250 with SMTP id
 r18-20020ab07412000000b003d1c2f73250mr351495uap.21.1665806214170; Fri, 14 Oct
 2022 20:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <Y0kt1aCTHO4r2CmL@kili>
In-Reply-To: <Y0kt1aCTHO4r2CmL@kili>
From:   David Gow <davidgow@google.com>
Date:   Sat, 15 Oct 2022 11:56:42 +0800
Message-ID: <CABVgOSkrZ+ZHP6M5t3JSMetdM=WWQwiS_2k1VZUHm9t42JagOA@mail.gmail.com>
Subject: Re: [PATCH] kunit: update NULL vs IS_ERR() tests
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 14, 2022 at 5:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The alloc_string_stream() functions were changed from returning NULL on
> error to returning error pointers so these caller needs to be updated
> as well.
>
> Fixes: 78b1c6584fce ("kunit: string-stream: Simplify resource use")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks for catching this!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  lib/kunit/string-stream.c | 4 ++--
>  lib/kunit/test.c          | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/kunit/string-stream.c b/lib/kunit/string-stream.c
> index f5ae79c37400..a608746020a9 100644
> --- a/lib/kunit/string-stream.c
> +++ b/lib/kunit/string-stream.c
> @@ -56,8 +56,8 @@ int string_stream_vadd(struct string_stream *stream,
>         frag_container = alloc_string_stream_fragment(stream->test,
>                                                       len,
>                                                       stream->gfp);
> -       if (!frag_container)
> -               return -ENOMEM;
> +       if (IS_ERR(frag_container))
> +               return PTR_ERR(frag_container);
>
>         len = vsnprintf(frag_container->fragment, len, fmt, args);
>         spin_lock(&stream->lock);
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 90640a43cf62..2a6992fe7c3e 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -265,7 +265,7 @@ static void kunit_fail(struct kunit *test, const struct kunit_loc *loc,
>         kunit_set_failure(test);
>
>         stream = alloc_string_stream(test, GFP_KERNEL);
> -       if (!stream) {
> +       if (IS_ERR(stream)) {
>                 WARN(true,
>                      "Could not allocate stream to print failed assertion in %s:%d\n",
>                      loc->file,
> --
> 2.35.1
>
