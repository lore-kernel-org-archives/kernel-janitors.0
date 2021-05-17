Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEE3C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EC64610FC
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbhEQKAK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 06:00:10 -0400
Received: from stargate.chelsio.com ([12.32.117.8]:16918 "EHLO
        stargate70.asicdesigners.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236424AbhEQJ7l (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 05:59:41 -0400
Received: from [10.193.177.171] (dd3k3bs-lt01.asicdesigners.com [10.193.177.171] (may be forged))
        by stargate70.asicdesigners.com (8.14.7/8.14.7) with ESMTP id 14H9wHEH017565;
        Mon, 17 May 2021 02:58:18 -0700
Cc:     ayush.sawal@asicdesigners.com, kernel-janitors@vger.kernel.org,
        Rohit Maheshwari <rohitm@chelsio.com>
Subject: Re: [bug report] cxgb4/ch_ktls: Clear resources when pf4 device is
 removed
To:     Dan Carpenter <dan.carpenter@oracle.com>
References: <YJ+lregUoryep/Ix@mwanda>
From:   Ayush Sawal <ayush.sawal@chelsio.com>
Message-ID: <83fca50a-448b-a0a7-e406-ea458270637f@chelsio.com>
Date:   Mon, 17 May 2021 15:48:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <YJ+lregUoryep/Ix@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for pointing this out.
The u_ctx pointer in case of ch_ktls will always be valid.

So this condition if(u_ctx && u_ctx->detach) must be if(u_ctx->detach).
and xa_erase(&u_ctx->tid_list, tx_info->tid) doesnot requires a u_ctx check.

So I will send a fix which replaces if(u_ctx && u_ctx->detach) to 
if(u_ctx->detach)
and removes the checks for u_ctx pointer in ch_ktls driver.

Thanks,
Ayush

On 5/15/2021 4:12 PM, Dan Carpenter wrote:
> Hello Ayush Sawal,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 65e302a9bd57: "cxgb4/ch_ktls: Clear resources when pf4
> device is removed" from May 13, 2021, leads to the following Smatch
> complaint:
>
>      drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c:393 chcr_ktls_dev_del()
>      error: we previously assumed 'u_ctx' could be null (see line 374)
>
> drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
>     373		u_ctx = tx_info->adap->uld[CXGB4_ULD_KTLS].handle;
>     374		if (u_ctx && u_ctx->detach)
>                      ^^^^^
> Can u_ctx be NULL?
>
>     375			return;
>     376		/* clear l2t entry */
>     377		if (tx_info->l2te)
>     378			cxgb4_l2t_release(tx_info->l2te);
>     379	
>     380	#if IS_ENABLED(CONFIG_IPV6)
>     381		/* clear clip entry */
>     382		if (tx_info->ip_family == AF_INET6)
>     383			cxgb4_clip_release(netdev, (const u32 *)
>     384					   &tx_info->sk->sk_v6_rcv_saddr,
>     385					   1);
>     386	#endif
>     387	
>     388		/* clear tid */
>     389		if (tx_info->tid != -1) {
>     390			cxgb4_remove_tid(&tx_info->adap->tids, tx_info->tx_chan,
>     391					 tx_info->tid, tx_info->ip_family);
>     392	
>     393			xa_erase(&u_ctx->tid_list, tx_info->tid);
>                                   ^^^^^^^^^^^^^^^^
> Unchecked dereference.
>
>     394		}
>     395	
>
> regards,
> dan carpenter
