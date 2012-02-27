From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 27 Feb 2012 06:52:47 +0000
Subject: Re: [PATCH] edac: move const pci_device_id tables from __devinitdata to __devinitconst.
Message-Id: <alpine.DEB.2.02.1202270751550.1871@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <791782.71473.bm@smtp128.mail.ukl.yahoo.com> <20120227061300.GC4763@mwanda>
In-Reply-To: <20120227061300.GC4763@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lionel Debroux <lionel_debroux@yahoo.fr>, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org



On Mon, 27 Feb 2012, Dan Carpenter wrote:

> On Sun, Feb 26, 2012 at 09:15:29PM +0100, Lionel Debroux wrote:
>> Based on PaX and earlier work by Andi Kleen.
>>
>> Patch against current Linus tree.
>>
>
> Always write patches against linux-next.  We can't apply this.
>
> I wonder if we could make a coccinelle script for this.

It should be possible at some point - at the moment it rases some parsing 
problems.

I wonder if it would be nicer to always use PCI_VEND_DEV?

julia


>
> regards,
> dan carpenter
>
