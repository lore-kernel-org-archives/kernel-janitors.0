From: "Mehul Jani" <mehul.jani@gmail.com>
Date: Thu, 08 Feb 2007 09:41:41 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <cad1dd0a0702080129o1edbd30aq376e5f3b9b67c949@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1019588460=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============1019588460==
Content-Type: multipart/alternative;
    boundary="----------=_1170927021-28857-32"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1170927021-28857-32
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I had started the activity. changed the handcrafted MAX macro to *max* from
the kernel.h in the xdr4.c file ( no quite sure of the complete file name)

the max macro is applied in struct , i changed it and recompile failed.


On 2/8/07, Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> On Thu, Feb 08, 2007 at 01:51:45AM +0200, Ahmed S. Darwish wrote:
> > It seems that no one is assigned the Min and Max macro job. I'll take
> > it if no one seems interested.
> >
> > Well, I hope this to become my last brain-dead patch series :).
>
> Be very very careful to not add integer overflows.
>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>

------------=_1170927021-28857-32
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>I had started the activity. changed the handcrafted MAX macro to *max* from the kernel.h in the xdr4.c file ( no quite sure of the&nbsp;complete file name)&nbsp;&nbsp;<br>&nbsp;</div>
<div>the max macro is applied in struct , i changed it and recompile failed.</div>
<div><br>&nbsp;</div>
<div><span class="gmail_quote">On 2/8/07, <b class="gmail_sendername">Alexey Dobriyan</b> &lt;<a href="mailto:adobriyan@gmail.com">adobriyan@gmail.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Thu, Feb 08, 2007 at 01:51:45AM +0200, Ahmed S. Darwish wrote:<br>&gt; It seems that no one is assigned the Min and Max macro job. I&#39;ll take
<br>&gt; it if no one seems interested.<br>&gt;<br>&gt; Well, I hope this to become my last brain-dead patch series :).<br><br>Be very very careful to not add integer overflows.<br><br>_______________________________________________
<br>Kernel-janitors mailing list<br><a href="mailto:Kernel-janitors@lists.osdl.org">Kernel-janitors@lists.osdl.org</a><br><a href="https://lists.osdl.org/mailman/listinfo/kernel-janitors">https://lists.osdl.org/mailman/listinfo/kernel-janitors
</a><br></blockquote></div><br>

------------=_1170927021-28857-32--

--===============1019588460==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1019588460==--
