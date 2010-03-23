From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Date: Tue, 23 Mar 2010 06:54:43 +0000
Subject: Re: [patch] kcore: fix test for end of list
Message-Id: <20100323155443.9705830c.kamezawa.hiroyu@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322120509.GC21571@bicker>
	<20100322233113.f17d0e0c.akpm@linux-foundation.org>
In-Reply-To: <20100322233113.f17d0e0c.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <error27@gmail.com>, WANG Cong <xiyou.wangcong@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 22 Mar 2010 23:31:13 -0400
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Mon, 22 Mar 2010 15:05:09 +0300 Dan Carpenter <error27@gmail.com> wrote:
> 
> > "m" is never NULL here.  We need a different test for the end of list
> > condition.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> > Found with a static checker and compile tested only.  Please review
> > carefully.
> > 
> > diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> > index a44a789..b442dac 100644
> > --- a/fs/proc/kcore.c
> > +++ b/fs/proc/kcore.c
> > @@ -490,7 +490,7 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
> >  		}
> >  		read_unlock(&kclist_lock);
> >  
> > -		if (m = NULL) {
> > +		if (&m->list = &kclist_head) {
> >  			if (clear_user(buffer, tsz))
> >  				return -EFAULT;
> >  		} else if (is_vmalloc_or_module_addr((void *)start)) {
> 
> hm, that code's been there for five years.  I wonder if it's actually necessary.
> 
Hmm..on x86 and others, finally,
	(kern_addr_valid(start))
will catch bad access. But some architectures seems to define kern_addr_valid() as

#define kern_addr_valid(addr)   (1) (from arch/ia64/include/asm/pgtable.h)

Then, we should check "start" is valid address by ourselves (for now). We have
a complete list of registered address in kclist_head.

Regards,
-Kame


