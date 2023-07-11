Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA055EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 07:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjGKHhA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 03:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjGKHg7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 03:36:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C59133
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 00:36:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED1A561356
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 07:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D294CC433C7;
        Tue, 11 Jul 2023 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689061017;
        bh=sp9FUz7vFWMOXim7BOi9FhfXePdR8iwcHRlNLjmbrE0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=o+KWj9bXmQa6HfWyip5V0qnUuXxShVLYk5hJdPLFMtnIUrLDrJNGA3OoPRiDgXTo3
         8FLQU5yRGDau/XKm0ZH75oQzVIYnmb3fo19Gl5s3xGoxgEXTHVDYPrzPLuUSt/q+9Q
         e/iSLt9vgfmnvBblKjaVQWM3iSHxXvTYglKEHMwglEsiW0ZdNudN+fAts5ARukzu2E
         RYWhdZxjxt5mGhE00CK34425ADah9caNJ1RVpLS3DC08xZz9lARxQ629iUtCs7LuE5
         2mjaY0lCjRz2MqsjDCdwolr2zwa/evxOVdRKjdU1X/cC/LKG/NN4Q7yVsTPtc27QHI
         SjiMhH5BwXtFQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bo-Chen Chen <rex-bc.chen@mediatek.com>,
        Guillaume Ranquet <granquet@baylibre.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Message-Id: <168906101241.188690.9773925204562641483.b4-ty@kernel.org>
Date:   Tue, 11 Jul 2023 13:06:52 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Tue, 11 Jul 2023 09:13:25 +0300, Dan Carpenter wrote:
> Negative -EINVAL was intended instead of positive EINVAL.
> 
> 

Applied, thanks!

[1/1] phy: phy-mtk-dp: Fix an error code in probe()
      commit: 03966c3950d36d6b671158be3794eb7211434faa

Best regards,
-- 
~Vinod


