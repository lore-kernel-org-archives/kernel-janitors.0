From: "Mehul Jani" <mehul.jani@gmail.com>
Date: Fri, 09 Feb 2007 19:38:14 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <cad1dd0a0702091126n3b88810ayef15e612e131c7f0@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0178500235=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0178500235==
Content-Type: multipart/alternative;
    boundary="----------=_1171049197-4282-249"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1171049197-4282-249
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> >     >>>I tried that change in linux-2.6/fs/lockd/mon.c
> >     >>>
> >     >>>static struct rpc_procinfo   nsm_procedures[] = {
> >     >>>[SM_MON] = {
> >     >>>             .p_proc         = SM_MON,
> >     >>>             .p_encode       = (kxdrproc_t) xdr_encode_mon,
> >     >>>             .p_decode       = (kxdrproc_t) xdr_decode_stat_res,
> >     >>>             .p_bufsiz       = max(SM_mon_sz, SM_monres_sz) << 2,
> >
> >     Will work since both SM_mon_sz and SM_monres_sz are compile-time
> >     constants, not true?
> >
> >     [ ... snip ... ]
> >
> >
> > So...
> >
> > The patch actually modifies the macro's last line in kernel.h
> >
> > -       _x < _y ? _x : _y; })
> > +       __min(_x, _y); })
> >
> > But what I am unable to understand is why is the compiler unhappy with
> > * _x < _y ? _x : _y; })*
> >
> > and happy with new macro been called internally *__min(_x,_y);*
> Ok, _now_ I see. I used the xdr4.c but mon.c seems happy with the new
> max() (as you asked). Can only say: dunno. It should not make a
> difference.
>
> Richard Knutsson


Richard,

I believe Vignesh had confirmed the patch.....

So now this is going to be crazy we have 3 pairs of min/max to deal with

min()/max()
min_t()/max_t()
__min()/__max()

Can the first one be considered *redundant*

I was wondering that from the very first. calling MACRO(MACRO()) somehow is
dirty....Any suggestions !!

Mehul

------------=_1171049197-4282-249
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br>
<div>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;I tried that change in linux-2.6/fs/lockd/mon.c<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;static struct rpc_procinfo&nbsp;&nbsp; nsm_procedures[] = {
<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;[SM_MON] = {<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = SM_MON,<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_encode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = (kxdrproc_t) xdr_encode_mon,<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_decode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = (kxdrproc_t) xdr_decode_stat_res,
<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_bufsiz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = max(SM_mon_sz, SM_monres_sz) &lt;&lt; 2,<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; Will work since both SM_mon_sz and SM_monres_sz are compile-time<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; constants, not true?<br>&gt;
<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; [ ... snip ... ]<br>&gt;<br>&gt;<br>&gt; So...<br>&gt;<br>&gt; The patch actually modifies the macro&#39;s last line in kernel.h<br>&gt;<br>&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _x &lt; _y ? _x : _y; })<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __min(_x, _y); })
<br>&gt;<br>&gt; But what I am unable to understand is why is the compiler unhappy with<br>&gt; * _x &lt; _y ? _x : _y; })*<br>&gt;<br>&gt; and happy with new macro been called internally *__min(_x,_y);*<br>Ok, _now_ I see. I used the 
xdr4.c but mon.c seems happy with the new<br>max() (as you asked). Can only say: dunno. It should not make a difference.<br><br>Richard Knutsson</blockquote>
<div>&nbsp;</div>
<div>Richard,</div>
<div>&nbsp;</div>
<div>I believe Vignesh had confirmed the patch.....</div>
<div>&nbsp;</div>
<div>So now this is going to be crazy we have 3 pairs of min/max to deal with </div>
<div>&nbsp;</div>
<div>min()/max()</div>
<div>min_t()/max_t()</div>
<div>__min()/__max() </div>
<div>&nbsp;</div>
<div>Can the first one be considered *redundant*</div><br>I was wondering that from the very first. calling MACRO(MACRO()) somehow is dirty....Any suggestions !!</div>
<div>&nbsp;</div>
<div>Mehul</div>
<div><br>&nbsp;</div>

------------=_1171049197-4282-249--

--===============0178500235==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0178500235==--
