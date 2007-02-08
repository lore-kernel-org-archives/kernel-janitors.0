From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 08 Feb 2007 06:19:53 +0000
Subject: Re: [KJ] signedness of cpu variables
Message-Id: <20070208061953.GB5441@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0702061132lf8e4a2cj7ae612976029e21b@mail.gmail.com>
In-Reply-To: <8ef77f2e0702061132lf8e4a2cj7ae612976029e21b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 06, 2007 at 02:25:44PM -0800, Randy Dunlap wrote:
> On Tue, 6 Feb 2007 20:32:29 +0100 Thomas Hisch wrote:
> 
> > i digged into the kernel source and found a lot of signed int cpu variables.
> > shouldn't they be replaced by unsigned ints ??
> > 
> > for example everywhere in kernel/cpu.c cpu variables are unsigned except in
> > check_for_tasks(int cpu). are there any reasons for the signed int parameter
> > of this  particular function ??
> > 
> > any thoughts ??
> > is this sth. for the kernel-janitors ?
> 
> This one makes sense.

And change to %u several lines below. :)

> Others would need their own evaluations.

> > --- a/kernel/cpu.c
> > +++ b/kernel/cpu.c
> > @@ -87,7 +87,7 @@ void unregister_cpu_notifier(struct notifier_block *nb)
> >  }
> >  EXPORT_SYMBOL(unregister_cpu_notifier);
> > 
> > -static inline void check_for_tasks(int cpu)
> > +static inline void check_for_tasks(unsigned int cpu)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
