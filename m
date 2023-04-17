Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93242C77B7A
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Apr 2023 16:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjDQQ0P (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Apr 2023 12:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjDQQ0L (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Apr 2023 12:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E734E53
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681748728;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xTTtRzBVTjjwCLzyfJV4ohTaunXWOeVeAb2RjGQ5vZ8=;
        b=JPovfLpN6rsP36yHVJEseLbPND/Rb4f60TGA+sbCElNCvXgczjhmY3Au4GUZ9gKYD6V0iC
        /mfJ6JhfS8RXbc1nGtdOHsi3ZlWdOeskBVI5crmfzZ22/xk+p/eTXEB5QK9LqliWnpXN2E
        M9gB6sspjvxzIOQVT7rDMt88oXtrkLY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-CQvSvsKjOyyKVQ5F_juVzA-1; Mon, 17 Apr 2023 12:25:27 -0400
X-MC-Unique: CQvSvsKjOyyKVQ5F_juVzA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4edb884cdc2so581694e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 09:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681748725; x=1684340725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTTtRzBVTjjwCLzyfJV4ohTaunXWOeVeAb2RjGQ5vZ8=;
        b=DnIwxe503RhUk2g8CGWQ7DrBKt2ynqnNK8qP6lGF4i3IsGrXjONblKH/tM5x4hW4Le
         4u9d6OcN709cQ2Td7QtxN/S+qf5wUVhwwNuNr+fAZtdNO4VO54s7lvZbbXlBhPi23t/9
         qQsA6yFNkC1PUhemLUH3mYZvIvnhGE+Qp22DWngl1Vq3PWLr3QUN6ZP9HLRSLDJ8sS3q
         HKlwgBcTyAKhi1WmS3vJh6hxFBANjNKZwOG0IzfytWKJWwP8AnhOVdhKPrhZz0GRnt4D
         v04J+2Hg6TdZMyr9AtGnFaeyer9bX66oq7Wm6ZGLPn+H8h99/bZ9eBm3AIdj/b8MUdgU
         iC0Q==
X-Gm-Message-State: AAQBX9fqjQyv6hp0Cm5oU2Z8X7twHjc1XTj0absvP+e74poYwzwrVx8j
        eBGUs/dAI+7mRIQ20qozOw5L+aozWiaeF5w/3p60d4p3dFehDPf/Ol2cvnZpcHNfmnNTgetDi4V
        w1AKt7MYsfWTFOTso6I4jJg2naicKKq6WU1rOaDK7NCG0
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id z10-20020ac25dea000000b004ece32f3d1fmr2308544lfq.11.1681748725394;
        Mon, 17 Apr 2023 09:25:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+bsYZfdQ0YbXRNUdAiXrEC617Co8M6Ae9OYtGyQ7Z0JTehg+Oxteoxe+dPaIDFHLfU5sWj8/W0mxSAgomtgA=
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id
 z10-20020ac25dea000000b004ece32f3d1fmr2308529lfq.11.1681748725093; Mon, 17
 Apr 2023 09:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Mon, 17 Apr 2023 18:25:13 +0200
Message-ID: <CACO55ttSoyhgjqMdtiEfhMP1YKFFTZJRXEv17F-WRWPzLF2Uvw@mail.gmail.com>
Subject: Re: [PATCH 0/9] GPU-DRM-nouveau: Adjustments for seven function implementations
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Lyude Paul <lyude@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Apr 16, 2023 at 11:30=E2=80=AFAM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> Date: Sun, 16 Apr 2023 11:22:23 +0200
>
> Several update suggestions were taken into account
> from static source code analysis.
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Markus Elfring (9):
>   debugfs: Move an expression into a function call parameter
>     in nouveau_debugfs_pstate_set()
>   debugfs: Move a variable assignment behind a null pointer check
>     in nouveau_debugfs_pstate_get()
>   debugfs: Use seq_putc()
>     in nouveau_debugfs_pstate_get()
>   debugfs: Replace five seq_printf() calls by seq_puts()
>     in nouveau_debugfs_pstate_get()
>   power_budget: Move an expression into a macro call parameter
>     in nvbios_power_budget_header()
>   clk: Move a variable assignment behind a null pointer check
>     in nvkm_pstate_new()
>   pci: Move a variable assignment behind condition checks
>     in nvkm_pcie_set_link()
>   pci: Move an expression into a function call parameter
>     in nvkm_pcie_set_link()
>   therm: Move an assignment statement behind a null pointer check
>     in two functions
>
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 19 ++++++++++---------
>  .../nouveau/nvkm/subdev/bios/power_budget.c   |  3 +--
>  .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/pci/pcie.c    |  7 +++----
>  .../drm/nouveau/nvkm/subdev/therm/fanpwm.c    |  2 +-
>  .../drm/nouveau/nvkm/subdev/therm/fantog.c    |  2 +-
>  6 files changed, 17 insertions(+), 18 deletions(-)
>
> --
> 2.40.0
>

