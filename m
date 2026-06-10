Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557F29D27A
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 19:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120976; cv=none; b=i9ueBU1jyoG+eaI9iFA2ieC9dDt7ShWqJd6/B1hmmdp15Xkft5+bRDbyYvmZKueXtKcJO7kFK1HDefCe9nU6H3bb9iVyiifTJsu29gO/vgnK7mNzhXhImhLU65J6NSjGchEjVwwllIcxDmEYzRbxBzCBxs+iQh3bHTk1kKbF0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120976; c=relaxed/simple;
	bh=qfAkBu9CBvxT9NtRJbH3BabbbnAIvf4Bmlzh+fUXTVs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GLXa31HbOZ8Ps+Td/YnXo+71dxytNdEsKzjCdlLbs/iCDlm8dMI6lIZygith04PSt057m5VDTa9qMKQvJXGE1Ox93Y5b0+NVwVhgQQ0WHLw7DBeq+eLx5G0eWpKVzNMX7YfPhOEkx0/BPoBuMyGRTpWcVIJxurJhteIBCpDF0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hsOTZcqT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hsOTZcqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781120974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPcwgd9pdmoniyDn19ZT13dspqUScVJvEBeANCDWWbw=;
	b=hsOTZcqT8U172x5209tPEe2mm3w8vCFNNX446ByGZ3huUIGPmogRiTu7AI16mx7QysMBCs
	oVbW5M5E2d4Xfvubu+TXO5h4pdHI/cBVK7yEtm3mYCe9oIXcYJO+Xxs7vvjIgmSwv3p2ik
	7R57dXgqU9hj8OLZchajvHzPREKAe2w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-4YuwuNp-MWav9aoqOqJSBQ-1; Wed,
 10 Jun 2026 15:49:33 -0400
X-MC-Unique: 4YuwuNp-MWav9aoqOqJSBQ-1
X-Mimecast-MFC-AGG-ID: 4YuwuNp-MWav9aoqOqJSBQ_1781120972
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D72C1800378;
	Wed, 10 Jun 2026 19:49:32 +0000 (UTC)
Received: from [10.44.48.10] (unknown [10.44.48.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E6BA4180057F;
	Wed, 10 Jun 2026 19:49:29 +0000 (UTC)
Date: Wed, 10 Jun 2026 21:49:24 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>
cc: dm-devel@lists.linux.dev, Alasdair Kergon <agk@redhat.com>, 
    Benjamin Marzinski <bmarzins@redhat.com>, 
    Mike Snitzer <snitzer@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dm: Use common error handling code in three functions
In-Reply-To: <be375668-6d07-4070-9b08-d6445afa324f@web.de>
Message-ID: <d802f7e7-9ed7-e7f9-89c5-19cdc9806367@redhat.com>
References: <be375668-6d07-4070-9b08-d6445afa324f@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93



On Tue, 9 Jun 2026, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 9 Jun 2026 21:54:38 +0200
> 
> Use additional labels so that a bit of exception handling can be better
> reused at the end of three if branches.
> 
> This issue was detected by using the Coccinelle software.

Hi

I think that jumping into a nested block isn't good practice and it makes 
the code harder to read and maintain. I would redo the patches so that 
they jump to the end of the topmost function block, for example:

static struct hash_cell *alloc_cell(const char *name, const char *uuid,
				    struct mapped_device *md)
{
	struct hash_cell *hc;

	hc = kmalloc_obj(*hc);
	if (!hc)
		goto ret;
...
	hc->name = kstrdup(name, GFP_KERNEL);
	if (!hc->name)
		goto free_hc_ret;
...
	hc->uuid = kstrdup(uuid, GFP_KERNEL);
	if (!hc->uuid)
		goto free_hc_name_ret;
	
...
	return hc;

free_hc_name_ret:
	kfree(hc->name);
free_hc_ret:
	kfree(hc);
ret:
	return NULL;
}

Mikulas

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/md/dm-ioctl.c  | 7 +++----
>  drivers/md/dm-raid1.c  | 4 ++--
>  drivers/md/dm-stripe.c | 7 +++----
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> index ac77dc0ca225..9537e60f94c3 100644
> --- a/drivers/md/dm-ioctl.c
> +++ b/drivers/md/dm-ioctl.c
> @@ -227,10 +227,8 @@ static struct hash_cell *alloc_cell(const char *name, const char *uuid,
>  		return NULL;
>  
>  	hc->name = kstrdup(name, GFP_KERNEL);
> -	if (!hc->name) {
> -		kfree(hc);
> -		return NULL;
> -	}
> +	if (!hc->name)
> +		goto free_hc;
>  
>  	if (!uuid)
>  		hc->uuid = NULL;
> @@ -239,6 +237,7 @@ static struct hash_cell *alloc_cell(const char *name, const char *uuid,
>  		hc->uuid = kstrdup(uuid, GFP_KERNEL);
>  		if (!hc->uuid) {
>  			kfree(hc->name);
> +free_hc:
>  			kfree(hc);
>  			return NULL;
>  		}
> diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
> index de5c00704e69..359ca80a67b3 100644
> --- a/drivers/md/dm-raid1.c
> +++ b/drivers/md/dm-raid1.c
> @@ -915,8 +915,7 @@ static struct mirror_set *alloc_context(unsigned int nr_mirrors,
>  	ms->io_client = dm_io_client_create();
>  	if (IS_ERR(ms->io_client)) {
>  		ti->error = "Error creating dm_io client";
> -		kfree(ms);
> -		return NULL;
> +		goto free_ms;
>  	}
>  
>  	ms->rh = dm_region_hash_create(ms, dispatch_bios, wakeup_mirrord,
> @@ -926,6 +925,7 @@ static struct mirror_set *alloc_context(unsigned int nr_mirrors,
>  	if (IS_ERR(ms->rh)) {
>  		ti->error = "Error creating dirty region hash";
>  		dm_io_client_destroy(ms->io_client);
> +free_ms:
>  		kfree(ms);
>  		return NULL;
>  	}
> diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
> index 750865fd3ae7..58fa0badc90f 100644
> --- a/drivers/md/dm-stripe.c
> +++ b/drivers/md/dm-stripe.c
> @@ -148,10 +148,8 @@ static int stripe_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		sc->stripes_shift = __ffs(stripes);
>  
>  	r = dm_set_target_max_io_len(ti, chunk_size);
> -	if (r) {
> -		kfree(sc);
> -		return r;
> -	}
> +	if (r)
> +		goto free_sc;
>  
>  	ti->num_flush_bios = stripes;
>  	ti->num_discard_bios = stripes;
> @@ -176,6 +174,7 @@ static int stripe_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  			ti->error = "Couldn't parse stripe destination";
>  			while (i--)
>  				dm_put_device(ti, sc->stripe[i].dev);
> +free_sc:
>  			kfree(sc);
>  			return r;
>  		}
> -- 
> 2.54.0
> 

