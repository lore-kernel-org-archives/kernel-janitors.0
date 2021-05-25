Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35EDC2B9F8
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 08:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF56A61419
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 08:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbhEYI4J (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 May 2021 04:56:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44732 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhEYI4J (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 May 2021 04:56:09 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1llSpi-00039G-AK; Tue, 25 May 2021 08:54:38 +0000
Subject: Re: [PATCH][next] ttyprintk: remove redundant initialization of
 variable i
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210518182126.140978-1-colin.king@canonical.com>
 <YKeqUBZ+Zy/mvZNQ@kroah.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <73809ad0-cdb0-695e-c9aa-55b6f8f3710b@canonical.com>
Date:   Tue, 25 May 2021 09:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKeqUBZ+Zy/mvZNQ@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 21/05/2021 13:40, Greg Kroah-Hartman wrote:
> On Tue, May 18, 2021 at 07:21:26PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The variable i is being initialized with a value that is never read,
>> it is being updated later on.  The assignment is redundant and can be
>> removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/char/ttyprintk.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/char/ttyprintk.c b/drivers/char/ttyprintk.c
>> index 219fa1382396..230b2c9b3e3c 100644
>> --- a/drivers/char/ttyprintk.c
>> +++ b/drivers/char/ttyprintk.c
>> @@ -52,7 +52,7 @@ static void tpk_flush(void)
>>  
>>  static int tpk_printk(const unsigned char *buf, int count)
>>  {
>> -	int i = tpk_curr;
>> +	int i;
>>  
>>  	for (i = 0; i < count; i++) {
>>  		if (tpk_curr >= TPK_STR_SIZE) {
>> -- 
>> 2.31.1
>>
> 
> This is not ok for what is currently in linux-next :(

Hmm, it applies cleanly on today's linux-next, do you mind re-apply it?


> 
> greg k-h
> 

