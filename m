From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Date: Wed, 15 Aug 2018 06:02:46 +0000
Subject: RE: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return errors
Message-Id: <TY2PR01MB216928C2DF3E2976F4E9BDADDC3F0@TY2PR01MB2169.jpnprd01.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20180814100747.oovzd66gxmm755nr@kili.mountain>
 <20180814134049.GA607@roeck-us.net>
In-Reply-To: <20180814134049.GA607@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Guenter-san,

Could you please let me know the git repository that applied the fixes by Dan-san?

Regards,
Ikegami

> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> Roeck
> Sent: Tuesday, August 14, 2018 10:41 PM
> To: Dan Carpenter
> Cc: Jean Delvare; IKEGAMI Tokunori; linux-hwmon@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word()
> return errors
> 
> On Tue, Aug 14, 2018 at 01:07:47PM +0300, Dan Carpenter wrote:
> > The adt7475_read_word() function was meant to return negative error
> > codes on failure.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> 
> Applied.
> 
> Thanks,
> Guenter
