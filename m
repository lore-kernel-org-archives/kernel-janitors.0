Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C22C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Dec 2021 17:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236781AbhLNR56 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Dec 2021 12:57:58 -0500
Received: from ciao.gmane.io ([116.202.254.214]:37248 "EHLO ciao.gmane.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236731AbhLNR55 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Dec 2021 12:57:57 -0500
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1mxC3l-0001xO-LP
        for kernel-janitors@vger.kernel.org; Tue, 14 Dec 2021 18:57:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] xen-blkfront: Use the bitmap API when applicable
Date:   Tue, 14 Dec 2021 18:57:48 +0100
Message-ID: <14dbcf69-afc1-c11b-e1ad-e8453a80cc6e@wanadoo.fr>
References: <d6f31db1d2542e1b4ba66d4cea80d3891678aa5a.1638476031.git.christophe.jaillet@wanadoo.fr>
 <Ybh5G2ziyRXkz3WF@Air-de-Roger> <Ybh7KgtQt0/MFtyw@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <Ybh7KgtQt0/MFtyw@Air-de-Roger>
Content-Language: en-US
Cc:     xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20211214175748.1djsNaxy8AvaXD2OjRsl7hRiXdQy3CmQDI-p_WchnLc@z>

Le 14/12/2021 à 12:08, Roger Pau Monné a écrit :
> On Tue, Dec 14, 2021 at 11:59:39AM +0100, Roger Pau Monné wrote:
>> On Thu, Dec 02, 2021 at 09:16:04PM +0100, Christophe JAILLET wrote:
>>> Use 'bitmap_zalloc()' to simplify code, improve the semantic and avoid some
>>> open-coded arithmetic in allocator arguments.
>>>
>>> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
>>> consistency.
>>>
>>> Use 'bitmap_copy()' to avoid an explicit 'memcpy()'
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Oh, I see there's been further discussion on this to avoid relying
> implicitly on the size of the bitmap being rounded to the size of an
> unsigned long. I think a new version is expected then?
> 
> Thanks, Roger.
> 

Yes, I'll send a patch in order to add a 'bitmap_size()'
I'll update this patch when/if it is merged.

You can drop it for now.

CJ

