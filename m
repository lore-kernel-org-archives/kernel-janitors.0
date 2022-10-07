Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD951C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 Oct 2022 16:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiJGQoU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 Oct 2022 12:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiJGQoK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Oct 2022 12:44:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56BD8F24B;
        Fri,  7 Oct 2022 09:44:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3692261DB9;
        Fri,  7 Oct 2022 16:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290BDC433C1;
        Fri,  7 Oct 2022 16:44:07 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     mark.rutland@arm.com, will@kernel.org, Sun Ke <sunke32@huawei.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xueshuai@linux.alibaba.com
Subject: Re: [PATCH] drivers/perf: fix return value check in ali_drw_pmu_probe()
Date:   Fri,  7 Oct 2022 17:44:05 +0100
Message-Id: <166516099472.3824419.5030749989971768589.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220924032127.313156-1-sunke32@huawei.com>
References: <20220924032127.313156-1-sunke32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 24 Sep 2022 11:21:27 +0800, Sun Ke wrote:
> In case of error, devm_ioremap_resource() returns ERR_PTR(),
> and never returns NULL. The NULL test in the return value
> check should be replaced with IS_ERR().
> 
> 

Applied to arm64 (for-next/core), thanks!

[1/1] drivers/perf: fix return value check in ali_drw_pmu_probe()
      https://git.kernel.org/arm64/c/ad0112f2d54c

-- 
Catalin

