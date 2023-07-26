Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1C5C001DE
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Jul 2023 05:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjGZF5c (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Jul 2023 01:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjGZF51 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Jul 2023 01:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E5B26BB
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Jul 2023 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690350998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cCdtovwVGt1zGQDulnNlAkJ36m7TNP783WWClrPi0Zk=;
        b=UFGvau/0GEwfHptkPxQQRx8kP5sKmweNAVm54Twkg5c02SSOzgdNWeWRkEf5pE39UZrNCB
        ZzkXnkqBle5G+H+RzjMCwG0m5w881lvCt2+yA4dwOQL79L+pNmjlSrMnthUy0cRVds9o+w
        6ZnLpnoaQmyKgL847oI2Esgac3n2sZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-680-95vf44wnPFeaXlb7Y-rxNw-1; Wed, 26 Jul 2023 01:56:34 -0400
X-MC-Unique: 95vf44wnPFeaXlb7Y-rxNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85523830EFC;
        Wed, 26 Jul 2023 05:56:33 +0000 (UTC)
Received: from localhost (ovpn-12-99.pek2.redhat.com [10.72.12.99])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D183246A3A7;
        Wed, 26 Jul 2023 05:56:32 +0000 (UTC)
Date:   Wed, 26 Jul 2023 13:56:29 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Vivek Goyal <vgoyal@redhat.com>, akpm@linux-foundation.org,
        Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] proc/vmcore: fix signedness bug in read_from_oldmem()
Message-ID: <ZMC1jU7ywPGt1QmO@MiWiFi-R3L-srv>
References: <b55f7eed-1c65-4adc-95d1-6c7c65a54a6e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b55f7eed-1c65-4adc-95d1-6c7c65a54a6e@moroto.mountain>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 07/25/23 at 08:03pm, Dan Carpenter wrote:
> The bug is the error handling:
> 
> 	if (tmp < nr_bytes) {
> 
> "tmp" can hold negative error codes but because "nr_bytes" is type
> size_t the negative error codes are treated as very high positive
> values (success).  Fix this by changing "nr_bytes" to type ssize_t.  The
> "nr_bytes" variable is used to store values between 1 and PAGE_SIZE and
> they can fit in ssize_t without any issue.
> 
> Fixes: 5d8de293c224 ("vmcore: convert copy_oldmem_page() to take an iov_iter")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/proc/vmcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
> index cb80a7703d58..1fb213f379a5 100644
> --- a/fs/proc/vmcore.c
> +++ b/fs/proc/vmcore.c
> @@ -132,7 +132,7 @@ ssize_t read_from_oldmem(struct iov_iter *iter, size_t count,
>  			 u64 *ppos, bool encrypted)
>  {
>  	unsigned long pfn, offset;
> -	size_t nr_bytes;
> +	ssize_t nr_bytes;
>  	ssize_t read = 0, tmp;
>  	int idx;

Thanks for this fix. Just curious, this is found out by code exploring,
or any breaking?

Acked-by: Baoquan He <bhe@redhat.com>

