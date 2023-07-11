Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD931EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 16:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbjGKQqR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbjGKQpx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 12:45:53 -0400
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1A110CB
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 09:45:03 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id JGTcq56F0nT3LJGTdqAYmw; Tue, 11 Jul 2023 18:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1689093878;
        bh=6W5NPMxAm6lUBSA+tofYioXnHuavxBdyj7tIJCVWBDg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=jSsfs6Al0SzL4B24SF7Cz1+iYxRlmMNO61eyQS56UCRt9wwE7zalBZgedAFs/woZi
         5LiCnuH7OvVHQzRXtF1Q0UFZWVekh+zaE0yqmJxEK3mDtdhV72kwr0EtsQ//boPYGO
         zq6t0LospEKd0q+1pAeFY76l7c5WrdARDZnW/XK61c4bHVW3Ls9ksHvtzk8KFKCZ9E
         Y7Qv9VRemzr79ya6nvif75Wf29bSWPPIe/EezAOGMV5jYnBCNWDDyivxXbIXHb0A+A
         gWKkG+0wkprmNWJs8w72ah0ri675o+BT5iIKtGoDxsnCivovlC5hrIRBjFBikdVmRz
         /xz0huZg9+lBw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Jul 2023 18:44:38 +0200
X-ME-IP: 86.243.2.178
Message-ID: <95bd5686-1ed9-63ef-e91f-30aa54c09cd6@wanadoo.fr>
Date:   Tue, 11 Jul 2023 18:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] firmware: turris-mox-rwtm: Fix an error handling path
 in mox_get_board_info()
Content-Language: fr, en-US
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <fb3a73fd378582bf02e6c5eeabb61d3a3662cbdc.1676453328.git.christophe.jaillet@wanadoo.fr>
 <20230217122108.4a93667f@dellmb>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230217122108.4a93667f@dellmb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 17/02/2023 à 12:21, Marek Behún a écrit :
> On Wed, 15 Feb 2023 10:30:02 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
>> wait_for_completion_timeout() returns 0 if timed out, and positive (at
>> least 1, or number of jiffies left till timeout) if completed.
>>
>> In case of timeout, return -ETIMEDOUT.
>>
>> Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only.
>>
>> v2:
>>     - Fix some other wait_for_completion_timeout() calls
>>
>> ---
>>   drivers/firmware/turris-mox-rwtm.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
>> index 6ea5789a89e2..d6fc37ba897d 100644
>> --- a/drivers/firmware/turris-mox-rwtm.c
>> +++ b/drivers/firmware/turris-mox-rwtm.c
>> @@ -200,8 +200,8 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
>>   		return ret;
>>   
>>   	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (ret == 0)
>> +		return -ETIMEDOUT;
>>   
>>   	ret = mox_get_status(MBOX_CMD_BOARD_INFO, reply->retval);
>>   	if (ret == -ENODATA) {
>> @@ -236,8 +236,8 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
>>   		return ret;
>>   
>>   	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (ret == 0)
>> +		return -ETIMEDOUT;
>>   
>>   	ret = mox_get_status(MBOX_CMD_ECDSA_PUB_KEY, reply->retval);
>>   	if (ret == -ENODATA) {
>> @@ -275,8 +275,8 @@ static int check_get_random_support(struct mox_rwtm *rwtm)
>>   		return ret;
>>   
>>   	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (ret == 0)
>> +		return -ETIMEDOUT;
>>   
>>   	return mox_get_status(MBOX_CMD_GET_RANDOM, rwtm->reply.retval);
>>   }
> 
> Reviewed-by: Marek Behún <kabel@kernel.org>
> 

Hi,
polite reminder.

CJ
