Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1378EC77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 10:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbjDSKAp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 06:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjDSKAo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 06:00:44 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F2DAE83D9
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 03:00:42 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A37B1063;
        Wed, 19 Apr 2023 03:01:26 -0700 (PDT)
Received: from [10.57.20.93] (unknown [10.57.20.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3EEF3F6C4;
        Wed, 19 Apr 2023 03:00:39 -0700 (PDT)
Message-ID: <e85395c3-e0f8-f1a0-3115-c1f26f4aca99@arm.com>
Date:   Wed, 19 Apr 2023 11:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <ab7b9caf-5c90-4616-8517-b38637293639@kili.mountain>
 <d6e45332-0b91-2400-0549-068ea72a4482@arm.com>
 <46ace8c7-c3b1-4e2d-8af0-3f0ab1bd55f5@kili.mountain>
From:   Steven Price <steven.price@arm.com>
In-Reply-To: <46ace8c7-c3b1-4e2d-8af0-3f0ab1bd55f5@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 19/04/2023 10:48, Dan Carpenter wrote:
> On Wed, Apr 19, 2023 at 09:48:41AM +0100, Steven Price wrote:
>> On 19/04/2023 09:06, Dan Carpenter wrote:
>>> The KVM_REG_SIZE() comes from the ioctl and it can be a power of two
>>> between 0-32768 but if it is more than sizeof(long) this will corrupt
>>> memory.
>>>
>>> Fixes: 99adb567632b ("KVM: arm/arm64: Add save/restore support for firmware workaround state")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Although there might be something to be said for rejecting anything
>> where KVM_REG_SIZE(reg->id) != sizeof(u64), as for smaller sizes the top
>> bits of val would be undefined which would require the code to mask the
>> top bits out to be safe. Given that all registers are currently u64 (and
>> I don't expect that to change), perhaps the below would be clearer?
>>
>> 	if (KVM_REG_SIZE(reg->id) != sizeof(val))
>> 		return -EINVAL;
>> 	if (copy_from_user(&val, uaddr, sizeof(val)))
>> 		return -EFAULT;
> 
> I was thinking that zero might be a valid size?

Well any value of reg->id which doesn't match in the switch statement
will cause a -ENOENT return currently, so a zero size would fail that
way as it stands. So I don't think any size other than u64 is valid in
the current code.

There is obviously a question of return value - perhaps returning
-ENOENT would be more appropriate if the size doesn't match (as a later
kernel could decide to implement registers of different sizes)?

Steve


