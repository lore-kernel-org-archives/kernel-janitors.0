From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 22 Feb 2007 23:55:21 +0000
Subject: Re: [KJ] Improve 'register_handler_proc()' and
Message-Id: <20070222235521.GA5526@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <004f01c752d7$2cca4c10$fa29145a@bureau>
In-Reply-To: <004f01c752d7$2cca4c10$fa29145a@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Feb 17, 2007 at 10:04:11PM +0100, Christophe Jaillet wrote:
> In file /irq/proc.c, function 'register_handler_proc()' and 'register_irq_proc()' memset a local variable 'name[MAX_NAMELEN]'
>
>
> I don't really see the point of this memset.
>
> In 'register_handler_proc()' :
> > > > > > > > >
>  char name [MAX_NAMELEN];
>  [...]
>  memset(name, 0, MAX_NAMELEN);
>  snprintf(name, MAX_NAMELEN, "%s", action->name);
>  [...] proc_mkdir(name, ...);
> > > > > > > > >
>
>
> In 'register_handler_proc()' :
> > > > > > > > >
>  char name [MAX_NAMELEN];
>  [...]
>  memset(name, 0, MAX_NAMELEN);
>  sprintf(name, "%d", irq);
>  [...] proc_mkdir(name, ...);
> > > > > > > > >
> 
> 
> Here are my remarks :
> 
> 1) I think that both function should use 'snprintf', just to be sure. Actualy only 'register_handler_proc()' does
> 
> 2) I think that the memset are completely useless and could make s.o. think that the 'name' variables are correctly cleanned and NULL terminated. But,
>       - In 'register_handler_proc()', the use of snprintf can lead to name beeing not NULL terminated !
>       - In 'register_irq_proc()', the use of sprintf can lead to access arbitrary data in the stack (well if the variable irq is 2^30 = 2147483648, then 11 chars are used and MAX_NAMELEN is only 10 !
> 
> 3) So I think that code like above should be better in both cases :
> > > > > > > > >
>  char name [MAX_NAMELEN + 1];
>  [...]
>  snprintf(name, MAX_NAMELEN, "%d", irq);
>  name[MAX_NAMELEN] = '\0';
>  [...] proc_mkdir(name, ...);
> > > > > > > > >

Yes, the code is overly paranoid. Note that in one case strlcpy() should
be used and in another snprintf(). After that memset() and putting NUL
become truly useless.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
