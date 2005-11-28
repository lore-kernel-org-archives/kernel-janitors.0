From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Mon, 28 Nov 2005 22:12:22 +0000
Subject: Re: [KJ] use kzalloc instead of kcalloc(1,
Message-Id: <200511282312.22594.jesper.juhl@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <007001c5f392$4c61cda0$3ec0c756@bureau>
In-Reply-To: <007001c5f392$4c61cda0$3ec0c756@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 28 November 2005 22:40, Christophe Jaillet wrote:
> from: Christophe Jaillet christophe.jaillet@wanadoo.fr
> 
> use kzalloc instead of kcalloc(1,...) in /kernel/kprobes.c and /include/linux/gameport.h
> Signed-off-by : Christophe Jaillet christophe.jaillet@wanadoo.fr
> ---
> Patch applicable to linux-2.6.15-rc2
> 
> I hope that for this third try :
>     the form is OK
>     the patch is usefull

Patch looks ok to me, but doesn't seem to want to apply:

juhl@dragon:~/kernel/linux-2.6.15-rc2$ patch -p1 < ../Christophe.patch
patching file kernel/kprobes.c
Hunk #1 FAILED at 420.
Hunk #2 FAILED at 432.
2 out of 2 hunks FAILED -- saving rejects to file kernel/kprobes.c.rej
patching file include/linux/gameport.h
Hunk #1 FAILED at 104.
1 out of 1 hunk FAILED -- saving rejects to file include/linux/gameport.h.rej

Could be due to the email encoding or you generated the patch against a
different kernel version?  I didn't investigate...


Ohh and another thing, if ever you plan to send patches to LKML, then this

> Content-Type: text/html;
> 	charset="iso-8859-1"

is a very bad idea as it'll cause your mail to never reach the mailing list.

Just use plain text.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
