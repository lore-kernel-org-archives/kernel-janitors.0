From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 14 Aug 2018 13:40:49 +0000
Subject: Re: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return errors
Message-Id: <20180814134049.GA607@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20180814100747.oovzd66gxmm755nr@kili.mountain>
In-Reply-To: <20180814100747.oovzd66gxmm755nr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2018 at 01:07:47PM +0300, Dan Carpenter wrote:
> The adt7475_read_word() function was meant to return negative error
> codes on failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

Applied.

Thanks,
Guenter
