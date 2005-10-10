From: lounprime@aol.com
Date: Mon, 10 Oct 2005 21:15:16 +0000
Subject: Re: [KJ] Question re make
Message-Id: <8C79BF6D8492F30-520-13348@MBLK-M18.sysops.aol.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59852765666908248=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200510081802.35521.lkml@oxley.org>
In-Reply-To: <200510081802.35521.lkml@oxley.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============59852765666908248==
Content-Type: multipart/alternative;
    boundary="----------=_1128979078-1315-157"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1128979078-1315-157
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

 
obj-m += ixj.o
all:
        make -C /<blah>/<blah>/kernel-2.6.11/linux M=$(PWD)
modules
 
Try adding this to your standalone make file.  I hope this answers
your question.
 
LouNprime@aol.com
 
 
/Lou:-)
 

-----Original Message-----
From: Nishanth Aravamudan <nacc@us.ibm.com>
To: Felix Oxley <lkml@oxley.org>
Cc: kernelnewbies@nl.linux.org; kernel-janitors@lists.osdl.org
Sent: Sat, 8 Oct 2005 22:08:13 -0700
Subject: Re: [KJ] Question re make


On 08.10.2005 [20:08:03 +0100], Felix Oxley wrote:
> 
> > You are "make"ing an object file, not a .c file. Makefiles' syntax is
> > for the target, not the source.
> >
> > make drivers/telephony/ixj.o
> >
> I had tried this all ready and forgot to mention it, but it didn't work at the 

> time.

Were you trying to build ixj as a module? You might have needed

make drivers/telephony/ixj.ko

Not sure, though.

> > Please read the Makefile before posting.
> >
> Which file should I read?

The top-level Makefile gives a good overview of available
targets/syntax. The drivers/telephony/Makefile probably has some
indication of available targets specific to that directory.

> > make M=drivers/telephony
> >
> 
> This does the trick!

Great!

> > > and
> > >         # cc driver/telephony/ixj.cjust gives hundreds of errors.
> >
> > This is just plain silly and why we have a Makefile system in the first
> > place.
> >
> I know, but  I was just trying to exaplan all the methods I had tried.
> I think I must have cocked something up before but it is better now.

Glad you got it figured out.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------------=_1128979078-1315-157
Content-Type: text/html; charset="us-ascii"
Content-Disposition: inline

<HTML><BODY><DIV DEFANGED_style='font-family: "Verdana"; font-size: 10pt;'><DIV>&nbsp;</DIV>
<DIV>obj-m += ixj.o</DIV>
<DIV>all:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make -C /&lt;blah&gt;/&lt;blah&gt;/kernel-2.6.11/linux M=$(PWD)<BR>modules</DIV>
<DIV>&nbsp;</DIV>
<DIV>Try adding this to your standalone make file.&nbsp; I hope this answers</DIV>
<DIV>your question.</DIV>
<DIV>&nbsp;</DIV>
<DIV><A href="mailto:LouNprime@aol.com">LouNprime@aol.com</A></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>/Lou:-)</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>-----Original Message-----<BR>From: Nishanth Aravamudan &lt;nacc@us.ibm.com&gt;<BR>To: Felix Oxley &lt;lkml@oxley.org&gt;<BR>Cc: kernelnewbies@nl.linux.org; kernel-janitors@lists.osdl.org<BR>Sent: Sat, 8 Oct 2005 22:08:13 -0700<BR>Subject: Re: [KJ] Question re make<BR><BR></DIV>
<DEFANGED_STYLE 
.AOLPlainTextBody {
    margin: 0px;
    font-family: Tahoma, Verdana, Arial, Sans-Serif;
    font-size: 12px; 
    color: #000; 
    background-color: #fff; 
}

.AOLPlainTextBody pre {
    font-size: 9pt;
}

.AOLInlineAttachment {
    margin: 10px;
}

.AOLAttachmentHeader {
    border-bottom: 2px solid #E9EAEB;
    background: #F9F9F9;
}

.AOLAttachmentHeader .Title {
    font: 11px Tahoma;
    font-weight: bold;
    color: #666666;
    background: #E9EAEB; 
    padding: 3px 0px 1px 10px;
}

.AOLAttachmentHeader .FieldLabel {
    font: 11px Tahoma; 
    font-weight: bold;
    color: #666666;
    padding: 1px 10px 1px 9px;
}

.AOLAttachmentHeader .FieldValue {
    font: 11px Tahoma; 
    color: #333333;
}

></DEFANGED_STYLE>

<DIV class=AOLPlainTextBody id=AOLMsgPart_1_7903ae4c-3e82-4852-8fb3-9658d56e6f01><PRE><TT>On 08.10.2005 [20:08:03 +0100], Felix Oxley wrote:
&gt; 
&gt; &gt; You are "make"ing an object file, not a .c file. Makefiles' syntax is
&gt; &gt; for the target, not the source.
&gt; &gt;
&gt; &gt; make drivers/telephony/ixj.o
&gt; &gt;
&gt; I had tried this all ready and forgot to mention it, but it didn't work at the 

&gt; time.

Were you trying to build ixj as a module? You might have needed

make drivers/telephony/ixj.ko

Not sure, though.

&gt; &gt; Please read the Makefile before posting.
&gt; &gt;
&gt; Which file should I read?

The top-level Makefile gives a good overview of available
targets/syntax. The drivers/telephony/Makefile probably has some
indication of available targets specific to that directory.

&gt; &gt; make M=drivers/telephony
&gt; &gt;
&gt; 
&gt; This does the trick!

Great!

&gt; &gt; &gt; and
&gt; &gt; &gt;         # cc driver/telephony/ixj.cjust gives hundreds of errors.
&gt; &gt;
&gt; &gt; This is just plain silly and why we have a Makefile system in the first
&gt; &gt; place.
&gt; &gt;
&gt; I know, but  I was just trying to exaplan all the methods I had tried.
&gt; I think I must have cocked something up before but it is better now.

Glad you got it figured out.

Thanks,
Nish
</TT></PRE></DIV><!-- end of AOLMsgPart_1_7903ae4c-3e82-4852-8fb3-9658d56e6f01 -->
<DIV class=AOLPlainTextBody id=AOLMsgPart_2_7903ae4c-3e82-4852-8fb3-9658d56e6f01><PRE><TT>_______________________________________________
Kernel-janitors mailing list
<A href="mailto:Kernel-janitors%40lists.osdl.org">Kernel-janitors@lists.osdl.org</A>
<A href="https://lists.osdl.org/mailman/listinfo/kernel-janitors" target=_blank>https://lists.osdl.org/mailman/listinfo/kernel-janitors</A>
</TT></PRE></DIV><!-- end of AOLMsgPart_2_7903ae4c-3e82-4852-8fb3-9658d56e6f01 --></DIV></BODY></HTML>

------------=_1128979078-1315-157--

--===============59852765666908248==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59852765666908248==--
