From: "Mehul Jani" <mehul.jani@gmail.com>
Date: Thu, 08 Feb 2007 10:42:38 +0000
Subject: Re: [KJ] [Fwd: Re:  Taking the Min and Max macro job]
Message-Id: <cad1dd0a0702080230g4a3c45b9i739959d5b7416253@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0621806447=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1170929465.3571.27.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1170929465.3571.27.camel@wriver-t81fb058.linuxcoe>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0621806447==
Content-Type: multipart/alternative;
    boundary="----------=_1170930711-28857-153"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1170930711-28857-153
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Vignesh,

Thanks for pointing out that its due to the type check.

I was wondering if we can avail the facility of the macros min_t and max_t
,specifing the type as *int* defined in kernel.h

You have given you opinion about kernel_macros.h ....let hear from other
people. ;-)

Mehul Jani


On 2/8/07, Vignesh Babu BM <vignesh.babu@wipro.com> wrote:
>
>
> Mehul,
>
>        I had been on this sometime back. Im not sure if u can change the
> entries in xdr*.c
>        These files use the macro to initialize static struct where u
> cannot
> use statements within expression.
>
>      http://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
>
>        So in the xdr*.c files I think we should not change the macros or
> we
> should be adding one more macro like the ones used in those files to
> kernel.h which does not perform the type check.
>
>        I had one more doubt...I had been through some other files that
> have
> same simple MIN/MAX macros that are like those in xdr*.c. Can we include
> kernel.h in any of these files and remove the extra definition in those
> files?
>        Wouldnt it be better if we declare all the macros in kernel.h in a
> separate file say kernel-macros.h or util-macros.h and have that
> included in the code than including the kernel.h itself as in a number
> of instances we may not need the other entries in kernel.h to be
> accessible in the code.
>
>
> > -------- Forwarded Message --------
> > From: Mehul Jani <mehul.jani@gmail.com>
> > To: kernel-janitors@lists.osdl.org
> > Subject: Re: [KJ] Taking the Min and Max macro job
> > Date: Thu, 8 Feb 2007 14:59:41 +0530
> >
> > I had started the activity. changed the handcrafted MAX macro to *max*
> > from the kernel.h in the xdr4.c file ( no quite sure of the complete
> > file name)
> >
> > the max macro is applied in struct , i changed it and recompile failed.
> >
> >
> > On 2/8/07, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >         On Thu, Feb 08, 2007 at 01:51:45AM +0200, Ahmed S. Darwish
> >         wrote:
> >         > It seems that no one is assigned the Min and Max macro job.
> >         I'll take
> >         > it if no one seems interested.
> >         >
> >         > Well, I hope this to become my last brain-dead patch
> >         series :).
> >
> >         Be very very careful to not add integer overflows.
> >
> >         _______________________________________________
> >         Kernel-janitors mailing list
> >         Kernel-janitors@lists.osdl.org
> >         https://lists.osdl.org/mailman/listinfo/kernel-janitors
> >
> > _______________________________________________
> > Kernel-janitors mailing list
> > Kernel-janitors@lists.osdl.org
> > https://lists.osdl.org/mailman/listinfo/kernel-janitors
> --
> Regards,
> Vignesh Babu BM
> _____________________________________________________________
> "Why is it that every time I'm with you, makes me believe in magic?"
>
>
> The information contained in this electronic message and any attachments
> to this message are intended for the exclusive use of the addressee(s) and
> may contain proprietary, confidential or privileged information. If you are
> not the intended recipient, you should not disseminate, distribute or copy
> this e-mail. Please notify the sender immediately and destroy all copies of
> this message and any attachments.   WARNING: Computer viruses can be
> transmitted via email. The recipient should check this email and any
> attachments for the presence of viruses. The company accepts no liability
> for any damage caused by any virus transmitted by this email.
> www.wipro.com
>

