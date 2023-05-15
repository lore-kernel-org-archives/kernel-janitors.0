Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C9AC77B7D
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 08:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237928AbjEOImX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 04:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237303AbjEOImV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 04:42:21 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4B1E49;
        Mon, 15 May 2023 01:42:13 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E01D321D54;
        Mon, 15 May 2023 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1684140131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iMyogPFU7LyhBaMdBwdBH4OR9+KTNXgm0SUPVyw/cGM=;
        b=WfEJddmeb+29p4Y3ITjjtW/umMxsj58OkKEX+tSkh64CFkZ6yfmRmHR3mXd/FtHD7ALsc5
        WnUbc4PsA8EGfZa+5pBI6C+/oFQLFv1V4FbBORqGHuHqoOzNB+OJ2j7OJksC5FB1elRXIS
        LNLT5yabMKmcgL7bW9cinAbk0r0wRTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1684140131;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iMyogPFU7LyhBaMdBwdBH4OR9+KTNXgm0SUPVyw/cGM=;
        b=EGOT908D3K2uelZ40g+IGjQ4ieCCK3s7Kglhwj1a9/vFOszfrNdYEE9z2lEyuHpN8TYxs/
        WFpS7rEc2cBcxnAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDE02138E5;
        Mon, 15 May 2023 08:42:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Yu+iLWPwYWTYMQAAMHmgww
        (envelope-from <vbabka@suse.cz>); Mon, 15 May 2023 08:42:11 +0000
Message-ID: <ab9c6c47-ef9d-c31f-e789-b70cf72231ce@suse.cz>
Date:   Mon, 15 May 2023 10:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] net: skbuff: remove special handling for SLOB
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230509071207.28942-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
From:   Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20230509071207.28942-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/9/23 09:12, Lukas Bulwahn wrote:
> Commit c9929f0e344a ("mm/slob: remove CONFIG_SLOB") removes CONFIG_SLOB.
> Now, we can also remove special handling for socket buffers with the SLOB
> allocator. The code with HAVE_SKB_SMALL_HEAD_CACHE=1 is now the default
> behavior for all allocators.
> 
> Remove an unnecessary distinction between SLOB and SLAB/SLUB allocator
> after the SLOB allocator is gone.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

