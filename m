Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFCAC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 10:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbiEWKeA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 06:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234113AbiEWKd6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 06:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC91D4C420
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653302034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=78ac/DMFK1OOmwHWGMBq2QKTWVFTkeD18ihAxO0CrpU=;
        b=SlxOBM61onEZ3pptYfoSnJD7EHTTNpAMrINKtYIDKj3K0Euhnn1YMxt0IWJCTn6K7qkPoO
        mdgu84825dI7GnodIEGgqDl3N9OgxaKUriE5qnegMLJrNMkQwWUK1MY47hoN9qmtLuYRoQ
        t+tYJ/AW2hExFBM213VbsJXFxwOu8hg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-h_aPD7XgP7CKh-y_9MniQg-1; Mon, 23 May 2022 06:33:53 -0400
X-MC-Unique: h_aPD7XgP7CKh-y_9MniQg-1
Received: by mail-qk1-f197.google.com with SMTP id p13-20020a05620a132d00b006a362041049so4580969qkj.0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=78ac/DMFK1OOmwHWGMBq2QKTWVFTkeD18ihAxO0CrpU=;
        b=pQvpQNhdyNAyLnlz64BDcYV1fV3pSQLmWf/k9Euhq/9ZOIYtFmE+xK6D8jPgXKPwUW
         MlmM1HIVkua8M/TRIgCECRFMhKDTimShbmFCaZDzF9qcTkAeNNqrE7fimAdI4caTwQej
         BcOam6WHofU3WCiKxB6rM69X1t05E8E42tKZLbvsccJkVXw67lKPDHm1Fkz/hD9sllXk
         B4GzX/gMEFObSnq/GzOWNix9a05QnyzkSkTQdY6pbkUbAtlrUn5TYDsrFDiKTHtKF4AO
         ua3tFOrsGp9YpehjFE+UDYB8B4tSCUvM+pCQ/SS8I1r9C1zvtbsDdackdmFXzPWpYMIF
         EDMw==
X-Gm-Message-State: AOAM5339SlXey26DePnYp59YPnAz59NxKkatJaUJYcYcf4j4ys6L3+sO
        O88tfUln7vScfGOdmw+LWvKIoj/PSIjX5ONabrbxVw6BJuYkLqme/DNYkW216ABXsxxnDQAcuiV
        fgY4FPM2GjFAziYkh2QqY3LbslMrQ
X-Received: by 2002:a05:6214:d03:b0:462:344c:554a with SMTP id 3-20020a0562140d0300b00462344c554amr4410758qvh.104.1653302032784;
        Mon, 23 May 2022 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOhcME+iqnGQ+8oMBw4rB9qB1dqWoT+TKPGVVrDkWiFqKYa95gJvT8iPBruG4tBG4TJqmtkQ==
X-Received: by 2002:a05:6214:d03:b0:462:344c:554a with SMTP id 3-20020a0562140d0300b00462344c554amr4410748qvh.104.1653302032604;
        Mon, 23 May 2022 03:33:52 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-16.business.telecomitalia.it. [87.12.25.16])
        by smtp.gmail.com with ESMTPSA id k14-20020a37a10e000000b0069fc13ce1f7sm4263939qke.40.2022.05.23.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 03:33:51 -0700 (PDT)
Date:   Mon, 23 May 2022 12:33:45 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
        netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Gautam Dawar <gautam.dawar@xilinx.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] vhost-vdpa: Fix some error handling path in
 vhost_vdpa_process_iotlb_msg()
Message-ID: <20220523103345.6jf3r5e3ox5uvmk4@sgarzare-redhat>
References: <89ef0ae4c26ac3cfa440c71e97e392dcb328ac1b.1653227924.git.christophe.jaillet@wanadoo.fr>
 <CACGkMEtvgL+MxBmhWZ-Hn-QjfS-MBm7gvLoQHhazOiwrLxxUJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACGkMEtvgL+MxBmhWZ-Hn-QjfS-MBm7gvLoQHhazOiwrLxxUJA@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 23, 2022 at 12:41:03PM +0800, Jason Wang wrote:
>On Sun, May 22, 2022 at 9:59 PM Christophe JAILLET
><christophe.jaillet@wanadoo.fr> wrote:
>>
>> In the error paths introduced by the commit in the Fixes tag, a mutex may
>> be left locked.
>> Add the correct goto instead of a direct return.
>>
>> Fixes: a1468175bb17 ("vhost-vdpa: support ASID based IOTLB API")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> WARNING: This patch only fixes the goto vs return mix-up in this function.
>> However, the 2nd hunk looks really spurious to me. I think that the:
>> -               return -EINVAL;
>> +               r = -EINVAL;
>> +               goto unlock;
>> should be done only in the 'if (!iotlb)' block.
>
>It should be fine, the error happen if
>
>1) the batched ASID based request is not equal (the first if)
>2) there's no IOTLB for this ASID (the second if)
>
>But I agree the code could be tweaked to use two different if instead
>of using a or condition here.

Yeah, I think so!

Anyway, this patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

