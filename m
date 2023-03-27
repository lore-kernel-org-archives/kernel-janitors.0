Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6180EC761A6
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Mar 2023 21:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjC0VXx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Mar 2023 17:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjC0VXw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Mar 2023 17:23:52 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F604199C
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Mar 2023 14:23:51 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id k17so12516212ybm.11
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Mar 2023 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679952230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRwaPJdNjZmcm9hJp392EALqZkQqEkTeWD1wr6f42IY=;
        b=CidMqviG1CVTU+wx0EfQQ3sUH/cjf8Dd7nelb7WgvTyS6PqzNdvqV0M4Lm9uwfolJl
         +N1NLYxxIW+6N5TAJcMdNbcdhoPmRw1zEnmm7YM1OgvWMk33fzRPH7MFC9VOPwNvHUXy
         4W6EEECa+7UfqFcaGPJ2NA1nx3gisuP3enofJkkdsGQaD4EcA54jU1DJ4F3xiFFxfd5p
         ka6p3MaULmB0KeXkS/Gm7r+MAMKWbdKo5e2/Nn3Qi/NvAF/s1bnPjT8mCOs2V2EW48vp
         4w+C9MjHfaf7F7I2OuSqnUPXZoJtMKoUWeDzkpZ07gWG0TX+zljVFlobcUM6O/1TMcko
         9AHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRwaPJdNjZmcm9hJp392EALqZkQqEkTeWD1wr6f42IY=;
        b=fJGhbNrWVabuxKLk53y3hFLVAmWjUwvHs+EIVJpj46dEXieSNslKtWlU+lSmftvYl2
         6viL0EVxVAKX83jR8vE3/+RSN86Mpt/zAIsNgzJNtifpPT2uGgRceygsCSGmxm7ISW+q
         PfOfQ3I9Ktys1rHeRDMfL0liPhCgJ8efDYSgtQ2GCl8kNE1xwr33VF33rU9PlPdO4kYY
         tZah0V5OIQ+p0bDmLNv8iQZmIqExrFg0Kswa+ULdQwfA5uDxeaCa0ZLTLaDJyDf+JXr9
         Lg+o1JH2jty6WymjjUpdyeEY5bqseqixonvUbl4GCYJTZ+b0ViNSX+UY6bIKkUP8+RwB
         Acpw==
X-Gm-Message-State: AAQBX9chBtygxj1pOpMqf2loQIMoiDzdINtg/yIgCFfL86CiyRCXqXKg
        ce0udS4grQEg8gFwncfs27cYGfIKGhElU5zgv0idQA==
X-Google-Smtp-Source: AKy350aF5/L77S0EjVYQ52vhV3o7136405E00a7IO8owxz67hLYfSywE1LAZVDUR/2jjWTCviakaCuqAVj2MZkaWw5I=
X-Received: by 2002:a05:6902:10c2:b0:b6e:b924:b96f with SMTP id
 w2-20020a05690210c200b00b6eb924b96fmr10825453ybu.3.1679952230621; Mon, 27 Mar
 2023 14:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
In-Reply-To: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:23:39 +0200
Message-ID: <CACRpkdY9+HbODoJYku1EN7Swr9C+NbeS-GLNb=CtNkdQHQ2EQg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: magnachip: Prevent error pointer dereference
 in probe
To:     Dan Carpenter <error27@gmail.com>
Cc:     Chris Morgan <macromorgan@hotmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Mar 22, 2023 at 10:07=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:

> Don't dereference "db->dsi_dev" when it is an error pointer.
>
> Fixes: 249a4f5e663c ("drm/panel: Add Magnachip D53E6EA8966 Panel Driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Patch applied to drm-misc-next!

Yours,
Linus Walleij
