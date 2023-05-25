Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F08CC7EE2D
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 11:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240911AbjEYLUd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 07:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240915AbjEYLUa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 07:20:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D031A1;
        Thu, 25 May 2023 04:20:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B703D60D2C;
        Thu, 25 May 2023 11:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24124C433D2;
        Thu, 25 May 2023 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685013626;
        bh=21BUIAXY4GLfn61vTZo7heu9IkZn4thjqRB1LJIZBQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lnhIMvpNE7drzF4Dr0+VdGG+vWdlvNMQmjMh+BZZIayey4hvaUo2aQzRvtpxvgM6I
         ha/LbXLpVZzFnV/Qubrio+VTCi9oe9ZZpwo8VHuiEWzPhfsO4m80M08ofQpMS//yEU
         P6GGz1oKZx1GlWPHbKBXY8HSstv9kW0Sv+YtHbzietGpo1B0GPPOxqCid5jW8nfR27
         IgcBba1VNfQHAoWQc1yPWLLveLsB1sUbaTqqsESfMZRaI/LvjQuI/CfRUPtqbp69iK
         e3812xSabLu80Jnk8NuRtgI7+zaPil3W89Qq912Lm15nkJ6h1//RnK0QUR7N21r9HA
         RB7ZLf+0iss4w==
Date:   Thu, 25 May 2023 12:20:23 +0100
From:   Lee Jones <lee@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: wcd934x: Simplify with dev_err_probe()
Message-ID: <20230525112023.GD411262@google.com>
References: <02d8447f6d1df52cc8357aae698152e9a9be67c6.1684565021.git.christophe.jaillet@wanadoo.fr>
 <73fdc6ecf619f80fad126abca11fb579d3d87f64.1684565021.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73fdc6ecf619f80fad126abca11fb579d3d87f64.1684565021.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 20 May 2023, Christophe JAILLET wrote:

> Use dev_err_probe() to simplify code, save a few LoC and be consistent
> with error codes handling in messages.
> It also filters -EPROBE_DEFER that can be returned by devm_clk_get().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/wcd934x.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
