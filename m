Received: from smtp.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B5273D9A;
	Mon, 15 Dec 2025 07:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783186; cv=none; b=RKURn2etmTf+YKiA1WkQbHk7xACgVcLL0+WBUmBEsZhv5aTNfLaUlTcCGLBNOUD+uuFf56FOTzzCcVXrU5k0miQym7AR0QrMDFy1NCJ3lBWuBuHo17yrch+elE+gjtnyNXd/yZeaFkb2z6QH+VVTB0XHlRvr0C0lI62ICjTykOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783186; c=relaxed/simple;
	bh=Prdbs8317hs31XyzXUV8/Wvm9MaMRRzpJhyuocmi95Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gi3Gcfn5gx5C38OyM9XZ8N4f/4WKQyj3VnD2f8Ze5ykX/s4ewCC61brIUJVf4e+V8J/V+bK/XrrdS6rffoZsFX2MZuThQVvtIpgOWy0DCJI1OoI2mSRrjrE1URiKr71S5D89PYSwpmdR1Y3TyxC7ewnA/ANGh97DQ74bmvIlZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=NLdMi3Id; arc=none smtp.client-ip=80.12.242.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NLdMi3Id"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id V2rnvp18I8HTFV2rov1Yqo; Mon, 15 Dec 2025 08:19:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765783177;
	bh=dFAONnQ5m69r6NkpaANqpuLgGiHSbRBwF3vJTNGcH2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=NLdMi3Id7CvtEhX2k9KpnPyqRTuhQs5MwDg5+h4TejkOt9EKonmcRoeENZwhQd5mk
	 gB0ft64LlIhRK8+hcl+0o0oMzmd3CWrmq78V8xd7NSwXqBytxRyJPVlPoOOXf6YWBo
	 TCSBwWUzMKUAh2EU/ZdJ1j45umzm7iLJV1QokufDKGECRuvsxsxpz6WI/oUaKOO0Yr
	 MrCG8Ps3Xqkkfeon0PDgF1sGPZPAU4JF+kUofRCmNAZUBRK6THe0jxxtxApyd/pa5y
	 U2uWJdXowiBu2xpxtPnAdXT9s2UfRf60DzGTlrgrfkGyB+EgRsk0i5xh+5SSFpzTKd
	 mIaqQzmnJmUNg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Dec 2025 08:19:37 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <b1c7b612-5c5e-4234-9aa5-a83105d01c52@wanadoo.fr>
Date: Mon, 15 Dec 2025 08:19:33 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crash_dump: Constify struct configfs_item_operations and
 configfs_group_operations
To: Baoquan He <bhe@redhat.com>, coxu@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Vivek Goyal
 <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 kexec@lists.infradead.org
References: <d046ee5666d2f6b1a48ca1a222dfbd2f7c44462f.1765735035.git.christophe.jaillet@wanadoo.fr>
 <aT9uwXK8XFdXei/L@MiWiFi-R3L-srv>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aT9uwXK8XFdXei/L@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/12/2025 à 03:13, Baoquan He a écrit :
> On 12/14/25 at 06:57pm, Christophe JAILLET wrote:
>> 'struct configfs_item_operations' and 'configfs_group_operations' are not
>> modified in this driver.
>>
>> Constifying these structures moves some data to a read-only section, so
>> increases overall security, especially when the structure holds some
>> function pointers.
>>
>> On a x86_64, with allmodconfig, as an example:
>> Before:
>> ======
>>     text	   data	    bss	    dec	    hex	filename
>>    16339	  11001	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
>>
>> After:
>> =====
>>     text	   data	    bss	    dec	    hex	filename
>>    16499	  10841	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Sounds not bad, leave this to Coiby to test.
> 
>> ---
>> Compile tested only.
>>
>> This change is possible since commits f2f36500a63b and f7f78098690d.
> 
> I don't follow here, why do these two commits have anything with this
> patch?

Without these patches, it won't compile because "struct 
config_item_type" needs to be tweaked to accept some const field. It is 
what is done by these patches that have landed 2 weeks ago or so.


Without these 2 commits, you would get (with French messages, sorry):

   CC      kernel/crash_dump_dm_crypt.o
kernel/crash_dump_dm_crypt.c:231:24: erreur: l'initialisation abandonne 
le qualificatif « const » du type pointé [-Werror=discarded-qualifiers]
   231 |         .ct_item_ops = &config_key_item_ops,
       |                        ^
kernel/crash_dump_dm_crypt.c:306:25: erreur: l'initialisation abandonne 
le qualificatif « const » du type pointé [-Werror=discarded-qualifiers]
   306 |         .ct_group_ops = &config_keys_group_ops,
       |                         ^

CJ

> 
>> ---
>>   kernel/crash_dump_dm_crypt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index 401423ba477d..0d23dc1de67c 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>> @@ -223,7 +223,7 @@ static void config_key_release(struct config_item *item)
>>   	key_count--;
>>   }
>>   
>> -static struct configfs_item_operations config_key_item_ops = {
>> +static const struct configfs_item_operations config_key_item_ops = {
>>   	.release = config_key_release,
>>   };
>>   
>> @@ -298,7 +298,7 @@ static struct configfs_attribute *config_keys_attrs[] = {
>>    * Note that, since no extra work is required on ->drop_item(),
>>    * no ->drop_item() is provided.
>>    */
>> -static struct configfs_group_operations config_keys_group_ops = {
>> +static const struct configfs_group_operations config_keys_group_ops = {
>>   	.make_item = config_keys_make_item,
>>   };
>>   
>> -- 
>> 2.52.0
>>
>>
> 
> 
> 

