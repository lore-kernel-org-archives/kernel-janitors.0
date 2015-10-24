From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Sat, 24 Oct 2015 09:49:27 +0000
Subject: Re: [patch] mtd/docg3: off by one in doc_register_sysfs()
Message-Id: <87twpgwahr.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151019102005.GF26688@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Smatch found a bug in the error handling:
>
> 	drivers/mtd/devices/docg3.c:1634 doc_register_sysfs()
> 	error: buffer overflow 'doc_sys_attrs' 4 <= 4
>
> The problem is that if the very last device_create_file() fails, then we
> are beyond the end of the array.  Actually, any time i = 3 then there
> is a problem.  We can fix this an simplify the code at the same time by
> moving the !ret conditions out of the for loops and using a goto
> instead.

Hi Dan,

I must admit I don't see the issue here :
 - if the last device_create_file() fail, we have :
   - i = 3, ret = -Exxx
   - doc_sys_attrs[floor][0] is populated
   - doc_sys_attrs[floor][1] is populated
   - doc_sys_attrs[floor][2] is populated
   - doc_sys_attrs[floor][3] is probably NULL
   - next for loop exits

The while loop takes over :
   - first iteration :
     -  --i => i = 2
	device_remove_file(dev, &doc_sys_attrs[floor][2]);
   - then the remaining attributes

I don't see the end of array issue. Could you tell me what I miss ?

Cheers.

--
Robert
