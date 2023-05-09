Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B748BC7EE22
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 May 2023 08:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbjEIIvV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 May 2023 04:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEIIvT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 May 2023 04:51:19 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D5010D4
        for <kernel-janitors@vger.kernel.org>; Tue,  9 May 2023 01:51:18 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-3f38a9918d1so82991cf.1
        for <kernel-janitors@vger.kernel.org>; Tue, 09 May 2023 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683622277; x=1686214277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IraX+oUBLwvjqiInA0j8uPl6x32yOtC/TKYx6LHl7NM=;
        b=BLgnfB+PuGcbYmgEOPPmpjUx2YJHLULGn7h+bbr4+wdFwvgdYKdJkIZnX/xWFvmk4+
         acrXlWH6YS3jtuWkMhYWrOpI+JTot/uZ8ywxUXtxGnfzvMYlscQzw3ZjN5yxpMdOHpJF
         4t1Q/s6kedVAlxQPil8ZnhgWDWB6z1k0HuFpisZLHj+7c2u17bkb64u6UOimgJ5lqpd4
         9KCJrtHdxVY6ggT2DVru491nXjhjH2+zvUuKCN+3ezyImS/FPrnDqqg0NkNcbCISFIJw
         Iu1frp3INjfXlgCX1stSwSActYiO4ZiPmx6m1NrglJKAdNm3YYUpAzQ0MxXft4fviDcZ
         vXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622277; x=1686214277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IraX+oUBLwvjqiInA0j8uPl6x32yOtC/TKYx6LHl7NM=;
        b=GiPO6qZigRki6VCrWzVBiaN+664MAfDkAXDhO9MPtsvoBy6rV69UKqgMER4YIKlJPz
         mGoudIr2Yd3oH+0MK63wUBNiB48CwrMoffNCrNcwbvFtZoSX8glX718D1oi2f0vj4h+V
         HTlh0FGdZhGWBKIuznuukrO44FP+A7HMGD9OWfJyJJUBboDokrO3IHmF1rJi4cokI2SY
         iS8mGb+K94oqhME3/8PN2wTZ3uOPqUsxK2lV3c+NkrO7pU14NPjV6c7Lyb9kQX3LET09
         3NONx6wlK69chNE7PgVhlxsMEqfcvUk96DEt4/kciTDIVIHHM5IWGN5qpjiHb4CXC1Py
         +bPg==
X-Gm-Message-State: AC+VfDyyJebuSARublRTdOZeVlqSjdbu7VM9Xe2nXOK9rv2+xl/hvj4u
        Vz9Il03uqMWhvbZmmq2rnFaZryLV+YPeTt3d1n23nA==
X-Google-Smtp-Source: ACHHUZ7YU4f2zXcAlzkXjAsKg134MNWnY7UvWFVpebS39DMB6pR42HByDVKqHv4THJgichhxGBfyoI1EdjHW6lRd3Yo=
X-Received: by 2002:a05:622a:130e:b0:3ed:86f6:6eab with SMTP id
 v14-20020a05622a130e00b003ed86f66eabmr338833qtk.14.1683622277300; Tue, 09 May
 2023 01:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230509071207.28942-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230509071207.28942-1-lukas.bulwahn@gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 9 May 2023 10:51:06 +0200
Message-ID: <CANn89iKEqUFMNKb6axZpkLEJbhZB285-Vpiq_ybBB6LO9ny4SQ@mail.gmail.com>
Subject: Re: [PATCH] net: skbuff: remove special handling for SLOB
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Vlastimil Babka <vbabka@suse.cz>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 9, 2023 at 9:12=E2=80=AFAM Lukas Bulwahn <lukas.bulwahn@gmail.c=
om> wrote:
>
> Commit c9929f0e344a ("mm/slob: remove CONFIG_SLOB") removes CONFIG_SLOB.
> Now, we can also remove special handling for socket buffers with the SLOB
> allocator. The code with HAVE_SKB_SMALL_HEAD_CACHE=3D1 is now the default
> behavior for all allocators.
>
> Remove an unnecessary distinction between SLOB and SLAB/SLUB allocator
> after the SLOB allocator is gone.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
