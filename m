From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Fri, 02 Dec 2005 17:38:53 +0000
Subject: Re: [KJ] [patch] potential data-corruption fix in md.c
Message-Id: <9a8748490512020938w456b99b9w9327d3a90dc22608@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
In-Reply-To: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/2/05, Jaco Kroon <jaco@kroon.co.za> wrote:
> Fix a check whereby a negative personality number passed to either
> register_md_personality or unregister_md_personality could potentially
> cause data corruption.
>
> Signed off:  Jaco Kroon <jaco@kroon.co.za>
>
> --- linux-2.6.14/drivers/md/md.c.orig   2005-12-02 11:31:59.000000000 +0200
> +++ linux-2.6.14/drivers/md/md.c        2005-12-02 11:32:37.000000000 +0200
> @@ -3425,7 +3425,7 @@
>
>  int register_md_personality(int pnum, mdk_personality_t *p)
>  {
> -       if (pnum >= MAX_PERSONALITY) {
> +       if (pnum < 0 || pnum >= MAX_PERSONALITY) {
>                 printk(KERN_ERR
>                        "md: tried to install personality %s as nr %d, but max is %lu\n",
>                        p->name, pnum, MAX_PERSONALITY-1);
> @@ -3446,7 +3446,7 @@
>
>  int unregister_md_personality(int pnum)
>  {
> -       if (pnum >= MAX_PERSONALITY)
> +       if (pnum < 0 || pnum >= MAX_PERSONALITY)
>                 return -EINVAL;
>

MAX_PERSONALITY that pnum is compared to is defined as

#define MAX_PERSONALITY   11UL

so might it make more sense to just switch pnum to be an "unsigned
long" instead of adding <0 checks?

I haven't read the code in question though, so I may be way off - just
a thought...


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
