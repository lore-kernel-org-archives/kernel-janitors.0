Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1D1C77B60
	for <kernel-janitors@archiver.kernel.org>; Fri, 28 Apr 2023 11:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345623AbjD1Ltu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 28 Apr 2023 07:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjD1Ltt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Apr 2023 07:49:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001F62D5B
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Apr 2023 04:49:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9278D6433F
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Apr 2023 11:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9A9C433AF
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Apr 2023 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682682588;
        bh=+0HUqFwXOnJ+E9EM1PWKoYSQkhdIqSOQa157EooLpo8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M0xeluirqybJIjswvL2HNcmK4Y0fgnsdVl6wHqSLQkD1KClP9ah1++HlK74rrnwZz
         PA1SpwwXDDsiVGSTAbUueNGC3iXwnHbOYthSXH+gSZ6hl3Ggp5PFWsZL/2qfSaUWll
         bnv1aKClEni/p9uRuovwTqFFMRTm1/cq/M4LgWB6JCEH9h9/2USSNz8QXO6CLbTkqn
         oONHZIC2RXv0dBQyPnkOLrzQRNfasb7crkd8wo9xC6BqoG+a2Pd7us8YYzP83NLnM7
         jVEmT/a7kapZlOK01xSOuPvnNl4XVTEICjchzbYudo15z+M4HGXQ/+lTxZhAMqbysz
         1RAQoXOvBNOZw==
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63b67a26069so12043188b3a.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Apr 2023 04:49:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDw1dPB4aVbg9aq5RqoCeTApv/XVRm46A1B9UlKWsr4zJ6PwVaNd
        FurrxgXzwQ6rPibU4+WvLYHvdgHwU2/eVbL6/iLQ/w==
X-Google-Smtp-Source: ACHHUZ6ccK+wRxQplHz6VziJEnxjiG7risxXQlu7jSikLwR21BJPpjCdVNEqjFUN2bwEAOpjfAxd3IvsxEToMWZskwU=
X-Received: by 2002:a05:6a00:2d93:b0:63d:4358:9140 with SMTP id
 fb19-20020a056a002d9300b0063d43589140mr7858701pfb.34.1682682587374; Fri, 28
 Apr 2023 04:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de> <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
 <6f758653-36c9-91a2-7bbc-278ae3f8ccee@web.de> <CAN6tsi4WBDOyzvXJ8vV=xJYay1JbBGo+UzZ+vudTBm5Fk5nB=A@mail.gmail.com>
 <14083012-2f19-3760-a840-d685fcedc15e@web.de>
In-Reply-To: <14083012-2f19-3760-a840-d685fcedc15e@web.de>
From:   Robert Foss <rfoss@kernel.org>
Date:   Fri, 28 Apr 2023 13:49:36 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7263VnTba+WUUWR171Y+CsOKAb=it8cofPQGRk26K=aA@mail.gmail.com>
Message-ID: <CAN6tsi7263VnTba+WUUWR171Y+CsOKAb=it8cofPQGRk26K=aA@mail.gmail.com>
Subject: Re: drm/bridge: it6505: Move a variable assignment behind a null
 pointer check in receive_timing_debugfs_show()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Allen Chen <allen.chen@ite.com.tw>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Hermes Wu <hermes.wu@ite.com.tw>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hsin-yi Wang <hsinyi@chromium.org>, cocci@inria.fr,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 27, 2023 at 9:40=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > Fix the email Sign-off email !=3D Sender email issue, resubmit and I'll
> > be able to apply this.
>
> You can pick the email from my tag =E2=80=9CSigned-off-by=E2=80=9D up als=
o directly
> as an ordinary patch author email, can't you?

Of course, I can change the email to anything, but drm maintainer
scripts checks for this, presumably for a reason, so it should be
correctly submitted.

>
> Regards,
> Markus
>
