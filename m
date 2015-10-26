From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 26 Oct 2015 18:45:52 +0000
Subject: Re: [patch] mtd/docg3: off by one in doc_register_sysfs()
Message-Id: <20151026184552.GD13239@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151019102005.GF26688@mwanda> <87twpgwahr.fsf@belgarion.home>
 <20151024174912.GD7289@mwanda> <87wpubl6xj.fsf@belgarion.home>
In-Reply-To: <87wpubl6xj.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

On Sun, Oct 25, 2015 at 08:54:16AM +0100, Robert Jarzmik wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > On Sat, Oct 24, 2015 at 11:49:27AM +0200, Robert Jarzmik wrote:
> >> Dan Carpenter <dan.carpenter@oracle.com> writes:
> >> 
> >> > Smatch found a bug in the error handling:
> >> >
> >> > 	drivers/mtd/devices/docg3.c:1634 doc_register_sysfs()
> >> > 	error: buffer overflow 'doc_sys_attrs' 4 <= 4
> >> >
> >> > The problem is that if the very last device_create_file() fails, then we
> >> > are beyond the end of the array.  Actually, any time i = 3 then there
> >> > is a problem.  We can fix this an simplify the code at the same time by
> >> > moving the !ret conditions out of the for loops and using a goto
> >> > instead.
> >> 
> >> Hi Dan,
> >> 
> >> I must admit I don't see the issue here :
> >>  - if the last device_create_file() fail, we have :
> >>    - i = 3, ret = -Exxx
> >>    - doc_sys_attrs[floor][0] is populated
> >>    - doc_sys_attrs[floor][1] is populated
> >>    - doc_sys_attrs[floor][2] is populated
> >>    - doc_sys_attrs[floor][3] is probably NULL
> >
> > We increment "i" to 4.
> Ah yes, I see it now, thanks. Somehow in my brain the !ret condition in the for
> loop was preventing the increment ... silly.
> 
> So:
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Applied to l2-mtd.git. Thanks.
