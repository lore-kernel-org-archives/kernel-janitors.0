Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA27BB00
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522528; cv=none; b=pigrXeTT0CU4L5vkf/75oP7OpVuLRQDQPCvmqRuHdpFcOLySoPGDKWWuA04NVaXKjBbIAMmG/Icm7Rn7HVi7axhU1ZIyzUMEUuv3kBTp9QeNzsrMqqebK5eySQHlqK7QKIwETXP47ASTg+9DrOuVV02/zY0LFdknixGZ5Fo5/6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522528; c=relaxed/simple;
	bh=aHbuQtkQc7j/3wUDl5g8D0p6bowESyQfshtkj1PQnKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH7DdONoBonykRzLqid3yUk/46PLLkyqV/Od3qI/pew5wIE1UoC5nR2FKYudkRMnGEiJwPGg1LUzF7lOk7gco18ikTFrrce4lUMyDDGyw+vBqdqYlMykLBN2B7UcOwYL3mz52TKQC+rZRI8bsLOM6KTNR3K6527ShEY8KCqVlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MAsZo3YA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MAsZo3YA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708522525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KUGTjfCB/0L8+aS9L44bC5nmdvFIq/qccvpGMI5yZOo=;
	b=MAsZo3YAEn4I3cLVfl4XKaf0SQuPrYUMLAYLtQOiV1SSqML0rRbEfuYZn+E/MZHAQMeaxJ
	0/Lg9YdTSfrVbQwNnbONFz+KjgOjccV0afHWIYYNP6bVbyX8QKGCi6Y+xdZcpGWvKMg5nf
	+g9U8RrY959mtyhdIxmXRW49tC1pJ2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-UGqS_xFdMvmHoCUPoilQKg-1; Wed, 21 Feb 2024 08:35:24 -0500
X-MC-Unique: UGqS_xFdMvmHoCUPoilQKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C838859708;
	Wed, 21 Feb 2024 13:35:23 +0000 (UTC)
Received: from bfoster (unknown [10.22.32.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 635BC40C94A7;
	Wed, 21 Feb 2024 13:35:23 +0000 (UTC)
Date: Wed, 21 Feb 2024 08:37:05 -0500
From: Brian Foster <bfoster@redhat.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bcachefs: remove redundant assignment to variable
 ret
Message-ID: <ZdX8gTpgqyM/jjvp@bfoster>
References: <20240221115203.3413554-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221115203.3413554-1-colin.i.king@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

On Wed, Feb 21, 2024 at 11:52:03AM +0000, Colin Ian King wrote:
> Variable ret is being assigned a value that is never read, it is
> being re-assigned a couple of statements later on. The assignment
> is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> fs/bcachefs/super-io.c:806:2: warning: Value stored to 'ret' is
> never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Brian Foster <bfoster@redhat.com>

>  fs/bcachefs/super-io.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/bcachefs/super-io.c b/fs/bcachefs/super-io.c
> index 110dcb0337ce..c6d590404425 100644
> --- a/fs/bcachefs/super-io.c
> +++ b/fs/bcachefs/super-io.c
> @@ -804,7 +804,6 @@ static int __bch2_read_super(const char *path, struct bch_opts *opts,
>  		goto err;
>  	}
>  
> -	ret = 0;
>  	sb->have_layout = true;
>  
>  	ret = bch2_sb_validate(sb, &err, READ);
> -- 
> 2.39.2
> 

