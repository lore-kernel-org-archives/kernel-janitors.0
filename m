From: Domen Puncer <domen@coderock.org>
Date: Sun, 23 May 2004 07:09:31 +0000
Subject: [Kernel-janitors] Re: request_region() on sound/oss/wavfront.c.
Message-Id: <20040523070931.GA1623@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33481425342843796=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040522224343.GA1643@masina>
In-Reply-To: <20040522224343.GA1643@masina>
To: kernel-janitors@vger.kernel.org

--===============33481425342843796==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22/05/04 22:12 -0300, Gustavo Franco wrote:
> Domen Puncer wrote:
> 
> >On 23/05/04 00:43 +0200, Domen Puncer wrote:
> > 
> >
> >>On 22/05/04 18:54 -0300, Gustavo Franco wrote:
> >>
> >>   
> >>
> >>>+++ sound/oss/wavfront.c  2004-05-22 18:28:38.000000000 -0300
> >>>+       if (!request_region (io_base, 16, "wavefront")) {
> >>>     
> >>>
> >>Few lines later there is a:
> >>	dev.base = io_base;
> >>So this will print ugly error messages.
> >>   
> >>
> Sorry, but do you mean KERN_ERR ones?

I mean error messeges below request_region's that will fail.

 
> >>   
> >>
> >>>+       if(!request_region (dev.base+2, 6, "wavefront synth")) {
> >>>+               if(!request_region (dev.base+8, 8, "wavefront fx")) {
> >>>     
> >>>
> >>IMHO, you can just get rid of latter 2 request_region's.
> >>   
> >>
> >
> >Ehm, no, damn. Comment above check_region states that device can take
> >up 8 ports.
> >
> >So if there is another device on base+8 this wont work correctly (if that
> >device registred it's region before, even the old code wont work ok).
> >
> > 
> >
> What? Can you summarize your two messages? Check that both 
> request_region() cited
> by you above were not added by me, i've added a return check only.

Yes, i know that, but the request_region you added causes the other two
to fail. (You can't request same region twice)
It seems right to me to request_region(base, 8) where check_region is
now, and another (base+8, 8) before fx detection.

> 
> 
> Thanks,
> --
> Gustavo Franco

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============33481425342843796==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33481425342843796==--
