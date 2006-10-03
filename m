From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Tue, 03 Oct 2006 10:29:53 +0000
Subject: Re: [KJ] memory leak?
Message-Id: <80ec54e90610030329s6aa69f93lce72fe9818d05656@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90610022330h5fea626aha58011043899dd@mail.gmail.com>
In-Reply-To: <80ec54e90610022330h5fea626aha58011043899dd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Ok. Sorry. I was a bit unsure myself so I figured it was better to ask than:
* leaving it or
* reporting it as a bug.

Yes, I am using a code checker. Too bad it's not more accurate.



2006/10/3, Dan Carpenter <error27@gmail.com>:
> On 10/2/06, Daniel Marjam=E4ki <daniel.marjamaki@gmail.com> wrote:
> > Hello friends!
> >
> > I believe I have found a memory leak. Can somebody please verify
> > before I submit it in the bugs database?
> >
> > Kernel: 2.6.18
> >
> > In linux/drivers/block/cpqarray.c:  ida_ctlr_ioctl
> > I believe the pointer "p" can cause a memory leak.
> > Check out "switch(io->cmd)" at the end of the function. All cases
> > except "default" will cause p to be deallocated.
> >
> > Best regards,
> > Daniel Marjam=E4ki
>
> Nope.  False positive.  On the default case p isn't allocated.
>
> Are you using a some kind of code checker to find these bugs?
>
> regards,
> dan carpenter
>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
