Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178B4D58A
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Po2SxdMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704913306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pJpTNHjkrdudfIITkK7u4W2zrdtA79u2wxg+UQ854QE=;
	b=Po2SxdMGDjgiuVJRRl88FoInPWSv991bkbL2eQKpcT47pRJLR7VxqMwDPyYjl6qEcfZucv
	sLeHg0Wlr8+QzJZpEsv5OthxxrxOqxeLOcy5xUytEpV8x6zxUMUzlJxWEUD4YIWR0iRQF7
	gQnYW9gVd74zbeSerTqkjYNT4Q1gZDA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-GkCjAoSgOlOd9KvahLP1FQ-1; Wed,
 10 Jan 2024 14:01:42 -0500
X-MC-Unique: GkCjAoSgOlOd9KvahLP1FQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 270511C060E2;
	Wed, 10 Jan 2024 19:01:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 395822026F95;
	Wed, 10 Jan 2024 19:01:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <9872f991-56a8-4915-b9b0-53accd6db0ef@moroto.mountain>
References: <9872f991-56a8-4915-b9b0-53accd6db0ef@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] netfs, fscache: Prevent Oops in fscache_put_cache()
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1788107.1704913300.1@warthog.procyon.org.uk>
Date: Wed, 10 Jan 2024 19:01:40 +0000
Message-ID: <1788108.1704913300@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Dan Carpenter <dan.carpenter@linaro.org> wrote:

>  	zero = __refcount_dec_and_test(&cache->ref, &ref);
> -	trace_fscache_cache(debug_id, ref - 1, where);
> +	trace_fscache_cache(cache->debug_id, ref - 1, where);

You can't do that if !zero.  cache may be deallocated between the two lines.

David

