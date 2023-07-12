Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3633EB64DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jul 2023 01:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjGLB0U (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 21:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGLB0T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 21:26:19 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 210CF95;
        Tue, 11 Jul 2023 18:26:17 -0700 (PDT)
Received: from [172.30.11.106] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 90915605D3D97;
        Wed, 12 Jul 2023 09:26:13 +0800 (CST)
Message-ID: <9ecfc762-9860-c880-b3f3-5652e4dc58f5@nfschina.com>
Date:   Wed, 12 Jul 2023 09:26:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Content-Language: en-US
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
        Dave Airlie <airlied@redhat.com>,
        virtualization@lists.linux-foundation.org,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        kernel-janitors@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
In-Reply-To: <6baf8384-af7a-06e1-6f91-8c4e8aa65197@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 2023/7/11 17:33, Markus Elfring wrote:
>> virtio_gpu_get_vbuf always be successful,
>> so remove the error judgment.
> How do you think about to improve this change description any more?

Hi,

virtio_gpu_get_vbuf use "__GFP_NOFAIL" flag to allocate memory, this 
make sure
it won't fail, and virtio_gpu_get_vbuf never return error code, so 
remove the error judgment.

How about this one? Thanks for your advice.

Su Hui

> Regards,
> Markus
