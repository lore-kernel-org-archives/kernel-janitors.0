Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2D1C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 01:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EA2F64F51
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 01:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhCEBT6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 Mar 2021 20:19:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13058 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCEBT6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Mar 2021 20:19:58 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ds8x31fxdzMjGY;
        Fri,  5 Mar 2021 09:17:43 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 5 Mar 2021
 09:19:48 +0800
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix a redundant call to f2fs_balance_fs
 if an error occurs
To:     Colin King <colin.king@canonical.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        <linux-f2fs-devel@lists.sourceforge.net>
CC:     <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210304092118.2279879-1-colin.king@canonical.com>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <a67cbd86-0e44-490a-95fa-cf300e005d2e@huawei.com>
Date:   Fri, 5 Mar 2021 09:19:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210304092118.2279879-1-colin.king@canonical.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021/3/4 17:21, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The  uninitialized variable dn.node_changed does not get set when a
> call to f2fs_get_node_page fails.  This uninitialized value gets used
> in the call to f2fs_balance_fs() that may or not may not balances
> dirty node and dentry pages depending on the uninitialized state of
> the variable. Fix this by only calling f2fs_balance_fs if err is
> not set.
> 
> Thanks to Jaegeuk Kim for suggesting an appropriate fix.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 2a3407607028 ("f2fs: call f2fs_balance_fs only when node was changed")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
