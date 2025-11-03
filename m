Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B4A3019D6
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Nov 2025 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186237; cv=none; b=FncSi7MoZJZcrhxb5yBjw6zsMXgYFFiXhfh9uO75YRAmW7Zmx27+XUPObpFMqOmZvHtbqxR28ErcRzUALcmgxiCp2FKwLHMCx4RnOI8Su4DoE/agGXDZ+SZLHu/RUoADw+198Cz3BF8oACt5IbrCOxYc4M9PcNX9x54muamMyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186237; c=relaxed/simple;
	bh=hcEECQpZnZYS+rrOjcFLuMdTrw1oSE8F4CuJwKX2TsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M9oNSQhLkUMN70YRV0E0ZdrQPFTIHfsiXEAYTGuxPqb/c2zpI9zY4l9QNyX64nIp6XkJTC/dMO4xqEtrz2miH8fvL2swtZFY8nuNFoucRLBQOZZOLkqeT2r3awJzQw4qokT9/+LR6N7YZgSaa1iqyJyxTOvr7++/jA33LbSSSRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U8lYKAqN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U8lYKAqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762186234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FL9HmwdZD0MRguLtDcdVu1gP15j2MVs0YK7L0sC7zis=;
	b=U8lYKAqNRAvJ3h0aX05uxEbjpUSxwjKvm03iKtD+2cgMF7cM1mRlMEky+DF3oJcCiBhr9K
	1t/mNsBq69BlmtLnOjd5w5FpDkTkt9jiWA4W4hyWfg91k3f+i/nKVjILGcRbhIGEZthPIJ
	Bz4dxZ9DvDVCzeaYk2aVsq8ZM3gmSYs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-298-Ja4YJYB_MMKjHiKZqOES1Q-1; Mon,
 03 Nov 2025 11:10:30 -0500
X-MC-Unique: Ja4YJYB_MMKjHiKZqOES1Q-1
X-Mimecast-MFC-AGG-ID: Ja4YJYB_MMKjHiKZqOES1Q_1762186227
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 565381956095;
	Mon,  3 Nov 2025 16:10:27 +0000 (UTC)
Received: from [10.45.225.163] (unknown [10.45.225.163])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAD571800451;
	Mon,  3 Nov 2025 16:10:23 +0000 (UTC)
Date: Mon, 3 Nov 2025 17:10:15 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>
cc: dm-devel@lists.linux.dev, Alasdair Kergon <agk@redhat.com>, 
    Heinz Mauelshagen <heinzm@redhat.com>, Josef Bacik <jbacik@fb.com>, 
    Mike Snitzer <snitzer@kernel.org>, 
    Ross Zwisler <ross.zwisler@linux.intel.com>, Zach Brown <zab@zabbo.net>, 
    LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
    Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] dm-log-writes: Use pointers from memcpy() calls for
 assignments in two functions
In-Reply-To: <b803a5a1-c2bf-4aad-9527-198e8a8046ca@web.de>
Message-ID: <85eba740-899c-6884-93b4-aa441436db97@redhat.com>
References: <b803a5a1-c2bf-4aad-9527-198e8a8046ca@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi

I think that the code is more readable as it is.

Putting two function calls on one line doesn't make it easier to read.

Mikulas


On Fri, 31 Oct 2025, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 31 Oct 2025 20:20:56 +0100
> 
> A pointer was assigned to a variable in two function implementations.
> The same pointer was used for the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert separate statements into a direct variable assignment for
> the return value from a memory copy action.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/md/dm-log-writes.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
> index 7bb7174f8f4f..b450bdadfaf2 100644
> --- a/drivers/md/dm-log-writes.c
> +++ b/drivers/md/dm-log-writes.c
> @@ -232,8 +232,7 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
>  		goto error;
>  	}
>  
> -	ptr = kmap_local_page(page);
> -	memcpy(ptr, entry, entrylen);
> +	ptr = memcpy(kmap_local_page(page), entry, entrylen);
>  	if (datalen)
>  		memcpy(ptr + entrylen, data, datalen);
>  	memset(ptr + entrylen + datalen, 0,
> @@ -287,8 +286,7 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
>  				goto error_bio;
>  			}
>  
> -			ptr = kmap_local_page(page);
> -			memcpy(ptr, data, pg_datalen);
> +			ptr = memcpy(kmap_local_page(page), data, pg_datalen);
>  			if (pg_sectorlen > pg_datalen)
>  				memset(ptr + pg_datalen, 0, pg_sectorlen - pg_datalen);
>  			kunmap_local(ptr);
> -- 
> 2.51.1
> 

