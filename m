From: Greg KH <greg@kroah.com>
Date: Mon, 24 May 2004 14:31:11 +0000
Subject: Re: [Kernel-janitors] Re: Replaces yield() with nicedelay() on
Message-Id: <20040524143110.GA32117@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24322879043740997=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524132440.GA23599@nd47>
In-Reply-To: <20040524132440.GA23599@nd47>
To: kernel-janitors@vger.kernel.org

--===============24322879043740997==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 24, 2004 at 03:24:40PM +0200, Domen Puncer wrote:
> On 02/05/04 22:24 -0300, Gustavo Franco wrote:
> > Hi,
> > 
> > It's the last REDIFF, but i'm not replacing yield() with 
> > schedule_timeout() because there's a nicedelay() (maybe the
> > usecs need to be tuned below) there:
> > 
> > 
> > static inline void nicedelay(unsigned long usecs)
> > {
> >         current->state = TASK_INTERRUPTIBLE;
> >         schedule_timeout(HZ);
> >         return;
> > }
> 
> And usecs stands for??
> Funny thing is that there are actualy uses of this function.

Heh, also look at using the msleep function instead of redefining your
own function.

thanks,

greg k-h

--===============24322879043740997==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24322879043740997==--
