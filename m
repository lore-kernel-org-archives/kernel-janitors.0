From: Frederik Deweerdt <deweerdt@free.fr>
Date: Thu, 24 Aug 2006 08:01:41 +0000
Subject: Re: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <20060824095410.GC1543@slug>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
In-Reply-To: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 24, 2006 at 09:56:48AM +0530, Raseel Bhagat wrote:
> Hi,
> 
> On 8/24/06, Frederik Deweerdt <deweerdt@free.fr> wrote:
> > Yes there are, but if you're using module_init, the compiler will do
> > the right thing:
> > - if MODULE is defined, the function will be called at load time
> > - if not, do_initcalls will call the init function at boot time
> 
> Exactly, which is why I asked why is it such a big sin to have the ifdefs ?
> And plus, I don't think they are added by the OP,  his patch was not
> concerning that.... or did I miss somthing ?
I'd say that doing the conversion automatically as you've done is not
possible I may be wrong though, but this is my understanding. Take the
drivers/block/ps2esdi.c for example, after your patch you'll end up with:

#ifndef MODULE
module_init(initfn);
#else
module_init(someother_initfn)
#endif MODULE

Regards,
Frederik
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
