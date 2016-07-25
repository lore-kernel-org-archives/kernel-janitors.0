From: walter harms <wharms@bfs.de>
Date: Mon, 25 Jul 2016 19:32:01 +0000
Subject: Re: [PATCH 3/3] staging: wilc1000: Reduce scope for a few variables in mac_ioctl()
Message-Id: <57966931.4020505@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1c4cac35-dded-ea88-45aa-3f8ac098289d@gmx.de>
In-Reply-To: <1c4cac35-dded-ea88-45aa-3f8ac098289d@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org



Am 25.07.2016 21:17, schrieb Lino Sanfilippo:
>>  
>> -			if (strncasecmp(buff, "RSSI", length) = 0) {
>> +			if (strncasecmp(buff, "RSSI", 0) = 0) {
>> +				s8 rssi;
>> +
> 
> Um, please think a second about if it makes any sense at all to compare 
> zero chars of two strings.
> 
> Lino

also:
the switch has only one case and default.

re,
 wh
