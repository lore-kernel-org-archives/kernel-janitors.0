Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEBECCA480
	for <kernel-janitors@archiver.kernel.org>; Wed, 20 Jul 2022 04:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbiGTEZY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 20 Jul 2022 00:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGTEZX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jul 2022 00:25:23 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29461640A
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 21:25:22 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31e1ecea074so84842907b3.8
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 21:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GkYDyFApRGQex0ZGx5gncItb501asypq46h3RmdML00=;
        b=yTP48Cdyx9REosxjEcxnAKh9vjZWIFjHLtjMQW9g2yz0yKG3wcI+qD+cb9j6cP0Bsr
         ce6X0cTDyZbG4qW8/pIyypZE4kBP83Vy5f+DRiAFzTm1Cnaqz/RMipGLpZzuucO1PEO2
         z0il+Sb7qg22G1CIENUx0WPzAzVXditgpoRx5Xsbl/PF6EYooKs+gRiKkgMBthjmoSu/
         Pc4Q0Ny4rfgBAvEGE7/UgRWo5bOkeNJLVOAMQifR3wiyEKpfw/6alVkFMc1NZpGOuZXL
         4tv52SpQU43zDC71Kn/KyOVlNPEiK5T6M5KIuPrI4wUThGDPOuzY/virnbom4iNNYp0y
         nQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GkYDyFApRGQex0ZGx5gncItb501asypq46h3RmdML00=;
        b=i2fFBETN2O1TJzTxwQH4NR5GUkP/oXlKKb16v6Q6cz1KwKdee2Vd9FMp3OJME7lsBa
         USV2rKD6r8JLuz5qvp5UwtLcC+Xa6yNf918KZll41S3HXDpdzc4oMPsjsoHjnnwKKFvE
         krN7JVuUrEk3ushkm8UzRTzMNP8qqlkba74oUkE56X/CouharZzGPnyAZgkwK8FtIQky
         Pi/rYtg68rnMsmMP/nrjTK8uedTsBoSkgvp5Mvpfq4x5esZUqVdSFO1aCrfQg+KU/O9N
         SNaUtDbmjB6lsmsWvGCG19QsU/SYDTlhUDMqCl+6IhAHcEjFelbAX90gEA+eP6dB1osk
         dEuw==
X-Gm-Message-State: AJIora/fa135W1Go0NpvJsQJbaklrIp4TNH+h6IvnnAiboRrfHbeGfcd
        ee8/R2R8Y96RYfaMcOIDGb9zxspyeUZ07Fz6qVpaRQ==
X-Google-Smtp-Source: AGRyM1vpMAAQFL4POhS1KPw0y4CE3dxVfTmOxVhuZGCS+Fa0qEToit9M5yEt2djrBoc5d38TThx4J5GqiDE12PI+XwE=
X-Received: by 2002:a81:89c6:0:b0:31e:43d1:5ba8 with SMTP id
 z189-20020a8189c6000000b0031e43d15ba8mr11554306ywf.31.1658291121416; Tue, 19
 Jul 2022 21:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <YtZzjvHXVXMXxpXO@kili>
In-Reply-To: <YtZzjvHXVXMXxpXO@kili>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 20 Jul 2022 12:24:44 +0800
Message-ID: <CAMZfGtWKXdxWMP7fxZnTEGHHxEXfZvDbBFFP7hE8sUZLP44H1A@mail.gmail.com>
Subject: Re: [PATCH] selftest/vm: uninitialized variable in main()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Mina Almasry <almasrymina@google.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 19, 2022 at 5:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Initialize "length" to zero by default.
>
> Fixes: ff712a627f72 ("selftests/vm: cleanup hugetlb file after mremap test")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
