Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41ADC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Jan 2022 05:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbiA0Fez (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Jan 2022 00:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbiA0Fez (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jan 2022 00:34:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE14C06161C
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jan 2022 21:34:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 836C0B82025
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Jan 2022 05:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5910FC340E4;
        Thu, 27 Jan 2022 05:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643261692;
        bh=5S9wWt15TRVrJ6Yz4hj/m81O+1PNXTybGgjTNNXdhLM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jc3bvfoBF2XboC0ign5S4JZO6wKpsCTDkYPjC4+VK+aMfXtA/HizbWmoh5/ca26kA
         L6KkgQ4ZyR5oWOMQiwjoslod79EF+928mYSjO1jVF3Nb0JB8/zNvgo9WbZSXjjR1B4
         mWmjeB8vJttQC4TQ2yJGdjijyMD3YtXvOuGu6siaIDRL9prjSXiNJqIUvUsnMy2OkR
         DZ8o/VfBDZB73m9u/nXihQZeVngJc3pAFUHtJJngtopQz4y51fGOskhQu/hVAAuvag
         LK4YXQ5ieOj6pMkRX07yWfy9ayJsoDoNG8OapcmoyG9PKnd6MNtjsTij5dvPbTzZ6u
         KJfS+ZhaaNIGw==
Date:   Thu, 27 Jan 2022 11:04:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: stm32: fix a refcount leak in
 stm32_usbphyc_pll_enable()
Message-ID: <YfIu+PYohxp6+VYe@matsya>
References: <20220112111724.GB3019@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112111724.GB3019@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12-01-22, 14:17, Dan Carpenter wrote:
> This error path needs to decrement "usbphyc->n_pll_cons.counter" before
> returning.

Applied, thanks

-- 
~Vinod
