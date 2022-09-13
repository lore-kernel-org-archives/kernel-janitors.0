Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC26ECAAD8
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Sep 2022 17:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiIMRGK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Sep 2022 13:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbiIMRFm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Sep 2022 13:05:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D14D4B0FB;
        Tue, 13 Sep 2022 08:55:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CC010B81002;
        Tue, 13 Sep 2022 15:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E931EC433D6;
        Tue, 13 Sep 2022 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663082928;
        bh=YrUHxOpGXMQ+CcAAIAIP/KVdj5zfY8VH1kxTHt3bOjM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P1lHYdk2/ISuWnH9L/UBgazYb6nXLGCeAwerCcAGW3AIAbwoaMpf1pp4f/v+CVwcW
         i4Uix5Z7BlrHhflfMIdO9c+4WRXdCVk/pJrqKiFuf+UuSv2b4WuCGkFv9a/HGp+8R5
         VVKJ8yTExLnOQ5lyLx43HletUZIbDsMchGb+QIb91AUKkE5o85T51o/sD2asFpUnrW
         m6LCmLwTNakgBCzrIkHkm8GveMvsg1VnxxHxDscz61MUtMAU3TC2i4KFsjaIvUQldE
         hJc6gNY6VE7VFSGxNysw6L//cpWSI/UYw7y/b4B0wFliLHpi+JlDNGoUrCaijkpiNF
         AVcLyZ/heZk0Q==
Date:   Tue, 13 Sep 2022 20:58:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wei Yongjun <weiyongjun@huaweicloud.com>
Cc:     Vincent Shih <vincent.sunplus@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] phy: usb: sunplus: Fix return value check in
 update_disc_vol()
Message-ID: <YyChq1vgN6W5KW0P@matsya>
References: <20220909094709.1790970-1-weiyongjun@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909094709.1790970-1-weiyongjun@huaweicloud.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09-09-22, 09:47, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function nvmem_cell_read() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().

Applied, thanks

-- 
~Vinod
