From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Date: Mon, 25 Jul 2016 19:17:59 +0000
Subject: Re: [PATCH 3/3] staging: wilc1000: Reduce scope for a few variables in mac_ioctl()
Message-Id: <1c4cac35-dded-ea88-45aa-3f8ac098289d@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: 702302e0-0056-9fff-7bb4-f54d4a0b0afc@users.sourceforge.net
References: <702302e0-0056-9fff-7bb4-f54d4a0b0afc@users.sourceforge.net>
In-Reply-To: <702302e0-0056-9fff-7bb4-f54d4a0b0afc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

>  
> -			if (strncasecmp(buff, "RSSI", length) = 0) {
> +			if (strncasecmp(buff, "RSSI", 0) = 0) {
> +				s8 rssi;
> +

Um, please think a second about if it makes any sense at all to compare 
zero chars of two strings.

Lino
