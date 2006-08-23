From: Frederik Deweerdt <deweerdt@free.fr>
Date: Wed, 23 Aug 2006 22:44:28 +0000
Subject: Re: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <20060824003117.GB1543@slug>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
In-Reply-To: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 24, 2006 at 01:58:41AM +0530, Raseel Bhagat wrote:
> Hi ,
> 
> On 8/23/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > True, but that isn't the worst sin of this patch. What to do with
> >
> >         #ifdef MODULE
> >
> > sprinkled all over touched files and left?
> >
> I don't understand how is that a problem. ?
> There are appropriate #endif s aren't there ?
Yes there are, but if you're using module_init, the compiler will do
the right thing:
- if MODULE is defined, the function will be called at load time
- if not, do_initcalls will call the init function at boot time
Regards,
Frederik
> 
> 
> -- 
> Raseel.
> http://osd.byethost8.com
> http://raseel.livejournal.com
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