------------=_1170930711-28857-153
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Vignesh,</div>
<div>&nbsp;</div>
<div>Thanks for pointing out that its due to the type check.</div>
<div>&nbsp;</div>
<div>I&nbsp;was wondering if we can avail the facility of the macros min_t and max_t ,specifing the type as *int* defined in kernel.h</div>
<div>&nbsp;</div>
<div>You have given you opinion about kernel_macros.h ....let hear from other people. ;-)</div>
<div>&nbsp;</div>
<div>Mehul Jani<br><br>&nbsp;</div>
<div><span class="gmail_quote">On 2/8/07, <b class="gmail_sendername">Vignesh Babu BM</b> &lt;<a href="mailto:vignesh.babu@wipro.com">vignesh.babu@wipro.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>Mehul,<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I had been on this sometime back. Im not sure if u can change the<br>entries in xdr*.c
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; These files use the macro to initialize static struct where u cannot<br>use statements within expression.<br><br>&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html">http://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
</a><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So in the xdr*.c files I think we should not change the macros or we<br>should be adding one more macro like the ones used in those files to<br>kernel.h which does not perform the type check.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I had one more doubt...I had been through some other files that have
<br>same simple MIN/MAX macros that are like those in xdr*.c. Can we include<br>kernel.h in any of these files and remove the extra definition in those<br>files?<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Wouldnt it be better if we declare all the macros in 
kernel.h in a<br>separate file say kernel-macros.h or util-macros.h and have that<br>included in the code than including the kernel.h itself as in a number<br>of instances we may not need the other entries in kernel.h to be
<br>accessible in the code.<br><br><br>&gt; -------- Forwarded Message --------<br>&gt; From: Mehul Jani &lt;<a href="mailto:mehul.jani@gmail.com">mehul.jani@gmail.com</a>&gt;<br>&gt; To: <a href="mailto:kernel-janitors@lists.osdl.org">
kernel-janitors@lists.osdl.org</a><br>&gt; Subject: Re: [KJ] Taking the Min and Max macro job<br>&gt; Date: Thu, 8 Feb 2007 14:59:41 +0530<br>&gt;<br>&gt; I had started the activity. changed the handcrafted MAX macro to *max*
<br>&gt; from the kernel.h in the xdr4.c file ( no quite sure of the complete<br>&gt; file name)<br>&gt;<br>&gt; the max macro is applied in struct , i changed it and recompile failed.<br>&gt;<br>&gt;<br>&gt; On 2/8/07, Alexey Dobriyan &lt;
<a href="mailto:adobriyan@gmail.com">adobriyan@gmail.com</a>&gt; wrote:<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; On Thu, Feb 08, 2007 at 01:51:45AM +0200, Ahmed S. Darwish<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wrote:<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; It seems that no one is assigned the Min and Max macro job.
<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I&#39;ll take<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; it if no one seems interested.<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Well, I hope this to become my last brain-dead patch<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; series :).<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Be very very careful to not add integer overflows.
<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _______________________________________________<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kernel-janitors mailing list<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="mailto:Kernel-janitors@lists.osdl.org">Kernel-janitors@lists.osdl.org</a><br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="https://lists.osdl.org/mailman/listinfo/kernel-janitors">https://lists.osdl.org/mailman/listinfo/kernel-janitors</a><br>&gt;<br>&gt; _______________________________________________<br>&gt; Kernel-janitors mailing list
<br>&gt; <a href="mailto:Kernel-janitors@lists.osdl.org">Kernel-janitors@lists.osdl.org</a><br>&gt; <a href="https://lists.osdl.org/mailman/listinfo/kernel-janitors">https://lists.osdl.org/mailman/listinfo/kernel-janitors
</a><br>--<br>Regards,<br>Vignesh Babu BM<br>_____________________________________________________________<br>&quot;Why is it that every time I&#39;m with you, makes me believe in magic?&quot;<br><br><br>The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments.&nbsp;&nbsp; WARNING: Computer viruses can be transmitted via email. The recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.&nbsp;&nbsp; 
<a href="http://www.wipro.com">www.wipro.com</a><br></blockquote></div><br>

------------=_1170930711-28857-153--

--===============0621806447==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0621806447==--
