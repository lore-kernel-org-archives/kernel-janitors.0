Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071E1A5B8B
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Dec 2025 02:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765764814; cv=none; b=LPMrhcd3ZQURAQlg+ftJxi7vIDIKMToGL4HL9Btv9tk/Y4y7mQATefYb8K+Rt+u41uFkB2OKgOxKKVIDVv5/yWpZwqcX7ljz1g6vCI7xCwGEI24up3Rya3/l9td4ki+prDY8dFmacppJUSshT01YnDAsVwrgh5ZSR1R/ujYV61I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765764814; c=relaxed/simple;
	bh=RaSR0/tr6XAA6Ns28mGYHuWCNVbUc3tQZsg5/Ae9Cuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOC69DgyT0GRERv8IYZAa3efuMJ5Xs+Q+m5vlnU7bybxsucjJL6UGOOumDvxbrHo3oOLvUxPsxIeLqMV/mzQtJFj8njyxPjeEur7XE5D1ue+/4t/P+Og4+i72zHlWMF3gsQUMzWiQs5OSGNqarFJgPnzmRW4L4kTdAz5bthhRgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jIx5U4mt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jIx5U4mt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765764811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYycTAAbDWrCDfyhapYRbhXvfMQh9O9/yE26ZBKxBs0=;
	b=jIx5U4mt6a7/PZ5fxh6EGV6ierbxQsaEkIu4QIfY4a41TjhgX8itcOIaw+kraBUqEHB022
	Jxyu8+BRQc/jIWe0tq2jED2wFYHgn4RXclm0aXXmjAwbY7+B7eUiKpsiKSjCnD6pWZd0bd
	201rmESWgWEJZuFGzK0UM5eetIZdZJQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-bUZ6CqMcNGKZvxewYcFLXg-1; Sun,
 14 Dec 2025 21:13:29 -0500
X-MC-Unique: bUZ6CqMcNGKZvxewYcFLXg-1
X-Mimecast-MFC-AGG-ID: bUZ6CqMcNGKZvxewYcFLXg_1765764808
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80ECD1956054;
	Mon, 15 Dec 2025 02:13:27 +0000 (UTC)
Received: from localhost (unknown [10.72.112.95])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE9CF1953984;
	Mon, 15 Dec 2025 02:13:25 +0000 (UTC)
Date: Mon, 15 Dec 2025 10:13:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, coxu@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH] crash_dump: Constify struct configfs_item_operations and
 configfs_group_operations
Message-ID: <aT9uwXK8XFdXei/L@MiWiFi-R3L-srv>
References: <d046ee5666d2f6b1a48ca1a222dfbd2f7c44462f.1765735035.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d046ee5666d2f6b1a48ca1a222dfbd2f7c44462f.1765735035.git.christophe.jaillet@wanadoo.fr>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 12/14/25 at 06:57pm, Christophe JAILLET wrote:
> 'struct configfs_item_operations' and 'configfs_group_operations' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   16339	  11001	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   16499	  10841	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Sounds not bad, leave this to Coiby to test.

> ---
> Compile tested only.
> 
> This change is possible since commits f2f36500a63b and f7f78098690d.

I don't follow here, why do these two commits have anything with this
patch?

> ---
>  kernel/crash_dump_dm_crypt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index 401423ba477d..0d23dc1de67c 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -223,7 +223,7 @@ static void config_key_release(struct config_item *item)
>  	key_count--;
>  }
>  
> -static struct configfs_item_operations config_key_item_ops = {
> +static const struct configfs_item_operations config_key_item_ops = {
>  	.release = config_key_release,
>  };
>  
> @@ -298,7 +298,7 @@ static struct configfs_attribute *config_keys_attrs[] = {
>   * Note that, since no extra work is required on ->drop_item(),
>   * no ->drop_item() is provided.
>   */
> -static struct configfs_group_operations config_keys_group_ops = {
> +static const struct configfs_group_operations config_keys_group_ops = {
>  	.make_item = config_keys_make_item,
>  };
>  
> -- 
> 2.52.0
> 
> 

