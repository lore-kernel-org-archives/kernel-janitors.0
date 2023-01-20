Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2480DC05027
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Jan 2023 18:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjATSSR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Jan 2023 13:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjATSSQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Jan 2023 13:18:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FF75E51B;
        Fri, 20 Jan 2023 10:18:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 505E662048;
        Fri, 20 Jan 2023 18:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C890C4339B;
        Fri, 20 Jan 2023 18:18:11 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        senozhatsky@chromium.org, wangkefeng.wang@huawei.com,
        axboe@kernel.dk, kbusch@kernel.org, sfr@canb.auug.org.au,
        mark.rutland@arm.com,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: (subset) [PATCH 00/30] Remove strtobool()
Date:   Fri, 20 Jan 2023 18:18:09 +0000
Message-Id: <167423868542.2495840.9363512425128429378.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 01 Nov 2022 22:05:37 +0100, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[24/30] arm64: cpufeature: Use kstrtobool() instead of strtobool()
        https://git.kernel.org/arm64/c/1a920c92cd0c

-- 
Catalin

