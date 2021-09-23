Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9059C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Sep 2021 16:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93D4860041
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Sep 2021 16:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242163AbhIWQNE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Sep 2021 12:13:04 -0400
Received: from relayfre-01.paragon-software.com ([176.12.100.13]:36020 "EHLO
        relayfre-01.paragon-software.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234669AbhIWQND (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Sep 2021 12:13:03 -0400
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
        by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E07CC1D40;
        Thu, 23 Sep 2021 19:11:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paragon-software.com; s=mail; t=1632413489;
        bh=8ye9Cx7G+0A6KCJSzmDTdmMy2k/YcvE7Qnx+pY0deQc=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=qBWaGzDFDSp/wTFs7O6KkRKNm3SPkKjk76KHeCX5eXt1li1xgvSRCBlh8J+3uDeIa
         9Yws9za22AWmgnsqN3+4HAYLghC2TBeCz49PdPwrDWiQQUZSHZX1iZhQxjDYaVIqaW
         yyAXt5hfVVxXQooGhNmNHQ16dcuT90J9H2Zb80u0=
Received: from [192.168.211.73] (192.168.211.73) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 23 Sep 2021 19:11:29 +0300
Message-ID: <fbc33faa-5eec-527c-3c78-4966a5480f44@paragon-software.com>
Date:   Thu, 23 Sep 2021 19:11:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 1/2] fs/ntfs3: Remove a useless test in 'indx_find()'
Content-Language: en-US
To:     Kari Argillander <kari.argillander@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC:     <ntfs3@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
 <20210921213955.se7svkfr62xndnlc@kari-VirtualBox>
From:   Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210921213955.se7svkfr62xndnlc@kari-VirtualBox>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.73]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 22.09.2021 00:39, Kari Argillander wrote:
> On Sat, Sep 18, 2021 at 09:56:19PM +0200, Christophe JAILLET wrote:
>> 'fnd' has been dereferenced several time before, so testing it here is
>> pointless.
>> Moreover, all callers of 'indx_find()' already have some error handling
>> code that makes sure that no NULL 'fnd' is passed.
>>
>> So, remove the useless test.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Seems correct, thanks.
> 
> Reviewed-by: Kari Argillander <kari.argillander@gmail.com>
> 
>> ---
>>  fs/ntfs3/index.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
>> index 4f71a91f07d9..6f81e3a49abf 100644
>> --- a/fs/ntfs3/index.c
>> +++ b/fs/ntfs3/index.c
>> @@ -1072,9 +1072,7 @@ int indx_find(struct ntfs_index *indx, struct ntfs_inode *ni,
>>  	if (!e)
>>  		return -EINVAL;
>>  
>> -	if (fnd)
>> -		fnd->root_de = e;
>> -
>> +	fnd->root_de = e;
>>  	err = 0;
>>  
>>  	for (;;) {
>> -- 
>> 2.30.2
>>

Thanks for work - applied!
