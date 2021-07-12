Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBF8C07E96
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 01:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E75836044F
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 01:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhGLBtn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 11 Jul 2021 21:49:43 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:53105 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229812AbhGLBtm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Jul 2021 21:49:42 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UfQgodm_1626054412;
Received: from B-D1K7ML85-0059.local(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0UfQgodm_1626054412)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 12 Jul 2021 09:46:53 +0800
Subject: Re: [PATCH] ocfs2: remove an unnecessary condition
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mark Fasheh <mark@fasheh.com>, Larry Chen <lchen@suse.com>,
        akpm <akpm@linux-foundation.org>
Cc:     Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com,
        kernel-janitors@vger.kernel.org
References: <YOcItgIXtisi3MaO@mwanda>
From:   Joseph Qi <joseph.qi@linux.alibaba.com>
Message-ID: <132a151e-3a09-5583-279c-748702752eba@linux.alibaba.com>
Date:   Mon, 12 Jul 2021 09:46:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOcItgIXtisi3MaO@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 7/8/21 10:16 PM, Dan Carpenter wrote:
> The case where "tmp_oh" is NULL is handled at the start of the function.
> At this point we know it's non-NULL so this will always return 1.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/dlmglue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
> index 48fd369c29a4..33fbdc823278 100644
> --- a/fs/ocfs2/dlmglue.c
> +++ b/fs/ocfs2/dlmglue.c
> @@ -2721,7 +2721,7 @@ int ocfs2_inode_lock_tracker(struct inode *inode,
>  			return status;
>  		}
>  	}
> -	return tmp_oh ? 1 : 0;
> +	return 1;
>  }
>  
>  void ocfs2_inode_unlock_tracker(struct inode *inode,
> 
