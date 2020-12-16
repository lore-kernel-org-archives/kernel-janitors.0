From: Roy Im <roy.im.opensource@diasemi.com>
Date: Wed, 16 Dec 2020 10:51:23 +0000
Subject: RE: [PATCH] Input: da7280 - delete a stray tab
Message-Id: <AM6PR10MB1926E4EA344C24F76881E89B85C50@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nGNJjFi9AaBBwX@mwanda>
In-Reply-To: <X9nGNJjFi9AaBBwX@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Support Opensource <Support.Opensource@diasemi.com>, Roy Im <roy.im.opensource@diasemi.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wednesday, December 16, 2020 5:33 PM, Dan Carpenter wrote: 

> This line is indented one tab too far.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks for the patch but it is already fixed by Dmitry as below.
---
An "if" testing for error condition has accidentally been dropped from the code.
		error = device_property_read_string(dev, gpi_str3, &str);
+		if (!error)
 			haptics->gpi_ctl[i].polarity =
 				da7280_haptic_of_gpi_pol_str(dev, str);

Kind regards,
Roy
