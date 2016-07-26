From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Jul 2016 06:25:54 +0000
Subject: Re: staging: wilc1000: Reduce scope for a few variables in mac_ioctl()
Message-Id: <d8d9729c-6d65-a901-1b29-c0b031e143d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1c4cac35-dded-ea88-45aa-3f8ac098289d@gmx.de>
In-Reply-To: <1c4cac35-dded-ea88-45aa-3f8ac098289d@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Caldwell <Steve.Caldwell@microchip.com>

>> -			if (strncasecmp(buff, "RSSI", length) = 0) {
>> +			if (strncasecmp(buff, "RSSI", 0) = 0) {
>> +				s8 rssi;
>> +
> 
> Um, please think a second about if it makes any sense at all to compare 
> zero chars of two strings.

Under which circumstances should the variable "length" contain an other
value than zero?

How can this open issue be fixed better?

Regards,
Markus
