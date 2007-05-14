From: "pradeep singh" <2500.pradeep@gmail.com>
Date: Mon, 14 May 2007 08:24:55 +0000
Subject: [KJ] Re: [RFC]__sock_create() change
Message-Id: <366312910705140112o43a009dbo5870eebc9158d612@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7727382928605300527=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <464816F9.90208@anaconda.cs.pub.ro>
In-Reply-To: <464816F9.90208@anaconda.cs.pub.ro>
To: kernel-janitors@vger.kernel.org

--===============7727382928605300527==
Content-Type: multipart/alternative; 
	boundary="----=_Part_144381_32797258.1179130375090"

------=_Part_144381_32797258.1179130375090
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 5/14/07, Razvan Deaconescu <razvan@anaconda.cs.pub.ro > wrote:
>
> pradeep singh wrote:
> > Hi All,
> >
> > the __sock_create in net/socket.c has the following code snippet.
> >
> > if (family == PF_INET && type == SOCK_PACKET) {
> >      static int warned;
> >      if (!warned) {
> >           warned = 1;
> >           printk(KERN_INFO "%s uses obsolete (PF_INET,SOCK_PACKET)\n",
> > current->comm);
> >      }
> >      family = PF_PACKET;
> > }
> >
> > this may be in place to emit a harmless warning , but why not change it
> > to -
> > if (family == PF_INET && type == SOCK_PACKET) {
> >
> >      printk(KERN_INFO "%s uses obsolete (PF_INET,SOCK_PACKET)\n",
> > current->comm);
> >
> >      family = PF_PACKET;
> > }
> >
> > Because anyway if(!warning) is going to result in true everytime we
> > enter the function, as static int warning has scope limited to the outer
>
> > if block.
>
> Not quite so. The warning variable may only have scope within its block
> ,but (being static) is stored in a reserved memory area (I think this is
> called linkage ... not sure though). The second time someone would try
> creating a socket using PF_INET and SOCK_PACKET, he/she would not get
> that warning as 'warning' is already set (warning = 1, that is).


You are right indeed, static does have internal linkage.
Messed that up though :-(.

But why would we want
to issues warning only once and not each time the socket is created
for SOCK_PAKCET type?

Thanks for correcting Razvan.

~psr





Razvan
>



-- 
play the game

------=_Part_144381_32797258.1179130375090
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br><div><span class="gmail_quote">On 5/14/07, <b class="gmail_sendername">Razvan Deaconescu</b> &lt;<a href="mailto:razvan@anaconda.cs.pub.ro" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">razvan@anaconda.cs.pub.ro 
</a>&gt; wrote:</span><blockquote class="gmail_quote" style="margin-top: 0; margin-right: 0; margin-bottom: 0; margin-left: 0; margin-left: 0.80ex; border-left-color: #cccccc; border-left-width: 1px; border-left-style: solid; padding-left: 1ex">
  pradeep singh wrote:<br>&gt; Hi All,<br>&gt;<br>&gt; the __sock_create in net/socket.c has the following code snippet.<br>&gt;<br>&gt; if (family == PF_INET &amp;&amp; type == SOCK_PACKET) {<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;static int warned;  
<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!warned) {<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warned = 1;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printk(KERN_INFO &quot;%s uses obsolete (PF_INET,SOCK_PACKET)\n&quot;,<br>&gt; current-&gt;comm);<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;family = PF_PACKET;  
<br>&gt; }<br>&gt;<br>&gt; this may be in place to emit a harmless warning , but why not change it<br>&gt; to -<br>&gt; if (family == PF_INET &amp;&amp; type == SOCK_PACKET) {<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk(KERN_INFO &quot;%s uses obsolete (PF_INET,SOCK_PACKET)\n&quot;,  
<br>&gt; current-&gt;comm);<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;family = PF_PACKET;<br>&gt; }<br>&gt;<br>&gt; Because anyway if(!warning) is going to result in true everytime we<br>&gt; enter the function, as static int warning has scope limited to the outer  
<br>&gt; if block.<br><br>Not quite so. The warning variable may only have scope within its block<br>,but (being static) is stored in a reserved memory area (I think this is<br>called linkage ... not sure though). The second time someone would try  
<br>creating a socket using PF_INET and SOCK_PACKET, he/she would not get<br>that warning as &#39;warning&#39; is already set (warning = 1, that is).</blockquote><div><br>You&nbsp;are&nbsp;right&nbsp;indeed,&nbsp;static&nbsp;does&nbsp;have&nbsp;internal&nbsp;linkage.
<br> Messed that up though :-(.<br><br>But why would we want to&nbsp;issues&nbsp;warning&nbsp;only&nbsp;once&nbsp;and&nbsp;not&nbsp;each&nbsp;time&nbsp;the&nbsp;socket&nbsp;is&nbsp;created&nbsp;for&nbsp;SOCK_PAKCET&nbsp;type?&nbsp;<br> <br>Thanks for correcting Razvan.<br><br>~psr<br> <br><br><br><br>
</div><br><blockquote class="gmail_quote" style="margin-top: 0; margin-right: 0; margin-bottom: 0; margin-left: 0; margin-left: 0.80ex; border-left-color: #cccccc; border-left-width: 1px; border-left-style: solid; padding-left: 1ex">
  Razvan<br></blockquote></div><br><br clear="all"><br>-- <br>play the game   

------=_Part_144381_32797258.1179130375090--

--===============7727382928605300527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============7727382928605300527==--
