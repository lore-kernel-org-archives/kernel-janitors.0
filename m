Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBAEC433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 21:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB45261A10
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 21:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhCXVwD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 17:52:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:40270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230347AbhCXVvt (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 17:51:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9138361A1F;
        Wed, 24 Mar 2021 21:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616622708;
        bh=nKqBe8zxtDPSm4rFKs3L88eYR1+0V492t0xsOeaWAgs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ax1hN8B2RF2FdBWqPz21G6bER5IkoKd2dAKgi/AiK6zPx1IjAOATNj9X5/GVDlRhi
         O1ynKg+CQFSY4ntNXV7RW73AhfqNEWXX2Stou0pQNwGEn/Y5mL7E0eUTxxX7nYCNoY
         FA7JJG6eJcnttkDI/sij76+v0xThstez9UJ7I2xFm9LNs00ai4vfJpMKZscEBrNMNp
         EyB37BjnSlPjeqXrizv+/JW5I4noWBgEOOd/f1dbz14iRBxaG4OBhC8ACaAuytX+0p
         cDsE/7tGfPDQmfjUKDlpqIhqNCYiPfohOYGFaHSk2TVvjGDPiKBw4p8DrwVsby/a7H
         QWJaoBw4IPpqA==
Date:   Wed, 24 Mar 2021 14:51:47 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Jiri Pirko <jiri@mellanox.com>, <netdev@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH net-next] netdevsim: switch to memdup_user_nul()
Message-ID: <20210324145147.6b8e802b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210324144220.974575-1-weiyongjun1@huawei.com>
References: <20210324144220.974575-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 24 Mar 2021 14:42:20 +0000 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Use memdup_user_nul() helper instead of open-coding to
> simplify the code.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
