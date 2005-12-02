From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 02 Dec 2005 18:57:05 +0000
Subject: Re: [KJ] [patch] potential data-corruption fix in md.c
Message-Id: <20051202185704.GA9780@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50489744624263477=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
In-Reply-To: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
To: kernel-janitors@vger.kernel.org

--===============50489744624263477==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 02, 2005 at 06:38:53PM +0100, Jesper Juhl wrote:
> On 12/2/05, Jaco Kroon <jaco@kroon.co.za> wrote:
> > Fix a check whereby a negative personality number passed to either
> > register_md_personality or unregister_md_personality could potentially
> > cause data corruption.

> > --- linux-2.6.14/drivers/md/md.c.orig
> > +++ linux-2.6.14/drivers/md/md.c
> > @@ -3425,7 +3425,7 @@
> >
> >  int register_md_personality(int pnum, mdk_personality_t *p)
> >  {
> > -       if (pnum >= MAX_PERSONALITY) {
> > +       if (pnum < 0 || pnum >= MAX_PERSONALITY) {
> >                 printk(KERN_ERR
> >                        "md: tried to install personality %s as nr %d, but max is %lu\n",
> >                        p->name, pnum, MAX_PERSONALITY-1);
> > @@ -3446,7 +3446,7 @@
> >
> >  int unregister_md_personality(int pnum)
> >  {
> > -       if (pnum >= MAX_PERSONALITY)
> > +       if (pnum < 0 || pnum >= MAX_PERSONALITY)
> >                 return -EINVAL;
> >
>
> MAX_PERSONALITY that pnum is compared to is defined as
>
> #define MAX_PERSONALITY   11UL
>
> so might it make more sense to just switch pnum to be an "unsigned
> long" instead of adding <0 checks?

It is int in other md files. So, one may want to change int to bitwised
enum. Or add the check.


--===============50489744624263477==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50489744624263477==--
