From: "Annamalai Prakash" <newblinux@gmail.com>
Date: Fri, 25 May 2007 10:20:28 +0000
Subject: Re: [KJ] TODO: Moduleparam.h
Message-Id: <d701b6e30705250320u15bd2199pe0439d1e21844d98@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7312957326873915883=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <d701b6e30705250205o47fac2b5s10cf924d392954f6@mail.gmail.com>
In-Reply-To: <d701b6e30705250205o47fac2b5s10cf924d392954f6@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============7312957326873915883==
Content-Type: multipart/alternative; 
	boundary="----=_Part_162952_23635517.1180088428824"

------=_Part_162952_23635517.1180088428824
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Robert,

     Thanks for your mail. I will wait for your response on this task.
I took a look on this task today.  As we are removing the moduleparam.h from
module.h,
we have to add #include <linux/moduleparam.h> explicitly in all driver
moduels where
module_param_* macros used. Am I understood correctly ?


 #include <linux/elf.h>
#include <linux/stringify.h>
#include <linux/kobject.h>
-#include <linux/moduleparam.h>

+#include <linux/moduleparam.h> /* Ideally, this shouldn't be necessary.
*/   <--This line should be removed after new patch is ready


+#include <linux/moduleinfo.h
#include <asm/local.h>

~kap

On 5/25/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
> On Fri, 25 May 2007, Annamalai Prakash wrote:
>
> > Hello all,
> >
> >     I would like to start work on Moduleparam  task if no objection. I
> > would to have Robert P. J. Day's
> > http://lkml.org/lkml/2007/5/20/27  as a base.
>
> actually, i was going to take another look at that.  apparently, the
> patch i submitted that should have had no effect broke the build, and
> i have no idea why.  there may be more to this than meets the eye, so
> give me a few days to try again.
>
> rday
> --
> ========================================================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://fsdev.net/wiki/index.php?title=Main_Page
> ========================================================================
>

------=_Part_162952_23635517.1180088428824
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi Robert,</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your mail. I will wait for your response on this task.&nbsp; </div>
<div>I took a look on this task today.&nbsp; As we are removing the moduleparam.h from module.h,</div>
<div>we have to add #include &lt;linux/moduleparam.h&gt; explicitly in all driver moduels where </div>
<div>module_param_* macros used. Am I understood correctly ?</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;#include &lt;linux/elf.h&gt;<br>#include &lt;linux/stringify.h&gt;<br>#include &lt;linux/kobject.h&gt;<br>-#include &lt;linux/moduleparam.h&gt;</div>
<div><br>+#include &lt;linux/moduleparam.h&gt; /* Ideally, this shouldn&#39;t be necessary. */&nbsp;&nbsp; &lt;--This line should be removed after new patch is ready<br>&nbsp;</div>
<div>&nbsp;</div>
<div>+#include &lt;linux/moduleinfo.h<br>#include &lt;asm/local.h&gt;<br><br>~kap<br>&nbsp;</div>
<div><span class="gmail_quote">On 5/25/07, <b class="gmail_sendername">Robert P. J. Day</b> &lt;<a href="mailto:rpjday@mindspring.com">rpjday@mindspring.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Fri, 25 May 2007, Annamalai Prakash wrote:<br><br>&gt; Hello all,<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; I would like to start work on Moduleparam&nbsp;&nbsp;task if no objection. I
<br>&gt; would to have Robert P. J. Day&#39;s<br>&gt; <a href="http://lkml.org/lkml/2007/5/20/27">http://lkml.org/lkml/2007/5/20/27</a>&nbsp;&nbsp;as a base.<br><br>actually, i was going to take another look at that.&nbsp;&nbsp;apparently, the
<br>patch i submitted that should have had no effect broke the build, and<br>i have no idea why.&nbsp;&nbsp;there may be more to this than meets the eye, so<br>give me a few days to try again.<br><br>rday<br>--<br>========================================================================
<br>Robert P. J. Day<br>Linux Consulting, Training and Annoying Kernel Pedantry<br>Waterloo, Ontario, CANADA<br><br><a href="http://fsdev.net/wiki/index.php?title=Main_Page">http://fsdev.net/wiki/index.php?title=Main_Page
</a><br>========================================================================<br></blockquote></div><br>

------=_Part_162952_23635517.1180088428824--

--===============7312957326873915883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============7312957326873915883==--
