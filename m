Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D517C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Sep 2021 12:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A37A613A6
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Sep 2021 12:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343907AbhI2M4Q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Sep 2021 08:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343839AbhI2M4P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Sep 2021 08:56:15 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34BFC06161C
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Sep 2021 05:54:34 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id f73so1089172vkf.6
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Sep 2021 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zfQ5dM+Ri1P9r/ui3gb3SorhujmtF4JU4NTdcKikmrY=;
        b=Bsb7ycsZA74HsDPL09ZQAQzDgROsLRCu95Hc6OF0nBRCNlpFqOEl7hBm5n1R5n+GxS
         DY57YA9QCGz0DcHNnzyH8eenAa47pYdR9FLLRm9K7+sO4Y14fI7RCyHBToxJaDIhz0cc
         ozkSrY4d/0ZoSX99+wPd+DDkFDbf68V2vK3iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zfQ5dM+Ri1P9r/ui3gb3SorhujmtF4JU4NTdcKikmrY=;
        b=XHVDXz3wWct7L6SjRAcqoGcz6W7yoi34gllsTnCDfUAnaLcUe+wmlq2/NO+bntA753
         DoJbfz0nI0IpnB9nn9LvEnxnkr/xWbq6kohzbbdAFxKCXUY3HdpuLmlwAmxzljwjyS51
         rMDfj8gC8D2cRV719ec13F/p3rjfjkpZgbPm1dvCZ4kVIm6GcxclIAwsRK/G2ZoqkkY7
         W2Ho6/Obg4BfRaLqyEoxS0PHk2CUtXwtwujtJagWuY+n01nXuuq6dTDkm4wKGwLSUJSO
         zUMB+xOwHKrmXaFmepHt5vEc5LPLvufWhpvrC4WtiFuss9gLl+3V8t5cFOcC7uLBhRHm
         30Xw==
X-Gm-Message-State: AOAM5315B4QHI6O2SAurKTi3xrgIXLnhHlAdFRifOAUjAQwnGd3EONjJ
        4AbhGVta80rnNlAelMn0B+CUxkZmKVogjMmRPzXntw==
X-Google-Smtp-Source: ABdhPJzASCAh1IQGYf0Z3+LmFUl4XjYjTnybbVYyzQweEYSBjlUQemy10vtzR3hPvQY3k1Ypz3X3t1Ghxi70+l2QGFs=
X-Received: by 2002:a1f:f203:: with SMTP id q3mr8867332vkh.1.1632920073828;
 Wed, 29 Sep 2021 05:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210928123906.988813-1-colin.king@canonical.com>
 <CAFr9PXnMXPmuaUnfr-VwaZDX1hY8ZDtp1+UxOau6DKpUP9FdzQ@mail.gmail.com> <CABgxDoLPTcRbZZgAdJ9+=9OG+a=F59x9SQ9HvQkVvGmkDjO6-A@mail.gmail.com>
In-Reply-To: <CABgxDoLPTcRbZZgAdJ9+=9OG+a=F59x9SQ9HvQkVvGmkDjO6-A@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 29 Sep 2021 21:56:36 +0900
Message-ID: <CAFr9PXna7YsYnfdtu1jvJhkVSX0SiyixYr_bTsx3tDepeHqcMg@mail.gmail.com>
Subject: Re: [PATCH][next] rtc: msc313: Fix unintentional sign extension issue
 on left shift of a u16
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Colin King <colin.king@canonical.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Romain,

On Tue, 28 Sept 2021 at 22:55, Romain Perier <romain.perier@gmail.com> wrot=
e:
>
> Hi,
>
> Le mar. 28 sept. 2021 =C3=A0 15:31, Daniel Palmer <daniel@0x0f.com> a =C3=
=A9crit :
> The crazy stuff being, I ran rtctest from selftests and rtc-range (1)
> that tests a variety
> of dates including 2038 and 2106 for example. Both tests passed :) (proba=
bly
> because *this case* specifically did not happen while running the test)

I suspect it works because for reading the time because seconds is a
u32 not unsigned long like the other functions.
So if the high word of the register is read, is promoted to a wider
type and sign extended it doesn't actually matter because it gets
truncated to 32 bits so the sign extended part is gone.

Cheers,

Daniel
