Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637E7C07E9D
	for <kernel-janitors@archiver.kernel.org>; Sat, 24 Sep 2022 06:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbiIXG3y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 24 Sep 2022 02:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiIXG3w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Sep 2022 02:29:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2297028E05
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Sep 2022 23:29:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C9096B8013A
        for <kernel-janitors@vger.kernel.org>; Sat, 24 Sep 2022 06:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229C2C433D6;
        Sat, 24 Sep 2022 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664000988;
        bh=6bg3jfUXb8g3xzE3q/HoLtC2LRIFOYoq2MN00W1hiWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mxh+RvDPfgvHvSdrANIsqxeFjiPiFphxpC2aIw8U4U+XySvz7hoMbwG8NHH/4VdhS
         uZb5LEr4a+wfY9N8OyJwh0G3As+OPhWBwJ7FeyDuXOxce1ZxvE0p7Tawi0vDdXASbc
         uaT6RMmVhvPJGhGPhqvrSZxAYaURY+CT9xAFHAZ/ALEbMHwe6GOJGDwWhMnV6vy9/z
         8pi8cbvnAEkyz+nOK9ls3H2xPvine1rzGUdxs6wZHu/AXro/udZV/O03PNF1BCeWFz
         XcdEopEo1we2tc4whkObNuWB+A8G6wt8C3donSHN6OWoIjhy4sPph/RsJsK7l/MNUf
         SDrTAjdpUhRLw==
Date:   Sat, 24 Sep 2022 11:59:44 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Roger Quadros <rogerq@kernel.org>, Jyri Sarha <jsarha@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Tanmay Patil <t-patil@ti.com>, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: ti: phy-j721e-wiz: fix reference leaks in
 wiz_probe()
Message-ID: <Yy6j2KhuQmR95JNc@matsya>
References: <YyxFI8aW23IC/21U@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyxFI8aW23IC/21U@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22-09-22, 14:21, Dan Carpenter wrote:
> These two error paths need to call of_node_put(child_node) before
> returning.

Applied, thanks

-- 
~Vinod
