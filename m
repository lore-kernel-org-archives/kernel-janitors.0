Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8767C41513
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 10:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbjGXK4E (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 06:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbjGXK4C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 06:56:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7E190
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 03:56:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5439F6108D
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 10:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BB5C433CB;
        Mon, 24 Jul 2023 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690196160;
        bh=ufAhlUwogYgyeylsGp4GMH2UHKG3zngITVIILhhHetM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=TFL5Bb0F6SqzaADWRuvCbQqvij2/ekMoVUvKFMnI4eyxg41TaUf6zGJmiaf1S30zA
         DlDNd0J7A32EU+KwY1/0POWnLPFZRoF8RC6HcW8q2Ei6O2K62eGjYqERTrdu26uEhE
         bR9SiHIsIA5WBVlRmlhkGjHz2os1YDCRLZFO5p9/hAvfIXay9hV/2ZsaoR02JtVIaO
         U9wB0ZNPPPy70sdbO+BBiHFQ7b+wzIol0mHle6iepGQb4/hpB972/FiUZqF1XUi5Db
         Qck5hy1LwNXAeq2eIn3uMbgf/6k5+MpKIgLkYyYgeGJgLqPOpXBzxn6NZWuAvLKC1Z
         rIzSmo4TuLPlA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Minda Chen <minda.chen@starfivetech.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
In-Reply-To: <3cc81f2a-efd7-4ef7-ae6b-e38c91efe153@moroto.mountain>
References: <3cc81f2a-efd7-4ef7-ae6b-e38c91efe153@moroto.mountain>
Subject: Re: [PATCH] phy: starfive: fix error code in probe
Message-Id: <169019615873.466601.15170980183003390896.b4-ty@kernel.org>
Date:   Mon, 24 Jul 2023 16:25:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Tue, 18 Jul 2023 10:02:49 +0300, Dan Carpenter wrote:
> This is using the wrong pointer, "phy->regs" vs "phy->phy".
> 
> 

Applied, thanks!

[1/1] phy: starfive: fix error code in probe
      commit: 86fe3e9f4c635cf740b31161ee35aed4a78e03f9

Best regards,
-- 
~Vinod


