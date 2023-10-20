Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47929C001DF
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 02:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346850AbjJTC7s (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 22:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbjJTC7r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 22:59:47 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A3E7318C;
        Thu, 19 Oct 2023 19:59:44 -0700 (PDT)
Received: from [172.30.11.106] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id B8284604C5033;
        Fri, 20 Oct 2023 10:59:41 +0800 (CST)
Message-ID: <f9d9860c-0446-faea-2a69-0b2516ba7dcf@nfschina.com>
Date:   Fri, 20 Oct 2023 10:59:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] net: lan78xx: add an error code check in
 lan78xx_write_raw_eeprom
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
        trix@redhat.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
In-Reply-To: <aa78dff4-d572-4abc-9f86-3c01f887faf1@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/10/19 18:34, Dan Carpenter wrote:
> On Thu, Oct 19, 2023 at 04:40:23PM +0800, Su Hui wrote:
>> check the value of 'ret' after call 'lan78xx_read_reg'.
>>
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>
>> Clang complains that value stored to 'ret' is never read.
>> Maybe this place miss an error code check, I'm not sure
>> about this.
> There are a bunch more "ret = " assignments which aren't used in this
> function.
Yep, same problem  exists at lan78xx_read_raw_eeprom().
I try to send v2 patch to fix this.

Su Hui

