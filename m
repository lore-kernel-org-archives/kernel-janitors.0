From: "Thomas Hisch" <t.hisch@gmail.com>
Date: Wed, 07 Feb 2007 14:16:54 +0000
Subject: Re: [KJ] signedness of cpu variables
Message-Id: <8ef77f2e0702070616m2109affet867d7378c4e8fae@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0702061132lf8e4a2cj7ae612976029e21b@mail.gmail.com>
In-Reply-To: <8ef77f2e0702061132lf8e4a2cj7ae612976029e21b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

i did a new patch replacing signed int cpu and some signed int node
variables in arch/i386/kernel. i experienced that some of the function
prototypes are also used
by other architectures. do some archs need signed int cpus ? if yes,
is this whole replacing signed int stuff worth the effort ?

and what about the final type of the cpu variables - should we use one
of the u16,u32,.. typedefs for unsigned types, or should we stick with
unsigned int ?

regards
Thomas Hisch

On 2/7/07, walter harms <wharms@bfs.de> wrote:
> if this is intended, someone could add a remark about it ?
>
> re,
>  wh
>
>
> Randy Dunlap wrote:
> > On Tue, 6 Feb 2007 20:32:29 +0100 Thomas Hisch wrote:
> >
> >> i digged into the kernel source and found a lot of signed int cpu variables.
> >> shouldn't they be replaced by unsigned ints ??
> >>
> >> for example everywhere in kernel/cpu.c cpu variables are unsigned except in
> >> check_for_tasks(int cpu). are there any reasons for the signed int parameter
> >> of this  particular function ??
> >>
> >> any thoughts ??
> >> is this sth. for the kernel-janitors ?
> >
> > This one makes sense.  Others would need their own evaluations.
> >
> >> regards
> >> Thomas Hisch
> >>
> >> diff --git a/kernel/cpu.c b/kernel/cpu.c
> >> index 7406fe6..b0d4fbd 100644
> >> --- a/kernel/cpu.c
> >> +++ b/kernel/cpu.c
> >> @@ -87,7 +87,7 @@ void unregister_cpu_notifier(struct notifier_block *nb)
> >>  }
> >>  EXPORT_SYMBOL(unregister_cpu_notifier);
> >>
> >> -static inline void check_for_tasks(int cpu)
> >> +static inline void check_for_tasks(unsigned int cpu)
> >>  {
> >>         struct task_struct *p;
> >
> >
> > ---
> > ~Randy
> > _______________________________________________
> > Kernel-janitors mailing list
> > Kernel-janitors@lists.osdl.org
> > https://lists.osdl.org/mailman/listinfo/kernel-janitors
> >
> >
> >
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
