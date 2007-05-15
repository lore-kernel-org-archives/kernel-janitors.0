From: "pradeep singh" <2500.pradeep@gmail.com>
Date: Tue, 15 May 2007 05:21:36 +0000
Subject: [KJ] Re: [RFC]__sock_create() change
Message-Id: <366312910705142209m5afff096xf26585829d89ec15@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7639054128540754378=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <464816F9.90208@anaconda.cs.pub.ro>
In-Reply-To: <464816F9.90208@anaconda.cs.pub.ro>
To: kernel-janitors@vger.kernel.org

--===============7639054128540754378==
Content-Type: multipart/alternative; 
	boundary="----=_Part_157313_6500281.1179205776102"

------=_Part_157313_6500281.1179205776102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 5/14/07, Arjan van de Ven <arjan@infradead.org> wrote:
>
> On Mon, 2007-05-14 at 13:42 +0530, pradeep singh wrote:
>
> >
> > But why would we want
> > to issues warning only once and not each time the socket is created for
> SOCK_PAKCET type?
>
> because then a normal user can overflood the system log ;)


Oh, that explains a lot.
Thank you Arjan.
~psr




-- 
play the game

------=_Part_157313_6500281.1179205776102
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br><div><span class="gmail_quote">On 5/14/07, <b class="gmail_sendername">Arjan van de Ven</b> &lt;<a href="mailto:arjan@infradead.org">arjan@infradead.org</a>&gt; wrote:</span><blockquote class="gmail_quote" style="margin-top: 0; margin-right: 0; margin-bottom: 0; margin-left: 0; margin-left: 0.80ex; border-left-color: #cccccc; border-left-width: 1px; border-left-style: solid; padding-left: 1ex">
On Mon, 2007-05-14 at 13:42 +0530, pradeep singh wrote:<br><br>&gt;<br>&gt; But why would we want<br>&gt; to issues warning only once and not each time the socket is created for SOCK_PAKCET type?<br><br>because then a normal user can overflood the system log ;)
</blockquote><div><br>Oh,&nbsp;that&nbsp;explains&nbsp;a&nbsp;lot.<br>Thank&nbsp;you&nbsp;Arjan.<br>~psr&nbsp;</div><br></div><br><br clear="all"><br>-- <br>play the game 

------=_Part_157313_6500281.1179205776102--

--===============7639054128540754378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============7639054128540754378==--
