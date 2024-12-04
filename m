Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A615323919E
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Dec 2024 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339010; cv=none; b=QNOaa0ibGtT39LTCbW21tYVsmGwPtGSy2GT1DBUpdTkRC+AkhynfljgkX9hZ5IlCXNA/mfIgLhTsEnBFKyCQCs8egQ2MPims4EjF1LFQ4xUFlHsxDc+oTUquV5bnwzDXtJbB0b5i+F4WgmivwtVF+sWDMuXsJzKzvDvdnhynONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339010; c=relaxed/simple;
	bh=3Z4dOJDsq2U+x9KILDCrBH0XCKmJzb5fADQbCJKued0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=K9EV8+Gsk9A9/3FHoXqSm88OCgFJFBZUQFGdEa06wZn4SPZMKPhX1+PhEgLKvQYUdG9h0hdYjv4h4hR5TFAKcnorqcblti4jw+dYu7OpJFjdiDuOU3y5d4CVyTr8XgwArj91ybQ8FBiV6ItlK5hudSpDY4o1y/j5aJsQU/Dq9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FCA7iaTb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FCA7iaTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733339007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=atHTY7IWU/YS4OJ1wCzFH6IlRbbStHEqvPU49S0UYoA=;
	b=FCA7iaTbRajlEDxQHZXjzSyYEMWUhHwDMb0MRTmkHysYtKfBcFTwu3ooixyK6A6xaw3m7b
	8+YTWPjraX2CQocB02PoDS5zj1VbfSaEmXSptn+v5GX7OR9pVADICeJaoueIXBI9jxIZcM
	U67IMOaj2XcVRfEEi8Da6xV0WSbZfLE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-kNeIQh6zOW2gVTasjQz6QA-1; Wed,
 04 Dec 2024 14:03:26 -0500
X-MC-Unique: kNeIQh6zOW2gVTasjQz6QA-1
X-Mimecast-MFC-AGG-ID: kNeIQh6zOW2gVTasjQz6QA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A96E61954AFF;
	Wed,  4 Dec 2024 19:03:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.48])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D7A031954200;
	Wed,  4 Dec 2024 19:03:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20241204151200.399599-1-colin.i.king@gmail.com>
References: <20241204151200.399599-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: dhowells@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
    linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] afs: remove redudant use of variable ret in afs_dir_iterate_contents
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1399908.1733339000.1@warthog.procyon.org.uk>
Date: Wed, 04 Dec 2024 19:03:20 +0000
Message-ID: <1399909.1733339000@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Colin Ian King <colin.i.king@gmail.com> wrote:

> The variable ret is being initialized with 0 and is never re-assigned.
> At the end of the function the check for ret being set to -ESTALE
> is always false, so the check and the call to afs_invalidate_dir is
> redundant. Remove ret and this check and just return 0 at the end
> of the function.

This is the wrong thing to do.  We need to get the error out.  I'm fixing my
patch to do that.

Thanks,
David

