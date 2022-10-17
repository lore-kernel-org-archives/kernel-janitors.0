Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B09DC4332F
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Oct 2022 05:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiJQFZp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Oct 2022 01:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiJQFZo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Oct 2022 01:25:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF3C537D2
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Oct 2022 22:25:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 45EE9B80EAE
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Oct 2022 05:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A2BC433D6;
        Mon, 17 Oct 2022 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665984341;
        bh=QLTUjN8wz1TtW0LObJouIjCQHTrwqKczV/PmiieRk1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovFPID7s6qzGHC0D3Xke7f+LPCp8gLARW8Nmy0NhMC+GLkYiT0eQpco/2VuoZTaSj
         wRBc9JcsSb9Tu2GlYJuwGP2QfrHb0HUxLVZI4e8ZKSXNenoPj1JBN81hVi+Kb4EfAL
         QinXZvMiyHT4iAxuRQ6o9M5vN/sqCYS/7IoC+wNA89eIBTgN6N1/q4VweLB+AEcQpQ
         sLwz01/Irs3XR7ElEh3/JMeVN9kpbGDFDYhOAg5ieexqT0gLsxk9unJUqQGFXqkw9i
         2iACfAH7W7XF0FEON81Q2eUYNpJMvceh3KUtFZ8KfTRbsVG+oCpVmHJxWOlz9q38R3
         NRoZcRzb5X+9Q==
Date:   Mon, 17 Oct 2022 10:55:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: stm32: fix an error code in probe
Message-ID: <Y0znUJMwFbOAPYpj@matsya>
References: <Y0kq8j6S+5nDdMpr@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0kq8j6S+5nDdMpr@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 14-10-22, 12:25, Dan Carpenter wrote:
> If "index > usbphyc->nphys" is true then this returns success but it
> should return -EINVAL.

Applied, thanks

-- 
~Vinod
