From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 09:57:26 +0000
Subject: Re: [PATCH 2/2] hwmon: (adt7475) Remove some unnecessary checks
Message-Id: <20180814095726.6f7v5fea22qrewb2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814091236.zubxfj32bedobr52@kili.mountain>
 <20180814091432.xhdmxd7aqbz2si4k@kili.mountain>
 <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, Aug 14, 2018 at 09:34:30AM +0000, IKEGAMI Tokunori wrote:
> Hi Dan-san,
> 
> Thank you so much for this fix also.
> 
> Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> 
> By the way I will do try to change the adt7475_read_word() to return the error correctly in near future.
> 

I can do that.  Drop this patch.  I will resend.

regards,
dan carpenter
