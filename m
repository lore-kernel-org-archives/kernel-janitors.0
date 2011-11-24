From: "David Laight" <David.Laight@ACULAB.COM>
Date: Thu, 24 Nov 2011 12:30:00 +0000
Subject: RE: [patch] isdn: make sure strings are null terminated
Message-Id: <AE90C24D6B3A694183C094C60CF0A2F6D8AEE0@saturn3.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ECE36D6.7060503@bfs.de>
In-Reply-To: <4ECE36D6.7060503@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

 
> >>> +			if (strlen(dioctl.cf_ctrl.msn) >sizeof(dioctl.cf_ctrl.msn))
> >>> +				return -EINVAL;
...
> So far i see you do not get a string, you get a structure. And 
> it will hard to validate the element is a useful string.
> I think my (sledgehammer) method is ok here because you
> make sure that all later calls (strcmp,strcpy) will succeed.
> If someone supplies a bad string the later calls will catch 
> by failing to identify and return a proper code from there
> (at least i hope so).
> 
> re,
>  wh

Except that the strlen() can run right off the end
of the structure - and might eventually fault.
You need to use something like strnlen().

	David


