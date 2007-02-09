From: "Mehul Jani" <mehul.jani@gmail.com>
Date: Fri, 09 Feb 2007 12:17:37 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <cad1dd0a0702090405v5c3ab3a1qe35f238f8b51f47f@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0168273199=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0168273199==
Content-Type: multipart/alternative;
    boundary="----------=_1171022872-17721-351"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1171022872-17721-351
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>
> >>>Just went through the archives....
> >>>
> >>>        I tried to recreate the compile-failure (was some time ago
> since
> >>>        it
> >>>        happened) when using min()/max() in a struct but it happily
> compiled it
> >>>        so (thankfully) you are correct, just need to use min()/max().
> :)
> >>>
> >>>        Richard Knutsson
> >>>
> >>>Do you mean to say that you were able to compile when the macros were
> used inside struct?
> >>>Im still not able to get that to happen...
> >>>
> >>>I tried that change in linux-2.6/fs/lockd/mon.c
> >>>
> >>>static struct rpc_procinfo   nsm_procedures[] = {
> >>>[SM_MON] = {
> >>>             .p_proc         = SM_MON,
> >>>             .p_encode       = (kxdrproc_t) xdr_encode_mon,
> >>>             .p_decode       = (kxdrproc_t) xdr_decode_stat_res,
> >>>             .p_bufsiz       = max(SM_mon_sz, SM_monres_sz) << 2,
>
> Will work since both SM_mon_sz and SM_monres_sz are compile-time
> constants, not true?
>
> [ ... snip ... ]


So...

The patch actually modifies the macro's last line in kernel.h

-       _x < _y ? _x : _y; })
+       __min(_x, _y); })

But what I am unable to understand is why is the compiler unhappy with
* _x < _y ? _x : _y; })*

and happy with new macro been called internally *__min(_x,_y);*

Mehul

------------=_1171022872-17721-351
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br>
<div>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>&gt;&gt;&gt;Just went through the archives....<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I tried to recreate the compile-failure (was some time ago since
<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;it<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;happened) when using min()/max() in a struct but it happily compiled it<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;so (thankfully) you are correct, just need to use min()/max(). :)<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Richard Knutsson<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;Do you mean to say that you were able to compile when the macros were used inside struct?<br>&gt;&gt;&gt;Im still not able to get that to happen...<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt;I tried that change in linux-2.6/fs/lockd/mon.c<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;static struct rpc_procinfo&nbsp;&nbsp; nsm_procedures[] = {<br>&gt;&gt;&gt;[SM_MON] = {<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = SM_MON,
<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_encode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = (kxdrproc_t) xdr_encode_mon,<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_decode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = (kxdrproc_t) xdr_decode_stat_res,<br>&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .p_bufsiz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = max(SM_mon_sz, SM_monres_sz) &lt;&lt; 2,
<br><br>Will work since both SM_mon_sz and SM_monres_sz are compile-time<br>constants, not true?<br><br>[ ... snip ... ]</blockquote>
<div>&nbsp;</div>
<div>So...</div>
<div>&nbsp;</div>
<div>The patch actually modifies the macro&#39;s last line in kernel.h</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; _x &lt; _y ? _x : _y; })<br>+ &nbsp; &nbsp; &nbsp; __min(_x, _y); })<br>&nbsp;</div>
<div>But what I am unable to understand is why is the compiler unhappy with </div>
<div>*&nbsp;_x &lt; _y ? _x : _y; })* </div>
<div>&nbsp;</div>
<div>and happy with new macro been called internally *__min(_x,_y);*</div>
<div>&nbsp;</div>
<div>Mehul</div><br>&nbsp;</div>

------------=_1171022872-17721-351--

--===============0168273199==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0168273199==--
