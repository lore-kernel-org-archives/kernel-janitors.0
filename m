Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBF1EB64DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jul 2023 01:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjGLBSu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 21:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjGLBSt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 21:18:49 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 542B195;
        Tue, 11 Jul 2023 18:18:46 -0700 (PDT)
Received: from [172.30.11.106] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 734DC605D3D97;
        Wed, 12 Jul 2023 09:18:43 +0800 (CST)
Message-ID: <0561b89b-42a8-35bf-feaa-e5feb4ec3cd5@nfschina.com>
Date:   Wed, 12 Jul 2023 09:18:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
        olvaffe@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
In-Reply-To: <7f67ed65-647a-44d7-a262-d3f1f48d90b9@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/7/11 19:13, Dan Carpenter wrote:
> On Tue, Jul 11, 2023 at 05:00:31PM +0800, Su Hui wrote:
>> virtio_gpu_get_vbuf always be successful,
>> so remove the error judgment.
>>
> No, just ignore the static checker false positive in this case.  The
> intent of the code is clear that if it did have an error it should
> return an error pointer.

Hi, Dan,

Function "virtio_gpu_get_vbuf" call "kmem_cache_zalloc (vgdev->vbufs, 
GFP_KERNEL | __GFP_NOFAIL)" to
allocate memory. Adding the " __GFP_NOFAIL”flag make sure it won't fail. 
And "virtio_gpu_get_vbuf" never
return an error code, so I think this is not a false positive.

Su Hui

>
> regards,
> dan carpenter
>
