From: David Miller <davem@davemloft.net>
Date: Wed, 16 Apr 2014 19:24:30 +0000
Subject: Re: [patch v2] isdn: icn: buffer overflow in icn_command()
Message-Id: <20140416.152430.905344668036570538.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1397490748.2803.18.camel@joe-AO722>
	<20140416112516.GA12917@mwanda>
In-Reply-To: <20140416112516.GA12917@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, joe@perches.com

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Apr 2014 14:25:16 +0300

> This buffer over was detected using static analysis:
> 
> 	drivers/isdn/icn/icn.c:1325 icn_command()
> 	error: format string overflow. buf_size: 60 length: 98
> 
> The calculation for the length of the string is off because it assumes
> that the dial[] buffer holds a 50 character string, but actually it is
> at most 31 characters and NUL.  I have removed the dial[] buffer because
> it isn't needed.
> 
> The maximum length of the string is actually 79 characters and a NUL.  I
> have made the cbuf[] array large enough to hold it and changed the
> sprintf() to an snprintf() as a further safety enhancement.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
