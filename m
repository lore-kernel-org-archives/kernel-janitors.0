Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8256C0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 12:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbjJYMg4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 08:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbjJYMgy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 08:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73F3181
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698237371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vvU+ODlhbBzCksS16LHKl+sMj+DM+WDalvoXiTfFa+g=;
        b=b8trevSlKIZ6lK1h/jAu/UB9j050idfopVhEeFl6i0tvpPbVZpvFfEk5NWiRxDowpbamVe
        c3wEcEPvzkwHxjlKSc2r+bq+XWk4cxw17Kv5x3pHEghVkMliQyckVHSXZNL7xAbAheipjk
        dD/LmtFzFINFt16UiA4qjanqXe9rcIg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-iRyEz_zUPSWOcQI8iIUeKQ-1; Wed, 25 Oct 2023 08:35:58 -0400
X-MC-Unique: iRyEz_zUPSWOcQI8iIUeKQ-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1c9fc94b182so58885455ad.1
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 05:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698237358; x=1698842158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvU+ODlhbBzCksS16LHKl+sMj+DM+WDalvoXiTfFa+g=;
        b=wDoIGfpkE7104KFv/UeuPhtcMkW+EprMBEzPmLdrdhJtDdCrilfcNcfXp0mV121J9y
         pn6Q77SAGrV89ZJxY/7Ad8M9mn94hMp/qpmD/BkUfmgW233xg94xyw9+uqjR72PMDoFN
         ygIzLyHkJbdBdmPOi/09WR4v0ulY46cjQ5zWnHR93J3VyTUnZLeMjMINNc7MU1AKgRyC
         TVO8/uLYG2R40pZMggT1h8f160OCpOk2V4Ln9fq2JTUEnPa325iyXt+vqmd+B363FFGv
         FKAQXWfHE8Q77LneD1/N8jn25Av0FGoY+vIb9Quc2Ot5e4MLl/m+Jom7bNyqFliyPJ9A
         euSg==
X-Gm-Message-State: AOJu0Yyf1eTdhxCDHLvZaPvuF84BEQRBCRPiRhLL/7n0DinIuAMJaKzq
        pm+QURozKoE/tAEdTAZamMPeuElgcQhOCYLAiBBWS2hY5WtrD/w+tlxt34m7/w5wxwW0M5he4IF
        tPTlONofgGmTaQfPoJc3/DFyD7aTAvYHLtItFBOhcEXJ0
X-Received: by 2002:a17:902:e841:b0:1b6:6f12:502e with SMTP id t1-20020a170902e84100b001b66f12502emr17465925plg.49.1698237357792;
        Wed, 25 Oct 2023 05:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/lVpfMUNBBfWqBo8bfvljBYSBCHKzm8BaAaoys67eChIuLm8w5Asc6ul+K1gzocSNYltZL1dL0BrIqtcbXRQ=
X-Received: by 2002:a17:902:e841:b0:1b6:6f12:502e with SMTP id
 t1-20020a170902e84100b001b66f12502emr17465908plg.49.1698237357450; Wed, 25
 Oct 2023 05:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <0b9cb1ea-4656-4802-b7a7-811c1e9e118a@moroto.mountain>
In-Reply-To: <0b9cb1ea-4656-4802-b7a7-811c1e9e118a@moroto.mountain>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Wed, 25 Oct 2023 14:35:45 +0200
Message-ID: <CAHc6FU646Jj3iODoHoAYpps2PL732Feb_w+5p=8GfUOMfYTHhw@mail.gmail.com>
Subject: Re: [PATCH] gfs2: uninitialized variable in __gfs2_iomap_get()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Bob Peterson <rpeterso@redhat.com>, gfs2@lists.linux.dev,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan,

On Wed, Oct 25, 2023 at 1:57=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> The "ret" variable is uninitialized when we goto out because
> gfs2_is_stuffed(ip).
>
> Fixes: 2cd225820b91 ("gfs2: Initialize metapaths outside of __gfs2_iomap_=
get")

thanks for catching this. I've fixed that patch directly.

Andreas

