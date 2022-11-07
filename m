Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34187C43217
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Nov 2022 16:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbiKGQTc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Nov 2022 11:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbiKGQTR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Nov 2022 11:19:17 -0500
X-Greylist: delayed 602 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Nov 2022 08:18:36 PST
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net [46.105.56.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E631DA43
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Nov 2022 08:18:33 -0800 (PST)
Received: from player693.ha.ovh.net (unknown [10.110.103.112])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id B3EF12583D
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Nov 2022 16:01:10 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player693.ha.ovh.net (Postfix) with ESMTPSA id D813A3071665A;
        Mon,  7 Nov 2022 16:01:04 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G002277d2aac-3570-423b-9565-975ba2f56ae4,
                    25B4C09D18989E316CCFFAFCA2B6B1B761CAC7E4) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <4a9cbb40-e83f-b117-3ea4-38ff582e2db8@milecki.pl>
Date:   Mon, 7 Nov 2022 17:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized
 variable bug
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <Y1gCALFWXYYwqV1P@kili> <20221107165238.17bbc8fe@xps-13>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20221107165238.17bbc8fe@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3154208593138264955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepheekvedtiedufeeffeejveffvdetuefhgeffgfevfeffjeekueeiteeuvedtuedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7.11.2022 16:52, Miquel Raynal wrote:
> Hi Dan,
> 
> dan.carpenter@oracle.com wrote on Tue, 25 Oct 2022 18:34:24 +0300:
> 
>> On 64 bit systems, the highest 32 bits of the "offset" variable are
>> not initialized.  Also the existing code is not endian safe (it will
>> fail on big endian systems).  Change the type of "offset" to a u32.
>>
>> Fixes: aec4d5f5ffd0 ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>   drivers/mtd/parsers/tplink_safeloader.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
>> index 23584a477391..f601e7bd8627 100644
>> --- a/drivers/mtd/parsers/tplink_safeloader.c
>> +++ b/drivers/mtd/parsers/tplink_safeloader.c
> 
> I am sorry but I don't have this file in my tree, what kernel are you
> using?

https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=mtd/next
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=mtd/next&id=aec4d5f5ffd0f0092bd9dc21ea90e0bc237d4b74

(committer Miquel Raynal ;) )


>> @@ -23,8 +23,8 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
>>   	struct safeloader_cmn_header hdr;
>>   	struct device_node *np;
>>   	size_t bytes_read;
>> -	size_t offset;
>>   	size_t size;
>> +	u32 offset;
>>   	char *buf;
>>   	int err;
>>   
>> @@ -34,14 +34,14 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
>>   	else
>>   		np = of_get_child_by_name(np, "partitions");
>>   
>> -	if (of_property_read_u32(np, "partitions-table-offset", (u32 *)&offset)) {
>> +	if (of_property_read_u32(np, "partitions-table-offset", &offset)) {
>>   		pr_err("Failed to get partitions table offset\n");
>>   		goto err_put;
>>   	}
>>   
>>   	err = mtd_read(mtd, offset, sizeof(hdr), &bytes_read, (uint8_t *)&hdr);
>>   	if (err && !mtd_is_bitflip(err)) {
>> -		pr_err("Failed to read from %s at 0x%zx\n", mtd->name, offset);
>> +		pr_err("Failed to read from %s at 0x%x\n", mtd->name, offset);
>>   		goto err_put;
>>   	}
>>   
