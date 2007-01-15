From: "Rich Morgan" <rmorgan@openaddict.com>
Date: Mon, 15 Jan 2007 17:50:01 +0000
Subject: Re: [KJ] possibly dead config variables
Message-Id: <2593.208.205.82.65.1168883401.squirrel@www.heavysystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701151207480.5724@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701151207480.5724@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Mon, January 15, 2007 12:15 pm, Robert P. J. Day wrote:
>
>   based on a script i whipped together, there is a strong possibility
> that the following kernel config variables are useless.

<snip>

>   to elucidate, what i mean by "useless" is that they exist in some
> Kconfig file and may even be selectable, but appear to have no effect
> on the build whatsoever.  that is, they don't affect any other config
> variable, they are not part of any Makefile, they are not examined by
> any source file, etc.
>

<snip>

>   anyway, does this seem like reasonable logic?  feel free to poke at
> some of the others.  i'm not guaranteeing that the list is perfect,
> but it's a set of strong candidates for further examination and
> possible removal.
>


They might be useful to certain embedded Linux applications (LCD_PANEL) or
other special purpose uses.  At least, that's what jumped out at me when I
was looking at some of those.

v/r,
Rich Morgan
OpenAddict.com

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
