Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81A3C43461
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 20:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D60B613C3
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 20:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbhEOUwk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 May 2021 16:52:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50161 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbhEOUwj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 May 2021 16:52:39 -0400
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=[192.168.0.210])
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1li1Fr-0001mr-TT; Sat, 15 May 2021 20:51:23 +0000
Subject: Re: [PATCH-next] x86/kernel: Fix unchecked return value
To:     Borislav Petkov <bp@alien8.de>,
        Khaled ROMDHANI <khaledromdhani216@gmail.com>
Cc:     peterz@infradead.org, jpoimboe@redhat.com, jbaron@akamai.com,
        rostedt@goodmis.org, ardb@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, x86@kernel.org, hpa@zytor.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210515202212.24836-1-khaledromdhani216@gmail.com>
 <YKAw3Yl8c6nU1zng@zn.tnic>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <6f149c2e-eeb0-6b50-2b54-a56ae4646ea5@canonical.com>
Date:   Sat, 15 May 2021 21:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKAw3Yl8c6nU1zng@zn.tnic>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/05/2021 21:36, Borislav Petkov wrote:
> On Sat, May 15, 2021 at 09:22:12PM +0100, Khaled ROMDHANI wrote:
>> From the coverity scan analysis, the return value from
>> insn_decode_kernel is not checked. It is a macro constructed
>> from the insn_decode function which may fail and return
>> negative integer. Fix this by explicitly checking the
>> return value.
>>
>> Addresses-Coverity: ("Unchecked return value")
>> Signed-off-by: Khaled ROMDHANI <khaledromdhani216@gmail.com>
>> ---
>>  arch/x86/kernel/jump_label.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
>> index a762dc1c615e..bf0ea003b6e7 100644
>> --- a/arch/x86/kernel/jump_label.c
>> +++ b/arch/x86/kernel/jump_label.c
>> @@ -23,7 +23,7 @@ int arch_jump_entry_size(struct jump_entry *entry)
>>  {
>>  	struct insn insn = {};
>>  
>> -	insn_decode_kernel(&insn, (void *)jump_entry_code(entry));
>> +	WARN_ON(insn_decode_kernel(&insn, (void *)jump_entry_code(entry)));
> 
> I don't think coverity is smart enough to notice...
> 
>>  	BUG_ON(insn.length != 2 && insn.length != 5);
> 	^^^^^^^^^^^^^
> 
> ... this line.
> 
> 
Indeed. One needs to be careful with false positives with Coverity.

Colin
