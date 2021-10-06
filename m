Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595A5C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 16:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40A3561130
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 16:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbhJFQyo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Oct 2021 12:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhJFQyn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Oct 2021 12:54:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B951C061753
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Oct 2021 09:52:51 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso4397607pjb.4
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Oct 2021 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=tE2mxdh37dnyxx/6GEpmhKLL+VCgiyppriZBIEN9Yek=;
        b=ZgSYszkACVNYbPHRv6dT0Y71PsmUfzugPsUa5R+6KzBhBz4OXDPWevSFbzHG7TTBrx
         O8hidqI1gV5G8yuWIAwdZe1qu2PgHRfI/GiPxgzXg6Z4gfjM/WGjc3jAwGCC6kA44aQK
         dkLxOk42bZuJmnjwg84M/m6XZb+JBjBg/27Yd9aN8+PRmGfu0Fh+ahVMfZ4kEefzNU6J
         d/1PWGJRMFij2Mj/Rrz1oOf85Ryu0YoxOtWsbCpCDjOAjre797K799fPHa0WKplUU4VQ
         /r0VoP+HkKKJ705siLyeDGON4T9AB90BkuvBG/A6zp/SyPab3luVPsTV1kIEfQh7ptsm
         WY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=tE2mxdh37dnyxx/6GEpmhKLL+VCgiyppriZBIEN9Yek=;
        b=GUzQz7ozudcrOy1nAX3WEbjm2w8dgaFDB5VaJMU6czc6JEKV6RxaPmUt4LjMw74wE5
         FZyZdivwyKHYpEkRP4w+Y5L5wOVuu6wD4v+6x7vFpvyVmhYbiZgX4ODrVfO1mhq8blcs
         mqfW8kUhqFpp0SoX5tTjU7UhqDjwKZsQSH70oB/bBCx9awj4oX/mDJGhg+RsIJAbX0EO
         DSKtAxrjBkVZs5atLCJjVl3afUn40Edf1I0RBbD3ogB4LLfOszm9uuo1hn9yZOI8n5Zk
         f95ZuYd+eL+JySzbDv7PVui12sX6UboL79+Ulp4Dj91/51asiGaqdhx9y7Ik4RRskYxO
         2khw==
X-Gm-Message-State: AOAM532bfcBsjniCq0dSJdoR47XMl6yxfGVqvMwRF7/3+ppLwn6TCAbW
        cZLgONgW32uhffyKcVuAuoscfQ==
X-Google-Smtp-Source: ABdhPJwTBcQVmbKGkS9vwq4EiC9JTSG8DwDNpJPlsNCPI/DX2wwEwAFi6KDnd7CVB87LQIBKqStMNw==
X-Received: by 2002:a17:902:ea93:b0:13e:c727:3026 with SMTP id x19-20020a170902ea9300b0013ec7273026mr12001089plb.53.1633539170709;
        Wed, 06 Oct 2021 09:52:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id r130sm14086047pfc.89.2021.10.06.09.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 09:52:50 -0700 (PDT)
Date:   Wed, 06 Oct 2021 09:52:50 -0700 (PDT)
X-Google-Original-Date: Wed, 06 Oct 2021 09:52:48 PDT (-0700)
Subject:     Re: [PATCH] asm-generic: correct reference to GENERIC_LIB_DEVMEM_IS_ALLOWED
In-Reply-To: <CAK8P3a12-atmqjtjqi-RhFXH2Kwa-hxYcxy3Ftz2YjY5yyPHqg@mail.gmail.com>
CC:     lukas.bulwahn@gmail.com, Arnd Bergmann <arnd@arndb.de>,
        mcgrof@kernel.org, linux-arch@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmerdabbelt@google.com>
To:     Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-f5938c9b-7fc1-4b0c-9449-7dd1431f5446@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 06 Oct 2021 08:17:38 PDT (-0700), Arnd Bergmann wrote:
> On Wed, Oct 6, 2021 at 5:00 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>
>> Commit 527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")
>> introduces the config symbol GENERIC_LIB_DEVMEM_IS_ALLOWED, but then
>> falsely refers to CONFIG_GENERIC_DEVMEM_IS_ALLOWED (note the missing LIB
>> in the reference) in ./include/asm-generic/io.h.
>>
>> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>>
>> GENERIC_DEVMEM_IS_ALLOWED
>> Referencing files: include/asm-generic/io.h
>>
>> Correct the name of the config to the intended one.
>>
>> Fixes: 527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")
>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks.  I'm going to assume this is going in through some other tree, 
but IIUC I sent the buggy patch up so LMK if you're expecting it to go 
through mine.
