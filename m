Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FC4C4320E
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 16:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32DEE6109E
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 16:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240098AbhHaQmG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 12:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbhHaQmG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 12:42:06 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF65C061575
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 09:41:11 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id q21so10989071plq.3
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ofROlvTu1E1hVbZ28WkGRDdjDewSdNfrPBGyLPdKxw=;
        b=eWcbSYm9Ou+SKpzFZH64hU1XB9AQL4hX8f/ozcFkxsFMVmKOVq6EYNCwo3pGkSFeau
         zJvkw5DumscbfX9AbV+Tk2Hvkczt6b+g0Q0SsXCmxg1bZYvJFvQFYEH6EdizEK4Qw6cH
         cWo/lMTvnKMK/wGicv28u4BiwaycKQ6qjFV7T8toBj/eN1VEqaU6kUlIM8rMuhXdmf19
         3ZV1t+2IsqixTsud2p62M9eHiMLU1FV0ozR12unNrQgfEBDItTm+/94DfSA16HElK31L
         hTmK37Llo0y0IpoUtZYk4a0MToXB2sjhRrX0PfcwDrIKCEvYis+/iwzsJH1doZgZU6Db
         1Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ofROlvTu1E1hVbZ28WkGRDdjDewSdNfrPBGyLPdKxw=;
        b=f+pXGBV7I3jU/4+AFNIRtfYuWa2cSvvMyCIvjDS0S9wU/hNXsS6KujtDAfiuJlrn1N
         rXvYBXVE4A68jWD0VwX0agmQzXbeRf9KMVQqdvqRPOTdGBG4CaWBz7i0iFQERhhDot7K
         BXAWdrvXpIPiEc5An7YTOge9iXZ+V0Uv3R8Qxozj3/i0TTG0DNjf7ScpeOP7h9gINI/Z
         b8z3jzHjkKhFNmv1WdvVzMGpGHMk/V4gbZwHCO9rLNjE7H2ajYAcL3q/fpK5ly3xObK3
         yRENJoeacKYITYrFrTH4NqbH3cGX2S/diAJMQTdw9wx2BnTHHeMpl/IgzkZvk04CwIut
         TUfA==
X-Gm-Message-State: AOAM532g3i4vMEryjjMsDUmbscBZnBdPAfl15zXgccxyKxT5KBKbUa3e
        caLc+BBGUzTgjc4lW6rpylQKtYHFpnj98gOy6bMvoA==
X-Google-Smtp-Source: ABdhPJzUUsuFUyfYvCeCod2PWQHXawkudz0iKl+h2TTtZf4NEpXj88CuWJS1uiygyv78DjhoEMXXQ++n0FX+toPhwr4=
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id
 w2-20020a170902a702b029012baa0fd553mr5470508plq.3.1630428070408; Tue, 31 Aug
 2021 09:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210831151125.2401-1-roger@norberthealth.com> <3f26402b-00fd-1da3-0717-e2a6fc254060@infradead.org>
In-Reply-To: <3f26402b-00fd-1da3-0717-e2a6fc254060@infradead.org>
From:   Roger Knecht <roger@norberthealth.com>
Date:   Tue, 31 Aug 2021 18:40:59 +0200
Message-ID: <CAO_iFwoqbajgiKwQeNjTDWYPAjcnQWJFZM7EQLHadumtbJuBQQ@mail.gmail.com>
Subject: Re: [PATCH v4] Trivial comment fix for the CRC ITU-T polynom
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Will do, thanks Randy!

Roger
