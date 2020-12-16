From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2020 11:32:28 +0000
Subject: Re: [PATCH] Input: da7280 - delete a stray tab
Message-Id: <20201216113228.GK2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nGNJjFi9AaBBwX@mwanda>
 <AM6PR10MB1926E4EA344C24F76881E89B85C50@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM6PR10MB1926E4EA344C24F76881E89B85C50@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roy Im <roy.im.opensource@diasemi.com>
Cc: Support Opensource <Support.Opensource@diasemi.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Dec 16, 2020 at 10:51:23AM +0000, Roy Im wrote:
> On Wednesday, December 16, 2020 5:33 PM, Dan Carpenter wrote: 
> 
> > This line is indented one tab too far.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> 
> Thanks for the patch but it is already fixed by Dmitry as below.
> ---
> An "if" testing for error condition has accidentally been dropped from the code.
> 		error = device_property_read_string(dev, gpi_str3, &str);
> +		if (!error)
>  			haptics->gpi_ctl[i].polarity >  				da7280_haptic_of_gpi_pol_str(dev, str);
> 

Huh...  Well, at least the kbuild bot discovered this using the Smatch
warning for inconsistent indenting so that's nice.

https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/IB3H2KDL2HZ5WGNAER7TLCJQHZJH7S7E/

This is one of the first real bugs that that indenting has found, maybe
if Smatch had used some more of the context clues the warning could have
been made better.

Presumably W=1 and some of the other analysis tools would have warned
about the unused "error = " assignment if we had waited another day.

regards,
dan carpenter
