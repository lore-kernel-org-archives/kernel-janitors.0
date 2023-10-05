Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F05E92FC9
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 22:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjJEWLR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 18:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjJEWLP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 18:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8982B9E
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 15:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696543826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6aHMrxnKFRL8eZP2ZR9DPlVMl+BHWqD42jAitaZoUq8=;
        b=SNtdPK/It9JomaLPWnOS74vKno1H2Y7eXuMFYIGgWkyhOH8h5oMlFfLIbDfm0oDlbHYWuj
        /No12JAOSlYgCa2bSQQP/kTTa8V9ExjGHp4Mf7rUK5HgYZwz5cz/QIROhFkaeHy3II+3oB
        3SOvBNle4OWEABKy+nCImOBhsh2jUIo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-eEqNKXEON-aNunkQnWkBnw-1; Thu, 05 Oct 2023 18:10:25 -0400
X-MC-Unique: eEqNKXEON-aNunkQnWkBnw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-538ed3724bcso1200349a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 15:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696543824; x=1697148624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aHMrxnKFRL8eZP2ZR9DPlVMl+BHWqD42jAitaZoUq8=;
        b=wmjQkEuHJQRXAgoByHzkizLvX/kEbVdGRYmoUqAQnvMSIvx4q9InFtlBYBsDi2TNR9
         FDQrInG5ai+6DYs391GAiZybJaR7UJCxxd2l5l0Mv4WpbR/M/mYNi7tdpU4baHhFeOPb
         3EoEDP1sfAGex5ZA1tmJIYv893a5vH6n1e3WMXdEOmsGYLcgBZBtFz9xE+eI4TIHmUY2
         TXUXgNcrZ+TxOID+AsG6HZXl60z49A6InxT37V4bGY6URvt3S0kAH1gXxa0rSalCbtIJ
         4QbVE0+TTR847EhLxSD1WD3u69Tij+dEtC8U+ZS4UFLtDd+fooIq7xXP3oHwEg9flB5s
         wQ5Q==
X-Gm-Message-State: AOJu0Yw5kqz4SpCQUVhR++MZ1ickAkNIgsLAgCQVgpyLv0pdJQx2krqY
        tZk13ICmSYSIh1o4ur8kNyaIKBRae/2q3Y69MDfzG2cqs2P1yWes7sCc/oz3+gshAIPDObjy1p8
        4sdT37573upmO8rbI/oAlgym4vVrsZzApHFKKJCmUmCIC
X-Received: by 2002:aa7:d615:0:b0:52b:db31:3c48 with SMTP id c21-20020aa7d615000000b0052bdb313c48mr5783985edr.0.1696543824467;
        Thu, 05 Oct 2023 15:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpNdCbvG6JhfAS3lwMZiyvboAoUGjRJHfOGjkHcza1InSbT5oi3sklaEIketz0hkFWheMaLuZomkliQzgw6to=
X-Received: by 2002:aa7:d615:0:b0:52b:db31:3c48 with SMTP id
 c21-20020aa7d615000000b0052bdb313c48mr5783968edr.0.1696543824238; Thu, 05 Oct
 2023 15:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <3c91e145-5cd5-4d9d-9590-3b74b811436a@moroto.mountain>
In-Reply-To: <3c91e145-5cd5-4d9d-9590-3b74b811436a@moroto.mountain>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Thu, 5 Oct 2023 18:10:13 -0400
Message-ID: <CAK-6q+iG=jX0qudCcszP64HxCwYSpmx7=Fh+Kf3qVft7Z8hBfg@mail.gmail.com>
Subject: Re: [PATCH net] 6lowpan: fix double free in lowpan_frag_rcv()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Alexander Aring <alex.aring@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Angus Chen <angus.chen@jaguarmicro.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Joel Granados <joel.granados@gmail.com>,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Wed, Oct 4, 2023 at 5:22=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> The skb() is freed by the caller in lowpan_invoke_rx_handlers() so this
> free is a double free.
>

lowpan_frag_rcv() does not call lowpan_invoke_rx_handlers(), it calls
lowpan_invoke_frag_rx_handlers(), or is there something I overlooked
here?

- Alex

