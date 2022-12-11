Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20652C4332F
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Dec 2022 02:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiLKCxA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Dec 2022 21:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiLKCwz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Dec 2022 21:52:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3A59FDF;
        Sat, 10 Dec 2022 18:52:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7AA2660D3C;
        Sun, 11 Dec 2022 02:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C4DC433D2;
        Sun, 11 Dec 2022 02:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670727173;
        bh=nisRq5p9DLzuzSIWJsSZIki1q8UKQxwkg+jqQ5Nd/z4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KBrkA6E0LlP7rdNpvJYHcbH78mclYWwZnnWXVPxvPK2SN8d+yucpszYOSymv9ckJw
         wd5jd40VkSTbYl/Jm1WXLKeX0xb23ZtCH0wKn+BUCUq7bMRFpTt3u8i12Bq8om49lW
         W0JvNzZ1oDLjSHhQp41EkchugLTdtwyotUci5Yifx1/+TWI02mUkvTHypWMSWsiJ/8
         qYozze92W5noFHYkIdvqqQ0gO9wKS7t4BlDwk7Br3H8wu8fe5rDdei24+5+sZCvOvY
         PzHGKY7+yv3v7dWQwQhzttzigKVstDD5Lud/k4+GO0sobzi/BbKxXdb9XhWsNUS2Ja
         Bovk4VXNIR3RA==
Message-ID: <6c258bab-84fd-6515-6af1-d9fced65c34f@kernel.org>
Date:   Sun, 11 Dec 2022 10:52:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] f2fs: Fix spelling mistake in label: free_bio_enrty_cache
 -> free_bio_entry_cache
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221207134217.2325189-1-colin.i.king@gmail.com>
From:   Chao Yu <chao@kernel.org>
In-Reply-To: <20221207134217.2325189-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2022/12/7 21:42, Colin Ian King wrote:
> There is a spelling mistake in a label name. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

