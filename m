Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1FEC678D8
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Jan 2023 17:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbjAKRjI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Jan 2023 12:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239533AbjAKRif (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Jan 2023 12:38:35 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BC56445
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Jan 2023 09:38:23 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v2so4821872wrw.10
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Jan 2023 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fungible.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=adxRRdSFK1oDlMN9+g7iUQ5+erm/E8wEY+S20rDclo4=;
        b=Ojf5IsMySBRC3WslOJd5ShwoEwGV/CwyCCfuTfqgHG8lqDUX6n3KjUUrgRyOT3Cf+F
         cKAfjWRaoJYKzztz/ygdvBDk/4UjMAxaMtTANKiIa1/Fve8ygM+ntOxARHXYavSKnbXF
         vjrQzsxeVrfpg0eAUwY+fGZPeqBlHQQRWQ5xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adxRRdSFK1oDlMN9+g7iUQ5+erm/E8wEY+S20rDclo4=;
        b=ez+mSM2DfWECYxIhEPuplFxy1qW6HZjVxW9KVJ6qw0sUvyhBaEMEGodug6Zhy2cfW3
         dNjy6sS063yVYeL7a71fRSMrACSMNWt+k41X19Eu0q9huXEG3+q0s63Z6KExdr5Aq6VU
         DvXNKk83BP0c75zJJmU7w0SoUThnSKXX7mgMFsQyrgX2ZPQfmDULwKGF9uZDZuZ6jG1x
         cvItdBnvxVcByDlq9643JUNigPXMB2iQmdh+Glk+a+w90HeBZDRhlxqCiwKa+6RxHHDF
         QLrMHfHeWPWaQ2d4t0Md1i2App9O4RrK6JUfOEX/HnnLNtXefECgV5oHfw4gjVGUAskB
         MyqA==
X-Gm-Message-State: AFqh2kre6L/LRb5fb+8hFUeUqHIemDEkZ+kEtXNVWcGAnImiEFYqJs1F
        rwtnM404ymo/bKixlX11cRkpiniSNpEq6jRojmn/PQ==
X-Google-Smtp-Source: AMrXdXuOeVpQDCUqLxUrp+tlSIuydrCS7sCQd2/buXk57/+gGcw6IRQYS++14/3YaUgHqkm7eIbIrY6HrLLLrkqxxyQ=
X-Received: by 2002:a05:6000:705:b0:273:7d1b:7334 with SMTP id
 bs5-20020a056000070500b002737d1b7334mr1538554wrb.340.1673458702047; Wed, 11
 Jan 2023 09:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20230111125855.19020-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230111125855.19020-1-lukas.bulwahn@gmail.com>
From:   Dimitris Michailidis <d.michailidis@fungible.com>
Date:   Wed, 11 Jan 2023 09:38:08 -0800
Message-ID: <CAOkoqZniMk+hcemy9JhTxerd_9ypbXd=SDBE1yGLoCDYB2RNWg@mail.gmail.com>
Subject: Re: [PATCH] net: remove redundant config PCI dependency for some
 network driver configs
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Dimitris Michailidis <dmichail@fungible.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Simon Horman <simon.horman@corigine.com>,
        oss-drivers@corigine.com, "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jan 11, 2023 at 4:59 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> While reviewing dependencies in some Kconfig files, I noticed the redundant
> dependency "depends on PCI && PCI_MSI". The config PCI_MSI has always,
> since its introduction, been dependent on the config PCI. So, it is
> sufficient to just depend on PCI_MSI, and know that the dependency on PCI
> is implicitly implied.
>
> Reduce the dependencies of some network driver configs.
> No functional change and effective change of Kconfig dependendencies.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/net/ethernet/freescale/enetc/Kconfig | 4 ++--
>  drivers/net/ethernet/fungible/funeth/Kconfig | 2 +-
>  drivers/net/ethernet/netronome/Kconfig       | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

For funeth part:

Acked-by: Dimitris Michailidis <dmichail@fungible.com>
