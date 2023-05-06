Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638D0C77B75
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 May 2023 00:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjEFA6E (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 20:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjEFA6D (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 20:58:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4287B4EDC;
        Fri,  5 May 2023 17:58:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAA93641C4;
        Sat,  6 May 2023 00:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38324C4339B;
        Sat,  6 May 2023 00:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683334681;
        bh=wgggxoVbNtlVdcXO0Ax3pj4nhil23DvQ1A9wlVlVeQ4=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=lpLzTM8/JnMtWyQ9X4e0qXZgoErI42AtbzP27YDrsCupD0WnySjgS8JrtF/xxMPFb
         UWYx5lUvg+SsYvs8e+U0dgutu7lQdyxYUr6ZbOzqr7d39KQkOgLdZ1xlKPNzfWvJSI
         kwlTVNN56MlGRo3oYxlA4/AWgTRnKBWiItZXZOFr0NKbiACvTzzhGKbrmDS1Cyhfdg
         vKGw6Eo6o7LfDC1LVJfPFNOxxvQX7OyjRug/Y1xdFTK0ERq1+HYFaVbRq/Pxps/HAb
         VLE8PWjmrCUnnM2HimoY9IBfOg75B8QgF8C3wdavteFk8kUftu1B8427mJGSIWAmqD
         zIKPWvPquKXTg==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1928ec49077so2136459fac.0;
        Fri, 05 May 2023 17:58:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDzixcgD0wKPVnrIPe317VMhIUJNsdKw8I0VFwW7k6wWS6ELsThw
        YfWPKPcu8eR4wA9Uxylm8baErWQyYs0xdyzctX4=
X-Google-Smtp-Source: ACHHUZ7zsJxfjNhg/nJ43uSvbg6FNLpbTm6V3Ns4Npc9MAawrTvPErrJDgr1LyRZ60bFZ5Ap5M8YiLUIauICA8NtBxk=
X-Received: by 2002:a05:6870:4293:b0:18b:15cd:9b45 with SMTP id
 y19-20020a056870429300b0018b15cd9b45mr1693587oah.40.1683334680405; Fri, 05
 May 2023 17:58:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:981:0:b0:4d3:d9bf:b562 with HTTP; Fri, 5 May 2023
 17:57:59 -0700 (PDT)
In-Reply-To: <20230418153607.3125704-1-colin.i.king@gmail.com>
References: <20230418153607.3125704-1-colin.i.king@gmail.com>
From:   Namjae Jeon <linkinjeon@kernel.org>
Date:   Sat, 6 May 2023 09:57:59 +0900
X-Gmail-Original-Message-ID: <CAKYAXd93MfgCxX8it9OmrTBU7yS3phsu4nv++J=pRAKYzqGEYg@mail.gmail.com>
Message-ID: <CAKYAXd93MfgCxX8it9OmrTBU7yS3phsu4nv++J=pRAKYzqGEYg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: remove redundant initialization to pointer cb_sb_start
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Anton Altaparmakov <anton@tuxera.com>,
        linux-ntfs-dev@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

2023-04-19 0:36 GMT+09:00, Colin Ian King <colin.i.king@gmail.com>:
> The pointer cb_sb_start is being initialized with a value that is never
> read, it is being re-assigned the same value later on when it is first
> being used. The initialization is redundant and can be removed.
>
> Cleans up clang scan build warning:
> fs/ntfs/compress.c:164:6: warning: Value stored to 'cb_sb_start' during its
> initialization is never read [deadcode.DeadStores]
>         u8 *cb_sb_start = cb;   /* Beginning of the current sb in the cb.
> */
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
