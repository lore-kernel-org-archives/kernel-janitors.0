Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8994C6FD1D
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Mar 2023 11:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjCULW3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Mar 2023 07:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCULWW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Mar 2023 07:22:22 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCC430289
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Mar 2023 04:21:53 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id j7so16590398ybg.4
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Mar 2023 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1679397711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+KqRWhaDx1aJoI/pna5di6cHpQDQbH5Dv0l0ZgDy3g=;
        b=KVoWmCl3lAefXbSjr1XFa+Pxr15fcLxSACIYq0vUNsPKheJwN9PLuMYI4g/xhAjlJR
         v5jPl4mNRlohMGFK3j609Jd1v1JyoCHAGE8WkQQir9p+3GVucIAu8ajbJPbJJzf9oW5i
         f3VlU0/OrWyyNLnaKLuJr/QQ4ZmnEnZCIWWmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679397711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+KqRWhaDx1aJoI/pna5di6cHpQDQbH5Dv0l0ZgDy3g=;
        b=jJFxKffwfDtN7iEzddSzOEfZcVGWZ14KyXFirO9GR63MZcoTDbLBLiAAJkujhVVNzy
         4Yr3KIBKM3JqQCfbUVhOtLtThjo4bZD0NvistlJMm4yEAtb5waiZWuL2yfo5YSO2IF3r
         QgkMZ46ETU4h8jpmGHbloETL+iPt1+1m8XHzvf7P65DPqb4YtelBa+Kf/NG1hgVDhv93
         hKfld/lZiACqnPHfqn4W5RONhm+JZdhasMCbDLhGLR4DfmOzhqK+/RGjT9lRKvgsm/gT
         4U0NXbD0UzTROTA2OQ478UmtZa6vSOgOMDtV+dgf5XkYBZjZdxUM9Ep50qiZyU/T7+bl
         pJzA==
X-Gm-Message-State: AAQBX9fdj2BDTFlqiXGfZMVuwqcNv44rNwVrXUtRxV/8mtLtmp+AplZg
        ysPP5B02m62j+NTw7dI2wY9hywWZwlxn/IonfVIhJQ==
X-Google-Smtp-Source: AKy350aGC8yl/vUvR9z4Vm7doUX9SkLJ6MUp8qgSDNHNEIcIwszPmP7Z6Gr3qL15c7ncubDyIJlOLnYGFNkZU0VIB/s=
X-Received: by 2002:a05:6902:283:b0:b6e:d788:eba7 with SMTP id
 v3-20020a056902028300b00b6ed788eba7mr1159105ybh.6.1679397710763; Tue, 21 Mar
 2023 04:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
 <CAFr9PXmKsequA3V7QWC2fKQYZgaNRj+q3q=UOBLmg6wxYKiVYg@mail.gmail.com> <59c05b36-3370-4d7b-b8cc-39d6dc36cdd0@app.fastmail.com>
In-Reply-To: <59c05b36-3370-4d7b-b8cc-39d6dc36cdd0@app.fastmail.com>
From:   Daniel Palmer <daniel@thingy.jp>
Date:   Tue, 21 Mar 2023 20:21:40 +0900
Message-ID: <CAFr9PX=5Xj63Fm2nRa8oPdXbrkKOMG7D1Y_EV361HtYjs7GZaQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: mstar: remove unused config MACH_MERCURY
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        Russell King <linux@armlinux.org.uk>, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Arnd,

On Tue, 21 Mar 2023 at 18:30, Arnd Bergmann <arnd@arndb.de> wrote:
> I'd still prefer removing it now and only bringing it
> back when you actually add the code for it.

Fair enough. Code does exist for it in my tree but I never got around
to sending it.

I rescind my nak.

Cheers,

Daniel
