Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90553C4320A
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 12:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CD396103D
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 12:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhHaMq5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 08:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbhHaMq5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 08:46:57 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E44EC06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 05:46:02 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id d3-20020a17090ae28300b0019629c96f25so2313545pjz.2
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+EFI6GnSelcnpgoeb+deAAklW3NRFaUm26pY4E+w0k=;
        b=ioSemb3JD5Y1eOx3s8QHMULwaxNxq90XekgXbUYN3MIi4wPew/JByeaeSULeT4nbEa
         cKzIZ4/H6afFFvkg5Qwx3+83wPYHyGoSruTzZfnNZE0FeHolHwnaOEg2GmzOv1uRu5Zc
         veTsu8tUiQaMChhjarmaZ79IoIj9BKQmJN9YxQpsfR87xdgfmE2Mdr4BP/SfuBq3QZO5
         CFNQEtJI6Hb80splvXF/qFEsjirZ8eAbKuCALFyGg3Gktbehfx02UaG6vAg19br4r1Vj
         dUTIgoZG1HoHuB6CFQRkhLi5jMqsLLj76GXn4TgVbRl7x/vgSTM0uCggygyXE89Lvi0J
         xRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+EFI6GnSelcnpgoeb+deAAklW3NRFaUm26pY4E+w0k=;
        b=fWSvDlFpsM656ivGIVU038vr+wooi/z6stLVqLr5NaBgme/qaRqlWk0hnplxm4ZBtB
         cYm67aN6THFliahsd/anizcPSCQOXhII+Zq0Crper6UgJM/CLsBtv3z5eIGCZ5bW6PSs
         F8e9F5J8vn90YYxasuTacNZdRJ/KtCaSzJycENHzPxxGVUJxL3UWLV4VsRapMLNG9ef9
         NcqytGuoo98nEuPfxoeGBYLgiZVWZ8l3vsOpU9Sn4h/D2eQzpV2vMuoY+VFPmYorwbSN
         dC+qMmOw5RKGozggjd5mD9uj9dmvIZ4vIkoRg1HNwiLUbf+3rb3XsMShWfvBr3bYtnVV
         aTYA==
X-Gm-Message-State: AOAM532ZuC1h3DfmDyyPXRNW2a+EcBc3gNLZ6aJmKpnKTGZxnVeW39ej
        xasbuyW+XALxsbCKZ6J/hoC2/QU3N8tMLSq61iK+tw==
X-Google-Smtp-Source: ABdhPJzp0DSkkGaQ+vQsAfxzLKLGMRlAgWHiJnqZvPuKn9KmYDA8wE3e08OvWWQvIXbffne6YSWjWMRfm0H3l1lj0SQ=
X-Received: by 2002:a17:90a:6ac2:: with SMTP id b2mr5341365pjm.36.1630413961661;
 Tue, 31 Aug 2021 05:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210830163324.12537-1-roger@norberthealth.com> <20210830185714.GK12231@kadam>
In-Reply-To: <20210830185714.GK12231@kadam>
From:   Roger Knecht <roger@norberthealth.com>
Date:   Tue, 31 Aug 2021 14:45:50 +0200
Message-ID: <CAO_iFwp7s4ZAAiyektJgi1bWV5arTmtqGJuNqgkyOrYoZTUDUw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] Trivial comment fix for the CRC ITU-T polynom
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <jkosina@suse.cz>, Jiri Kosina <trivial@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for pointing this out. I will fix and resend it shortly.

Regards,
Roger
