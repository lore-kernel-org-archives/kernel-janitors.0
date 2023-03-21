Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61456C7618D
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Mar 2023 08:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCUIey (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Mar 2023 04:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbjCUIeZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Mar 2023 04:34:25 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129361FE7
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Mar 2023 01:33:32 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5445009c26bso267683387b3.8
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Mar 2023 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1679387611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KB6vuc81jSSkKnMxrZTvHvPKSRtY1MligJPcYjgonTw=;
        b=L854542Of25QQ3JVGYZn6a0AB9OOdy/B3vOuhkEK5OAKN4+xODvce3FBD1g8PSV1nD
         PqyMVQ8WlCcy63cRosAHpzwvRh3bckIgDVOVhlRww5TSKtt4WgapFm5Y9wgl41WSVTAd
         620aYogY8pRdmc8ttv103/JZ3il6bJWNu6kWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679387611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KB6vuc81jSSkKnMxrZTvHvPKSRtY1MligJPcYjgonTw=;
        b=jszGq52If6iJFL8NCcNjDzS/VAcQed7SH4HztJ0NXbwNAm2XE5KMSFIOvY3gvyWkc0
         bQAg130BYxY/IiOUUAotk2qVcQfZE266mV6QuOEtGFzimFWr1cMV1L825Z0IDM6/VtD4
         H67wZLqByFkZEAYMtZK11Sg6IEfNHoNSfKkce35k+4GW75syYSKy0gPWCqEXbV3Y7SLC
         CvDzhTr6c5mfphfUoJlxDtaA2I5oXl2k7OO1Nw8QqtOycoyKO0wTzqgGmRoY1zxHWzhw
         CXndwI3p6e9BtYUBAcCHSRK758WdOC7H3yBjl3xaxYFKVEaxFcLIg8XUtUIYAaDmMWqY
         ICaA==
X-Gm-Message-State: AAQBX9eQwWHPWU3sA+JOdwA8lb/fK1PKSoOf79V8Vrbt0FebsLhbh/we
        WveHSio+2RzPZfVtghaxrAQfK9iCVdBg9qMQ/yIGzy91JtATEK6L
X-Google-Smtp-Source: AKy350ayh3kL/5wMU+1FJfsQfBzUOLJnlM6KS2hGz9x37v9qA1HJCUgNxeaBqW+vqDU/KvLwNjxHef4Xv3FGx8lBXeY=
X-Received: by 2002:a81:af50:0:b0:541:85d2:af21 with SMTP id
 x16-20020a81af50000000b0054185d2af21mr582975ywj.5.1679387609813; Tue, 21 Mar
 2023 01:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
From:   Daniel Palmer <daniel@thingy.jp>
Date:   Tue, 21 Mar 2023 17:33:19 +0900
Message-ID: <CAFr9PXmKsequA3V7QWC2fKQYZgaNRj+q3q=UOBLmg6wxYKiVYg@mail.gmail.com>
Subject: Re: [PATCH] ARM: mstar: remove unused config MACH_MERCURY
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Romain Perier <romain.perier@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Lukas

On Tue, 21 Mar 2023 at 12:38, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7
> SoCs") adds the config MACH_INFINITY and MACH_MERCURY. The MACH_INFINITY
> config is used in the gpio-msc313 driver, but the MACH_MERCURY config is
> never used to configure anything in the kernel tree.
>
> Remove the unused config MACH_MERCURY.

Because work is still on going to push that stuff.

nak from me.

Thanks,

Daniel
