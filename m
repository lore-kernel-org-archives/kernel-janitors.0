From: "Dan Carpenter" <error27@gmail.com>
Date: Tue, 03 Oct 2006 09:07:06 +0000
Subject: Re: [KJ] memory leak?
Message-Id: <a63d67fe0610030207t66a71a77yd2923e865d865b5a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90610022330h5fea626aha58011043899dd@mail.gmail.com>
In-Reply-To: <80ec54e90610022330h5fea626aha58011043899dd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 10/2/06, Daniel Marjam=E4ki <daniel.marjamaki@gmail.com> wrote:
> Hello friends!
>
> I believe I have found a memory leak. Can somebody please verify
> before I submit it in the bugs database?
>
> Kernel: 2.6.18
>
> In linux/drivers/block/cpqarray.c:  ida_ctlr_ioctl
> I believe the pointer "p" can cause a memory leak.
> Check out "switch(io->cmd)" at the end of the function. All cases
> except "default" will cause p to be deallocated.
>
> Best regards,
> Daniel Marjam=E4ki

Nope.  False positive.  On the default case p isn't allocated.

Are you using a some kind of code checker to find these bugs?

regards,
dan carpenter

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
