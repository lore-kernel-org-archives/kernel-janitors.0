Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CF6C64ED6
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Mar 2023 09:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjCAJ7M (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCAJ7I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Mar 2023 04:59:08 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E3E392A1
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Mar 2023 01:58:50 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 78F7D66020E0;
        Wed,  1 Mar 2023 09:58:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677664702;
        bh=8ndsZkKsreebHEGikuSigtJ8zQTHmJC5HspQV2Bo/rk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AiD+koqnGnT97mYujB5jOi3lxWhakT7ezL9D2aICxDP0RsZl4mEHO0XoDERpBphoj
         7EtdnxQ6NcGtV8SZvsb/AX9KV3vbqD9+ldPLz4OH+zhepu2xvbxHag0z37m70P1sdN
         pOXw5d9NWhVreFRPGlROANDOIH5iVfN83cyBpWJbxVrMZ3AoUPSkoh4JyAUP2SzbMT
         Iy2thheD2P++lWPzCUtDxMtqbdxID036gN/PCNmjLLZb2T7Hskf+j0lO05ECe/a4qX
         JmkqKToNgUHCQxfRkLdMi6Pafafmcah0djwT1tGg8m6od2Mz1NNoQnR2Pk32ojUuLd
         +FCALBYCHFgpg==
Message-ID: <3bcf01ef-e9af-3216-6cd3-7cc08a5bfedd@collabora.com>
Date:   Wed, 1 Mar 2023 10:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Julien STEPHAN <jstephan@baylibre.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <Y/yBC4yxTs+Po0TG@kili>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y/yBC4yxTs+Po0TG@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Il 27/02/23 11:08, Dan Carpenter ha scritto:
> There is a type bug because the return statement:
> 
> 	return ret < 0 ? ret : recv_cnt;
> 
> will not return negatives on 64bit systems.  The problem is that the
> function returns ssize_t types, while "ret" is int and "recv_cnt" is a
> u32.  The negative values are type promoted to u32 and returned as
> positive values instead of negative error codes.
> 
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


