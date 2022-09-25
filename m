Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7589CC54EE9
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Sep 2022 14:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbiIYO4X (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 25 Sep 2022 10:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiIYO4W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Sep 2022 10:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650972CC87
        for <kernel-janitors@vger.kernel.org>; Sun, 25 Sep 2022 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664117777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9wAMf4g97GMPZ/zZY9HnOUGLwVYUmgjVUMe6QXv7bsg=;
        b=HUO1Ckhlc9RRyPeXxcKeLhm3tUqUWimKLAimbE/3XbojZYUZzSy7Y9ZWKq2fEBfcMyhPXz
        dZkyTMs+7gApk9oLUV8qSPiyX+HwQKOLVo9Bj/Khs61GmfgFEG6OZsLPU1JgnQlILF7w3A
        /ZMAf4V6alPFgCNiEy5ARK8NBThDRg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Tmj6sBDQNK6DiF7a-0c5Mg-1; Sun, 25 Sep 2022 10:56:12 -0400
X-MC-Unique: Tmj6sBDQNK6DiF7a-0c5Mg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E3711C05143;
        Sun, 25 Sep 2022 14:56:12 +0000 (UTC)
Received: from [10.22.32.91] (unknown [10.22.32.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2D50A492B04;
        Sun, 25 Sep 2022 14:56:11 +0000 (UTC)
Message-ID: <0a715ca2-0348-454a-1f49-1c4e6851346f@redhat.com>
Date:   Sun, 25 Sep 2022 10:56:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] locking/lock_events: Fix license version
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Davidlohr Bueso <dbueso@suse.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Peter Zijlstra <a.p.zijlstra@chello.nl>,
        Ingo Molnar <mingo@kernel.org>
References: <a57505bf6c8ddbd68ff5a320aaf5922ec431e00e.1664117249.git.christophe.jaillet@wanadoo.fr>
From:   Waiman Long <longman@redhat.com>
In-Reply-To: <a57505bf6c8ddbd68ff5a320aaf5922ec431e00e.1664117249.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/25/22 10:47, Christophe JAILLET wrote:
> SPDX-License-Identifier is GPL-2.0, but the license text states "either
> version 2 of the License, or (at your option) any later version."
>
> So update the SPDX-License-Identifier to GPL-2.0-or-later.
>
> Remove the license text as well. It is useless now.
>
> Fixes: ad53fa10fa9e ("locking/qspinlock_stat: Introduce generic lockevent_*() counting APIs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   kernel/locking/lock_events.h      | 12 +-----------
>   kernel/locking/lock_events_list.h | 12 +-----------
>   2 files changed, 2 insertions(+), 22 deletions(-)
>
> diff --git a/kernel/locking/lock_events.h b/kernel/locking/lock_events.h
> index 8c7e7d25f09c..ba17c5be3c2b 100644
> --- a/kernel/locking/lock_events.h
> +++ b/kernel/locking/lock_events.h
> @@ -1,15 +1,5 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>   /*
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
>    * Authors: Waiman Long <longman@redhat.com>
>    */
>   
> diff --git a/kernel/locking/lock_events_list.h b/kernel/locking/lock_events_list.h
> index 97fb6f3f840a..7430ecd1fbc6 100644
> --- a/kernel/locking/lock_events_list.h
> +++ b/kernel/locking/lock_events_list.h
> @@ -1,15 +1,5 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>   /*
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
>    * Authors: Waiman Long <longman@redhat.com>
>    */
>   
Acked-by: Waiman Long <longman@redhat.com>

