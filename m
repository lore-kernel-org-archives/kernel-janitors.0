Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5YLMzzR"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9A1CB
	for <kernel-janitors@vger.kernel.org>; Sun, 26 Nov 2023 17:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701049446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Bvi0onyKrPRy//cmVZxUGyJ/FKofWO2WQpLW2x6wuY=;
	b=D5YLMzzR0+bvlzkyds3sD5xHZjUmQ6JYMPFo6Vw84cJ0tKXquRVhIwkQqBCE6MXY0KvOpw
	I1+ZjbIjp24to5/PKSvdQ7LfvuOqizJDTiOdB6htl1wT0AHk78tDdhH4xkcbfohfjWNe0d
	ashOMIH95HXVx1CBEXnzOXsw2JCGQaE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-lnm--71tMcKb3DPHjxvYDA-1; Sun, 26 Nov 2023 20:44:04 -0500
X-MC-Unique: lnm--71tMcKb3DPHjxvYDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F717811E8D;
	Mon, 27 Nov 2023 01:44:03 +0000 (UTC)
Received: from [10.22.32.84] (unknown [10.22.32.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42F231121307;
	Mon, 27 Nov 2023 01:44:03 +0000 (UTC)
Message-ID: <29e6d420-2d23-4631-bb45-a5de6a5f485b@redhat.com>
Date: Sun, 26 Nov 2023 20:44:03 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add include/linux/lockdep*.h
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <e722abd043e5de64d2acd28d581e4a952994a94e.1700989248.git.christophe.jaillet@wanadoo.fr>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <e722abd043e5de64d2acd28d581e4a952994a94e.1700989248.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3


On 11/26/23 04:00, Christophe JAILLET wrote:
> Have lockdep_api.h and lockdep_types.h match as well.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2b2cd60eb20..2a1480051583 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12492,7 +12492,7 @@ S:	Maintained
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
>   F:	Documentation/locking/
>   F:	arch/*/include/asm/spinlock*.h
> -F:	include/linux/lockdep.h
> +F:	include/linux/lockdep*.h
>   F:	include/linux/mutex*.h
>   F:	include/linux/rwlock*.h
>   F:	include/linux/rwsem*.h
Acked-by: Waiman Long <longman@redhat.com>

