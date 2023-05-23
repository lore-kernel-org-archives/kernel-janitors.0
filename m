Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58940C77B7A
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 May 2023 04:45:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbjEWEpo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 May 2023 00:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbjEWEpi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 May 2023 00:45:38 -0400
X-Greylist: delayed 781 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 May 2023 21:45:23 PDT
Received: from smtp.tom.com (smtprz25.163.net [106.38.219.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A91CE4C
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 21:45:22 -0700 (PDT)
Received: from my-app02.tom.com (my-app02.tom.com [127.0.0.1])
        by freemail02.tom.com (Postfix) with ESMTP id 3F38DB00D37
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 12:32:16 +0800 (CST)
Received: from my-app02.tom.com (HELO smtp.tom.com) ([127.0.0.1])
          by my-app02 (TOM SMTP Server) with SMTP ID 851573100
          for <kernel-janitors@vger.kernel.org>;
          Tue, 23 May 2023 12:32:16 +0800 (CST)
Received: from antispam1.tom.com (unknown [172.25.16.55])
        by freemail02.tom.com (Postfix) with ESMTP id 28450B00D31
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 12:32:16 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tom.com; s=201807;
        t=1684816336; bh=bducTInpco5KGSyT4rn1iVcipwFmeZQnhzZHoILU29k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HBdBSRULTgV1xT1tC3NUnstd1+fTQHQSeqr130EfMDztIxZV12venkAz4vAEVLLi5
         JgoOHrUU0CWoTFtAfcx8fYZJnU6a0u4vwo8rcCWtnXsZhDxwJTmtqVS2SooSeBeNFb
         3jNdW6uXow9FAUraMj/q0J38N8HeRCKge161mE/s=
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
        by antispam1.tom.com (Postfix) with ESMTP id 0D058D41AD5
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 12:32:16 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam1.tom.com
Received: from antispam1.tom.com ([127.0.0.1])
        by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4I3SNmnBlBit for <kernel-janitors@vger.kernel.org>;
        Tue, 23 May 2023 12:32:12 +0800 (CST)
Received: from [172.30.38.103] (unknown [180.167.10.98])
        by antispam1.tom.com (Postfix) with ESMTPA id ED4B9D41551;
        Tue, 23 May 2023 12:32:11 +0800 (CST)
Message-ID: <7f1cd0ad-7991-af0c-a31a-84c261d4ca18@tom.com>
Date:   Tue, 23 May 2023 12:32:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drivers/fsi/scom: Return -EFAULT if copy fails
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, Su Hui <suhui@nfschina.com>
Cc:     Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>, eajames@us.ibm.com,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        cbostic@linux.vnet.ibm.com, linux-fsi@lists.ozlabs.org
References: <20230519013710.34954-1-suhui@nfschina.com>
 <de9a7ffe-bedd-4181-886d-c9a3006b7be8@roeck-us.net>
From:   Longsuhui <Jack_sun@tom.com>
In-Reply-To: <de9a7ffe-bedd-4181-886d-c9a3006b7be8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 2023/5/23 06:30, Guenter Roeck wrote:
> On Fri, May 19, 2023 at 09:37:10AM +0800, Su Hui wrote:
>> The copy_to/from_user() functions return the number of bytes remaining
>> to be copied, but we want to return -EFAULT to the user.
>>
> Why ? EFAULT means that a bad address was provided, and it is not
> immediately obvious why that would be the case.

When copy_to/from_user() functions failed, the error code is  -EFAULT in most case.
	
	git grep -A1 "copy_from_user" | grep EFAULT | wc -l
     1985
	git grep -A1 "copy_to_user" | grep EFAULT | wc -l
      1871

I think return -EFAULT is also right in this case.

Su Hui

> Guenter
>
>> Fixes: 680ca6dcf5c2 ("drivers/fsi: Add SCOM FSI client device driver")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/fsi/fsi-scom.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
>> index bcb756dc9866..caaf7738eb98 100644
>> --- a/drivers/fsi/fsi-scom.c
>> +++ b/drivers/fsi/fsi-scom.c
>> @@ -335,7 +335,7 @@ static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
>>   	if (rc)
>>   		dev_dbg(dev, "copy to user failed:%d\n", rc);
>>   
>> -	return rc ? rc : len;
>> +	return rc ? -EFAULT : len;
>>   }
>>   
>>   static ssize_t scom_write(struct file *filep, const char __user *buf,
>> -- 
>> 2.30.2
>>
