Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6CEEB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 09:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjGKJ0y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 05:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjGKJ0k (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 05:26:40 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C9B210C
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 02:22:39 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 72B56660700C;
        Tue, 11 Jul 2023 10:22:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689067358;
        bh=a9oLCnZxtGs0dkV9W5N8Cb0d/8qnym0UvYTivQ6JqIo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=c1ZtDu0eFmj+ZavM8x1eGIGQfAIVIDM2FnjpiRdMrlHKaolONcttaDRpkaePIJxvq
         V2skv1yQCnlEhGPXdY0hNeDWO2kTKrPokFFpy64CruRnS9eJoJWSFE1KRS84laTKXQ
         5k84Jntf6bR5lZ9UpTc7WmJKXTcoaVAB1xk80SNW/O6XEkh1J0VhKj3tJpleU2OZuD
         WKChoYKf5Pc8WfIlJzJRQTM0RBuXZSSA+ikWsQiNg3qgl136LnWELV6hzCkvNRbKMN
         r6Gh8Gv22Uj2iZpKitLfzq/XvHAvKuwK56+VBKZOHz9oLqgnnxHjtoiO1MD7w+jss3
         E80P/8snG5xMg==
Message-ID: <5fdba6c8-d15a-126e-29d9-b6c5b33efcce@collabora.com>
Date:   Tue, 11 Jul 2023 11:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bo-Chen Chen <rex-bc.chen@mediatek.com>,
        Guillaume Ranquet <granquet@baylibre.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Il 11/07/23 08:13, Dan Carpenter ha scritto:
> Negative -EINVAL was intended instead of positive EINVAL.
> 
> Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


