Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C04C0015E
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 Jul 2023 19:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjGITtD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 9 Jul 2023 15:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjGITtB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Jul 2023 15:49:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC57183;
        Sun,  9 Jul 2023 12:48:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C55D360C3B;
        Sun,  9 Jul 2023 19:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7226C433C7;
        Sun,  9 Jul 2023 19:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688932135;
        bh=jhpEKEilITelwA0mIHfrSM6wUiPl4EHpLYuPHMUEwfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lirHW3QYoCxf4FSPQcglovPGKpxSJ7Xzt3TXoM8QkeZAX85c6m56EuJimwNnxxxvt
         jhtyocDFxAiZ6vvIVVEJtXVTe/RhHGB9EQhK6BK036aR5juazjtaBDLr2HLIyFvJCA
         ZXwMcv8TWcVeRV5ZFMZB/CTpcRD2gvJoYMiz31oo=
Date:   Sun, 9 Jul 2023 21:42:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Zhang Shurong <zhang_shurong@foxmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Carpenter <error27@gmail.com>,
        Xu Panda <xu.panda@zte.com.cn>
Subject: Re: [PATCH] staging: ks7010: potential buffer overflow in
 ks_wlan_set_encode_ext()
Message-ID: <2023070919-monetary-sleet-2f5c@gregkh>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
 <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jul 09, 2023 at 09:21:45PM +0200, Markus Elfring wrote:
> > The "exc->key_len" is a u16 that comes from the user.  If it's over
> > IW_ENCODING_TOKEN_MAX (64) that could lead to memory corruption.
> 
> Please choose an imperative change suggestion.

Please stop reviewing staging patches, it is not helpful for anyone.

greg k-h
