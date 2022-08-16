Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561C0C2BB41
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Aug 2022 09:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbiHPJvH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Aug 2022 05:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbiHPJuj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Aug 2022 05:50:39 -0400
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D29103C65
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Aug 2022 01:12:44 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id NrgXoquoiGDTnNrgXo13bw; Tue, 16 Aug 2022 10:12:26 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 16 Aug 2022 10:12:26 +0200
X-ME-IP: 90.11.190.129
Message-ID: <b6025226-4fcd-1d82-60eb-301734cc8e5a@wanadoo.fr>
Date:   Tue, 16 Aug 2022 10:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] scsi: target: Save a few cycles in
 transport_lookup_[cmd|tmr]_lun()
Content-Language: en-US
To:     Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "michael.christie@oracle.com" <michael.christie@oracle.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
References: <03705222390bfa3b48ad7658f693fc0fc030b3ae.1660596679.git.christophe.jaillet@wanadoo.fr>
 <757f1326-bc70-aa93-b2d3-dfd91698406e@nvidia.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <757f1326-bc70-aa93-b2d3-dfd91698406e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Le 16/08/2022 à 08:06, Chaitanya Kulkarni a écrit :
> On 8/15/22 13:52, Christophe JAILLET wrote:
>> Use percpu_ref_tryget_live_rcu() instead of percpu_ref_tryget_live() to
>> save a few cycles when it is known that the rcu lock is already
>> taken/released.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
> do you have a quantitative data that shows actual savings of cycles?
>
> -ck
>

Some numbers were given for io_uring by the one who introduced 
percpu_ref_tryget_live_rcu().

See [1].

I don't have specific numbers for the patch against scsi.

CJ


[1]: 
https://lore.kernel.org/linux-kernel/cover.1634822969.git.asml.silence@gmail.com/

