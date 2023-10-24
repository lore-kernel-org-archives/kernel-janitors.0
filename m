Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AC5C25B67
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 02:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjJXCYf convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 22:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjJXCYe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 22:24:34 -0400
X-Greylist: delayed 463 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 Oct 2023 19:24:32 PDT
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CEDDA
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 19:24:32 -0700 (PDT)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay10.hostedemail.com (Postfix) with ESMTP id 6FFEFC09BB;
        Tue, 24 Oct 2023 02:16:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 6C92F2002D;
        Tue, 24 Oct 2023 02:16:46 +0000 (UTC)
Message-ID: <ea3266f0f09bd6c94ee14eba26996a8cdad953b4.camel@perches.com>
Subject: Re: KTODO automated TODO lists
From:   Joe Perches <joe@perches.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev
Cc:     outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Date:   Mon, 23 Oct 2023 19:16:45 -0700
In-Reply-To: <9e0dc452-c4fe-4511-83fe-a1e356bd5438@embeddedor.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
         <9e0dc452-c4fe-4511-83fe-a1e356bd5438@embeddedor.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6C92F2002D
X-Rspamd-Server: rspamout02
X-Stat-Signature: pqe3j5ry7cundzgutfksgdpeiuqu18d1
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+SHiKi9GwP/4WHdk/t2B0jTo+S/Jrwybg=
X-HE-Tag: 1698113806-995776
X-HE-Meta: U2FsdGVkX1/nIUuuJO8aUmXqc4xz22OZbk8WUG3kczmA4NPXcIzzs10KFeeQ2trGYQL5Sa0enBLZ7A6InmJzJgWsDKhn/Ujdf4Hz8+sogpSgt0F4su+FHcR+LOSkoPrSxTK3zZvEiINF5i5dCOMm7T5cW5PKL4j4mdVi5bq61PrJu0/xWpjUVSkPfxsbw78/PMF2Kr5jY2jPujxgqFNvJDXkprh9+JfYQvAsdjs6RTaQynmNOfdYSEt8fYGZXBIdiDocQDBs6hSNhEwLbvVGKGrCakHbMRgnV+mO59TSk+8agSe+dayKVtKaxEdz+He49eK7KQwbC7F1eYjXfvB1kim0pAvRT21OAm/q6rUkbTZXFGo7ci1hCYpvEnG1MKeF
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2023-10-23 at 17:38 -0600, Gustavo A. R. Silva wrote:
> We have tons of issues waiting to be audited and fixed here:
> 
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You will never run out of fun. :) People just need to sign up.

IMO: People should not need to sign up.

