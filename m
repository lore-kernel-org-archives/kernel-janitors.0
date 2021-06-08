Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FF0C47082
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 15:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7177161185
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 15:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbhFHPEP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45880 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233743AbhFHPEN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 11:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623164538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+Dzn+cPsGoR9HL9Ks0Iy6sPe041zFK35ddq5OYs2tdA=;
        b=Em9N8lIfInJotgH8UHE2JR/ZXTED+hG83BZ4txmLMFVJrlLWDT3m6eWA14DRfgn7mtiNuT
        POVagyaMbhNBQfZ67k7CN2Bbr+58mVa6LM4mJ8uVYFegJ4qDW7nTu1Sq9us81pmlLJIzhT
        Eso2F8DOMNkjS7G1Ie1BHnF5v7MK9Ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-4wvNu7_PPZqcPp38yU7LXA-1; Tue, 08 Jun 2021 11:02:16 -0400
X-MC-Unique: 4wvNu7_PPZqcPp38yU7LXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56D751936B60;
        Tue,  8 Jun 2021 15:02:15 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.3.128.13])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 34C0D19C45;
        Tue,  8 Jun 2021 15:02:06 +0000 (UTC)
Date:   Tue, 8 Jun 2021 11:02:03 -0400
From:   Richard Guy Briggs <rgb@redhat.com>
To:     Baokun Li <libaokun1@huawei.com>
Cc:     linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@redhat.com>, Hulk Robot <hulkci@huawei.com>,
        kernel-janitors@vger.kernel.org, yuehaibing@huawei.com,
        yangjihong1@huawei.com, linux-audit@redhat.com, yukuai3@huawei.com,
        weiyongjun1@huawei.com
Subject: Re: [PATCH -next] audit: Use list_move instead of list_del/list_add
Message-ID: <20210608150203.GB2268484@madcap2.tricolour.ca>
References: <20210608031150.2821712-1-libaokun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608031150.2821712-1-libaokun1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021-06-08 11:11, Baokun Li wrote:
> Using list_move() instead of list_del() + list_add().

This should be slightly more efficient since there is no need to poison
the pointers.

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

Acked-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  kernel/audit_tree.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> index 6c91902f4f45..b2be4e978ba3 100644
> --- a/kernel/audit_tree.c
> +++ b/kernel/audit_tree.c
> @@ -689,8 +689,7 @@ void audit_trim_trees(void)
>  
>  		tree = container_of(cursor.next, struct audit_tree, list);
>  		get_tree(tree);
> -		list_del(&cursor);
> -		list_add(&cursor, &tree->list);
> +		list_move(&cursor, &tree->list);
>  		mutex_unlock(&audit_filter_mutex);
>  
>  		err = kern_path(tree->pathname, 0, &path);
> @@ -899,8 +898,7 @@ int audit_tag_tree(char *old, char *new)
>  
>  		tree = container_of(cursor.next, struct audit_tree, list);
>  		get_tree(tree);
> -		list_del(&cursor);
> -		list_add(&cursor, &tree->list);
> +		list_move(&cursor, &tree->list);
>  		mutex_unlock(&audit_filter_mutex);
>  
>  		err = kern_path(tree->pathname, 0, &path2);
> @@ -925,8 +923,7 @@ int audit_tag_tree(char *old, char *new)
>  		mutex_lock(&audit_filter_mutex);
>  		spin_lock(&hash_lock);
>  		if (!tree->goner) {
> -			list_del(&tree->list);
> -			list_add(&tree->list, &tree_list);
> +			list_move(&tree->list, &tree_list);
>  		}
>  		spin_unlock(&hash_lock);
>  		put_tree(tree);
> @@ -937,8 +934,7 @@ int audit_tag_tree(char *old, char *new)
>  
>  		tree = container_of(barrier.prev, struct audit_tree, list);
>  		get_tree(tree);
> -		list_del(&tree->list);
> -		list_add(&tree->list, &barrier);
> +		list_move(&tree->list, &barrier);
>  		mutex_unlock(&audit_filter_mutex);
>  
>  		if (!failed) {
> 
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

