Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2591DC54E94
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Jan 2023 13:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbjAZNWP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Jan 2023 08:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjAZNWO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 08:22:14 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBF0CC0E
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 05:22:14 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 23F5C6602E70;
        Thu, 26 Jan 2023 13:22:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674739332;
        bh=PFjk7Lwomgg5i2CpzGsGjt10RBQ/x3BeqMztijLbhMw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=L1rfx53K/+HWdvL1cFrlzGxZv387Xj8Ya90h3fuTz4wMoksDSXelcJszna55ZhRbL
         g4USt4nnYYxPHhEAHfCu8fQxK6Q8cfPl+A1FEMKC1MUNkbEBBYVhYcbM8hsLjRQmtc
         J0aHr59lUYz6GUfuZrH5I6yJAoJtJEV1kr0aGGPtn94D9nwsBgUYIRvQ31PffMO8HF
         EkgrUEk2lau+3IpH6suc9ngYFTg6cp5dWk7CbOnYXPbiTCRuHZdmcikQmU8lD5e12P
         7kFZniCswiQV0vwKifCAMoeMwEEnuTWVZ+GzvOCW11ZOkxyvrHGkZy8ULBaUAyBpfp
         a0PFtoVdaPJmA==
Message-ID: <6f376bb9-2f44-b705-6843-795c0c1da742@collabora.com>
Date:   Thu, 26 Jan 2023 14:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <Y9JHSwcfdNcfMjjt@kili>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y9JHSwcfdNcfMjjt@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Il 26/01/23 10:26, Dan Carpenter ha scritto:
> We know that "irq < 0", so delete the unnecessary check.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

