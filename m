Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC676C07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 11:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjJXLMN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 07:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjJXLML (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 07:12:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD73C128
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698145883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2H7Y3L+wO4O4PCAdKbwK4BPdzk6P9AjMRpwDaWWqLDQ=;
        b=akgns4zA5ob87Qyt6oy44mamjdlKwMz+YAgM4cxso2+uW0VOC3F4ESYlz9z0pgFWd2xgXR
        pKbk/7mKZ95T/lEU2pIObhJN08+AIk0droAyeHvsPYzihTXFzBKsRlHTJfzvLSfixjan7q
        8/ntxgi/rjEqCtmAKEMETraPPE0Y1pU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-llgEdxxXPpGFtlm7Vh8oYg-1; Tue, 24 Oct 2023 07:11:16 -0400
X-MC-Unique: llgEdxxXPpGFtlm7Vh8oYg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9c45a6a8832so44241666b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 04:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698145875; x=1698750675;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2H7Y3L+wO4O4PCAdKbwK4BPdzk6P9AjMRpwDaWWqLDQ=;
        b=Ha8eYyqz666ncTR3r5pZLzIb4cl/LTF6y2g5ohVifJCwJR+oweA7486E6qiL6LSwZ0
         M/f1wPPyH0RAsQPzahtiOCleIBKcxuKmS7Q+S6P/R3PsGyuUa9InywtGnE4BpCsMLhda
         SxbYMGMXIDB7BmNjYIm808DsXPh9aGaGpr89C10Esb/sS3gW19Jr85GcZ+Mbd25/VUjy
         cLcqdepe0gG93s02s5M5oCKfTig0zhwk/T9LGBDoLO9hL5MtWEyFrFba2S567mjHgFS3
         54So6XDb91hyDNYtPTpCyCUm71W1lkrW7vhRWumoKK/ncVMXNPpDcbpUStKCZba32P9A
         3b+Q==
X-Gm-Message-State: AOJu0YxETD3I8X6Ka8dkyw2UBavE3IJYN1ocrXPVpMeKMphpakzvVvg3
        nJ3nQ2cIXpgwxqfFh/4Kg7NWl2lqtw0BiG26WxJpzy4woffVFT5kfqc0qbrYDVgPtp2AOZjyJ2j
        nM8USawxFp3TlOQE7pvzNpAmer4El
X-Received: by 2002:a17:906:f50:b0:9cb:b737:e469 with SMTP id h16-20020a1709060f5000b009cbb737e469mr1904593ejj.4.1698145875545;
        Tue, 24 Oct 2023 04:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbm6fF0XWXv8tlBeoO6lS6nrzwyNW4FLJl6hKfbijCy2f0/nuEpU6IezwHCF7SzoFNY107dQ==
X-Received: by 2002:a17:906:f50:b0:9cb:b737:e469 with SMTP id h16-20020a1709060f5000b009cbb737e469mr1904578ejj.4.1698145875194;
        Tue, 24 Oct 2023 04:11:15 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-242-180.dyn.eolo.it. [146.241.242.180])
        by smtp.gmail.com with ESMTPSA id d13-20020a1709064c4d00b009a5f1d15642sm8026369ejw.158.2023.10.24.04.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 04:11:14 -0700 (PDT)
Message-ID: <f44e4fd716729f1f35ef58895b1acde53adb9b35.camel@redhat.com>
Subject: Re: [PATCH net 2/2] liquidio: Simplify octeon_download_firmware()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dchickles@marvell.com, sburla@marvell.com, fmanlunas@marvell.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        veerasenareddy.burru@cavium.com
Cc:     felix.manlunas@cavium.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Tue, 24 Oct 2023 13:11:13 +0200
In-Reply-To: <0278c7dfbc23f78a2d85060369132782f8466090.1698007858.git.christophe.jaillet@wanadoo.fr>
References: <cover.1698007858.git.christophe.jaillet@wanadoo.fr>
         <0278c7dfbc23f78a2d85060369132782f8466090.1698007858.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 2023-10-22 at 22:59 +0200, Christophe JAILLET wrote:
> In order to remove the usage of strncat(), write directly at the rigth
> place in the 'h->bootcmd' array and check if the output is truncated.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The goal is to potentially remove the strncat() function from the kernel.
> Their are only few users and most of them use it wrongly.
>=20
> This patch is compile tested only.

Then just switch to strlcat, would be less invasive.

Thanks,

Paolo

