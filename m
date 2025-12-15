Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C02F60CB
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Dec 2025 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791970; cv=none; b=ZU90cXjlk+kuxnTjCSO2zDI634skFp1QsdIOFnQIoeSl9HqLFs4kmDLHQQaK4M6whOR2BufyF3PAnDw3oDQ7j5fn8bq1i1N8NVdLuIkF9kzN5ryr7SNPB6IBzGoaeLmjV/G7kQ3AyWOPhVfOm6cdWTMKd++cFz2JsEQxbD530vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791970; c=relaxed/simple;
	bh=O8kp7KeDGrS5MqVHvKtrJtm16JqmYGDsHKfZ8siI2m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zd7uQ2UVQEiRBq/OXUB9vQVTawayNJl1ahz/4OFToeERVo3aAx1L+HT5Y1WPcpya7wRK1kTiSXncGMF1+UGE7iU3Muxr1oNtZ4zAYb1tOIwcetZOjGm2ACzROsD+3GaIqM8x6lRIoxJE+R9LqsYSWrN6DfRsTyuD303om+Rqpqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FXZhbtpX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FXZhbtpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765791963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6JuG3oC6UyZ6UYfFXXU2BOdbDcpLEkG2dlhV74t068=;
	b=FXZhbtpX8bwmIAuxm0MjltxbJM1TGGAdOiWjU9rg3lfm6+ZQ34Z718yftUQgr1p7Y4/OOp
	dqk9Ti7m+/huI5rU7l7DSzXehjVlviTlFr2lob7dPeIo6dNXs97x7LJFLDM2iy9fbvHKR6
	UFg4YPIk81/XqPATyewcKaXfJ+Wtpz8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-XQ5UHsUTOs6KeEbIa0Ilig-1; Mon,
 15 Dec 2025 04:46:01 -0500
X-MC-Unique: XQ5UHsUTOs6KeEbIa0Ilig-1
X-Mimecast-MFC-AGG-ID: XQ5UHsUTOs6KeEbIa0Ilig_1765791960
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A812C180062E;
	Mon, 15 Dec 2025 09:45:59 +0000 (UTC)
Received: from localhost (unknown [10.72.112.95])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF45919560A7;
	Mon, 15 Dec 2025 09:45:57 +0000 (UTC)
Date: Mon, 15 Dec 2025 17:45:53 +0800
From: Baoquan He <bhe@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: coxu@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH] crash_dump: Constify struct configfs_item_operations and
 configfs_group_operations
Message-ID: <aT/Y0UjrIdij7f5X@MiWiFi-R3L-srv>
References: <d046ee5666d2f6b1a48ca1a222dfbd2f7c44462f.1765735035.git.christophe.jaillet@wanadoo.fr>
 <aT9uwXK8XFdXei/L@MiWiFi-R3L-srv>
 <b1c7b612-5c5e-4234-9aa5-a83105d01c52@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1c7b612-5c5e-4234-9aa5-a83105d01c52@wanadoo.fr>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 12/15/25 at 08:19am, Christophe JAILLET wrote:
> Le 15/12/2025 à 03:13, Baoquan He a écrit :
> > On 12/14/25 at 06:57pm, Christophe JAILLET wrote:
> > > 'struct configfs_item_operations' and 'configfs_group_operations' are not
> > > modified in this driver.
> > > 
> > > Constifying these structures moves some data to a read-only section, so
> > > increases overall security, especially when the structure holds some
> > > function pointers.
> > > 
> > > On a x86_64, with allmodconfig, as an example:
> > > Before:
> > > ======
> > >     text	   data	    bss	    dec	    hex	filename
> > >    16339	  11001	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
> > > 
> > > After:
> > > =====
> > >     text	   data	    bss	    dec	    hex	filename
> > >    16499	  10841	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
> > > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > 
> > Sounds not bad, leave this to Coiby to test.
> > 
> > > ---
> > > Compile tested only.
> > > 
> > > This change is possible since commits f2f36500a63b and f7f78098690d.
> > 
> > I don't follow here, why do these two commits have anything with this
> > patch?
> 
> Without these patches, it won't compile because "struct config_item_type"
> needs to be tweaked to accept some const field. It is what is done by these
> patches that have landed 2 weeks ago or so.
> 
> 
> Without these 2 commits, you would get (with French messages, sorry):
> 
>   CC      kernel/crash_dump_dm_crypt.o
> kernel/crash_dump_dm_crypt.c:231:24: erreur: l'initialisation abandonne le
> qualificatif « const » du type pointé [-Werror=discarded-qualifiers]
>   231 |         .ct_item_ops = &config_key_item_ops,
>       |                        ^
> kernel/crash_dump_dm_crypt.c:306:25: erreur: l'initialisation abandonne le
> qualificatif « const » du type pointé [-Werror=discarded-qualifiers]
>   306 |         .ct_group_ops = &config_keys_group_ops,
>       |                         ^

Ah, I see now. Thanks for the information.

> 
> > 
> > > ---
> > >   kernel/crash_dump_dm_crypt.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> > > index 401423ba477d..0d23dc1de67c 100644
> > > --- a/kernel/crash_dump_dm_crypt.c
> > > +++ b/kernel/crash_dump_dm_crypt.c
> > > @@ -223,7 +223,7 @@ static void config_key_release(struct config_item *item)
> > >   	key_count--;
> > >   }
> > > -static struct configfs_item_operations config_key_item_ops = {
> > > +static const struct configfs_item_operations config_key_item_ops = {
> > >   	.release = config_key_release,
> > >   };
> > > @@ -298,7 +298,7 @@ static struct configfs_attribute *config_keys_attrs[] = {
> > >    * Note that, since no extra work is required on ->drop_item(),
> > >    * no ->drop_item() is provided.
> > >    */
> > > -static struct configfs_group_operations config_keys_group_ops = {
> > > +static const struct configfs_group_operations config_keys_group_ops = {
> > >   	.make_item = config_keys_make_item,
> > >   };
> > > -- 
> > > 2.52.0
> > > 
> > > 
> > 
> > 
> > 
> 

