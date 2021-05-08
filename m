Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1036EC433B4
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 14:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D58BC61151
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 14:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhEHOv6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 8 May 2021 10:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhEHOv5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 May 2021 10:51:57 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0F1C061574
        for <kernel-janitors@vger.kernel.org>; Sat,  8 May 2021 07:50:56 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id l19so10218858ilk.13
        for <kernel-janitors@vger.kernel.org>; Sat, 08 May 2021 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=48xE9fIvxonczl2BWIw+35vmcfz0J/Cm+rQ+/nbpn+Y=;
        b=KiyIjVoCRrDpqrnpH3jKCMwL4abdxq5EizRZB5DUdSfIPkJpehFVaQhvpOok3/b1HQ
         CkVVutlWm+pzpIvFcvZrqIf4F/dkQV2Qjk4aHHCL7S6Qe6BATgqhfZmrYrpLbk0Zh7B0
         baztSTaK2GpqtkHMpRQX4liDWBx4KiQeLrcYxH0/NkZnLVGunN/I8h013h1sTjfZ1/o4
         pTd12n1eSvPb8HYRDQP3ntxr6GEnGyJjT8CsZh0AnjhJKv/ZRVxSWNId2HpLYev6msdP
         UDxEIKB8/FwFvM5Z/GXsri7kZSMxMkmUjlai5hO1D5kXYtoAqH/6G/nollQHMaI+O9tm
         EKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48xE9fIvxonczl2BWIw+35vmcfz0J/Cm+rQ+/nbpn+Y=;
        b=kfmhyeZalQ/0VZInaq6Ua5DlQzOvbrTrcJdI4lWMHoCapIaQL7Dtf88vio7kEmkJnC
         rsRaqO1vvr4jwo2T618imPcEBt0DhzqBj88LYaGtPLdp4CL5/wA+YotdbE8lSoY9R8Zr
         YyE4AN9+4as7+odnJR9onsZvv5k+zfVquOG+j9IKEcGlKCv2+EykVgvSv3NYETAHshk7
         zKtXxjy8ZwS+3lq9h100d+Q7G2zLAKUq8i5mUsZdFUQB0UvjAlCmsobIlHkRWVPiShbw
         Ffd+TYZv3bijcXWTlxYhChx8D1ILxJdYk/2UK5YbBHDBCE6zMiOYFmUlrYyHNTlGN8dD
         hEHA==
X-Gm-Message-State: AOAM530m0Zt9zIMjSPcSgOqNo5zbVSEUT/8X5RiLykTHVd/JtuploPRo
        WcM9zNhaUpBTYaOifGSt2VyXo7D/oYfTuTRb2xI=
X-Google-Smtp-Source: ABdhPJzqgxob7oQYp4f94oqsRLQEsvVlftSeO7PRFyd1CEn5LF+ioaafUeUHe28iR/RvxhoaZOROwsKpTjpImP9JuMI=
X-Received: by 2002:a05:6e02:8f2:: with SMTP id n18mr13390030ilt.299.1620485455681;
 Sat, 08 May 2021 07:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <63bf4e87eb42fa3fff2cd87eb605ebcc01f4b2f7.1620458525.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <63bf4e87eb42fa3fff2cd87eb605ebcc01f4b2f7.1620458525.git.christophe.jaillet@wanadoo.fr>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 8 May 2021 08:50:44 -0600
Message-ID: <CAOc6etbPaPOjdcfYBY1i_N0V6Tua9p-OL5Hw7PgJ6T7dfRrhfA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: scan: Fix a memory leak in an error handling path
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 8, 2021 at 1:23 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'acpi_device_set_name()' fails, we must free
> 'acpi_device_bus_id->bus_id' or there is a (potential) memory leak.

This is a question about the style used in kernel. This function
(acpi_device_add) initializes acpi_device_bus_id and it could also
initialize acpi_device_bus_id->bus_id and any of those might fail. And
they will have to be freed if they are initialized and so on. I see
that there are kfrees used for them in different places before using a
goto err_unlock; I wonder if it is accepted practice to avoid doing
these kfrees and have them in a single place instead, something like:

err_onlock:
    if (acpi_device_bus_id) {
        if (acpi_device_bus_id->bus_id)
            kfree(acpi_device_bus_id->bus_id);
        kfree(acpi_device_bus_id);
    }
    mutex_unlock(&acpi_device_lock);
.
.
.

Thanks in advance.
