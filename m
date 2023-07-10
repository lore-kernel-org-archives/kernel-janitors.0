Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211FFEB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jul 2023 10:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbjGJKZP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jul 2023 06:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbjGJKZO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 06:25:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C27095
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 03:25:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E54FB60F96
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 10:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235FBC433C8;
        Mon, 10 Jul 2023 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688984712;
        bh=8wbTdNkehE98Ctimhl7nOewzsLGVvoA8c+GqiH1ZOE0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=iXl9Eo6SSYgH/eoyMB8fQr2XK36z/x0kVrQoG0lLfPMq4Cq2yaOBoYJZDKOouKCh4
         Th5NHzsbFXHwpkAiqmUe3tqLsosQ/JXuG9J4JyHvEMD+7AqcA1BCXi4L4Dod/Of97y
         YVvqOyixLfaW9ipq+55G58aF0PKUA+J5zBRbOj9A2+poIPhv78PboITZx4EFXiJcoQ
         ytr9DI4SpwIN9SVA5fNNOOciZU5IuyZVQBs3ymqU41csMMGYtUFI+jt7Y/NVmAgOLK
         pkAIP4/QGeeq97MOPxblc8QlYCH/w+UethpuLGdyc+u/JPUMNTubblqlinnacnkOjW
         v814xFgVJEo7A==
From:   Vinod Koul <vkoul@kernel.org>
To:     "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
In-Reply-To: <9863b2bf-0de2-4bf8-8f09-fe24dc5c63ff@moroto.mountain>
References: <9863b2bf-0de2-4bf8-8f09-fe24dc5c63ff@moroto.mountain>
Subject: Re: [PATCH v2] soundwire: amd: Fix a check for errors in probe()
Message-Id: <168898470975.164858.364870274805965240.b4-ty@kernel.org>
Date:   Mon, 10 Jul 2023 15:55:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Tue, 27 Jun 2023 08:42:10 +0300, Dan Carpenter wrote:
> This code has two problems:
> 1) The devm_ioremap() function returns NULL, not error pointers.
> 2) It's checking the wrong variable.  ->mmio instead of ->acp_mmio.
> 
> 

Applied, thanks!

[1/1] soundwire: amd: Fix a check for errors in probe()
      commit: a06d6088cfd49b63a2759910f2328ba28d6a342d

Best regards,
-- 
~Vinod


