From: "anubhav rakshit" <anubhavrocks@gmail.com>
Date: Fri, 25 Apr 2008 19:03:11 +0000
Subject: Re: [PATCH] The function register_chrdev_region() for count=0 returns a false success.This patch pre
Message-Id: <623132dc0804251151g3ac603ex8cf4c1f688557d05@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080425182734.GJ14990@parisc-linux.org>
In-Reply-To: <20080425182734.GJ14990@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Apr 26, 2008 at 12:59 AM, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> On Fri, Apr 25, 2008 at 11:55:25PM +0530, anubhav rakshit wrote:
>
>
> > Signed-off-by: Anubhav Rakshit <anubhavrocks@gmail.com>
>  > ---
>  >  fs/char_dev.c |    5 ++++-
>  >  1 files changed, 4 insertions(+), 1 deletions(-)
>  >
>  > diff --git a/fs/char_dev.c b/fs/char_dev.c
>  > index 038674a..f4c371a 100644
>  > --- a/fs/char_dev.c
>  > +++ b/fs/char_dev.c
>  > @@ -199,7 +199,10 @@ int register_chrdev_region(dev_t from, unsigned
>  > count, const char *name)
>  >       struct char_device_struct *cd;
>  >       dev_t to = from + count;
>  >       dev_t n, next;
>  > -
>  > +
>  > +     if(unlikely(count = 0))
>  > +             return -EINVAL;
>  > +
>  >       for (n = from; n < to; n = next) {
>  >               next = MKDEV(MAJOR(n)+1, 0);
>  >               if (next > to)
>
>  I'd say
>  a) unlikely in such rarely used function is useless
>  b)
>         register_chrdev_region(from, 0, name);
>         unregister_chrdev_region(from, 0);
>
>   will unregister region sucessfully ;-)
  register_chrdev_region() doesnot  actually succeed with count=0.The
caller should be notified about this.
>
>  c) this is problem of a caller -- don't!
  Exactly and he/she should be notified.


>
>



-- 
Anubhav Rakshit
