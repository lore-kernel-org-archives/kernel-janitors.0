Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C27EB64D7
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Jun 2023 06:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjFUG3R (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Jun 2023 02:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjFUG3K (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Jun 2023 02:29:10 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DB1A8E60;
        Tue, 20 Jun 2023 23:29:08 -0700 (PDT)
Received: from [172.30.11.106] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id DEA7D602A0301;
        Wed, 21 Jun 2023 14:28:45 +0800 (CST)
Message-ID: <af2db7e9-5fd4-2120-8308-99b58f9ad1a6@nfschina.com>
Date:   Wed, 21 Jun 2023 14:28:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZHJtL2FtZC9hbWRncHU6IFVzZSDigJxfX3BhY2tl?=
 =?UTF-8?B?ZOKAnCBpbnN0ZWFkIG9mICJwcmFnbWEgcGFjaygpIg==?=
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        oe-kbuild@lists.linux.dev, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jane.Jian@amd.com,
        David.Francis@amd.com, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, Likun.Gao@amd.com
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
In-Reply-To: <34ae0f86-c32b-4d5a-be56-0654dba0f908@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/6/21 14:11, Dan Carpenter wrote:
> When there was a #pragma then Sparse just turned off.  The Sparse
> warnings are places where people forgot to put the __user in their casts
> or didn't annotate endianness correctly.  It's not a "bug" to forget
> to annotate endianness or user pointers.  That's how we used to do it
> prior to 2003.  But these days it feels strange and dangerous to see
> these sorts of warnings.
Got it. And it is really strange when I first saw these warnings.
Thanks for your explanation!

Su Hui

>
> Smatch also disabled some uninitialized variable checks.  These are
> mostly false positives where we have a loop:
>
> 	int r;
>
> 	while (something) {
> 		r = frob();
> 	}
>
> 	return r;
>
> Smatch complains that we don't necessarily enter the loop.  I think
> I'm going to disable this type of "enter the loop" warning when you
> don't have the cross function database available.  That will silence
> these for the kbuild bot.
>
> regards,
> dan carpenter
>
