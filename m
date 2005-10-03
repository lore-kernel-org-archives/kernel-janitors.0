From: Dinolinux <anton.slack@tele2.no>
Date: Mon, 03 Oct 2005 12:47:28 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/doublefault.c
Message-Id: <43413F12.5010705@tele2.no>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============058845862438917429=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003110453.GA10630@rhum.iomeda.fr>
In-Reply-To: <20051003110453.GA10630@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============058845862438917429==
Content-Type: multipart/alternative;
    boundary="----------=_1128342328-29159-230"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1128342328-29159-230
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Christophe Lucas wrote:

>slackfan@users.sourceforge.net (slackfan@users.sourceforge.net) wrote:
>  
>
>>signed-off-by: Anton Brondz
>>
>>--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 03:00:41.000000000 +0000
>>+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-03 12:36:30.000000000 +0000
>>@@ -23,23 +23,23 @@ static void doublefault_fn(void)
>> 	store_gdt(&gdt_desc);
>> 	gdt = gdt_desc.address;
>> 
>>-	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
>>+	printk(KERN_WARNING "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
>>    
>>
>
>When a double fault happens we are not in good terms with os ;)
>So I don't think KERN_WARNING, KERN_NOTICE, KERN_ERR are the good flags.
>I think the issue is in KERN_CRIT, KERN_EMERG, KERN_ALERT.
>
>Please read it (Debugging by printing : printk):
>
>	http://lwn.net/images/pdf/LDD3/ch04.pdf
>
>Have a nice day,
>
>			- Christophe (clucas@rotomalug.org)
>
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>Kernel-janitors mailing list
>Kernel-janitors@lists.osdl.org
>https://lists.osdl.org/mailman/listinfo/kernel-janitors
>  
>
Now I've made some editing on the patch. I don't want to send the whole
thing now as there may be some more editing. I'll put only the lines
with the constants here now.

*printk(KERN_ALERT "double fault, gdt at %08lx [%d bytes]\n", gdt,
gdt_desc.size);*
KERN_ALERT because it prints the address of the double fault which
requires immediate action.

*printk(KERN_CRIT "double fault, tss at %08lx\n", tss);*
KERN_CRIT because it prints the tss address.
*
printk(KERN_CRIT "eip = %08lx, esp = %08lx\n", t->eip, t->esp);
*KERN_CRIT because it prints eip and esp address.

*printk(KERN_CRIT "eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
                t->eax, t->ebx, t->ecx, t->edx);
*KERN_CRIT because it prints eax, ebx, ecx and edx address.

*printk(KERN_CRIT "esi = %08lx, edi = %08lx\n",
                t->esi, t->edi);
*KERN_CRIT because it prints esi and edi address.

Hope this is better, so I can send the patch. ;-)

------------=_1128342328-29159-230
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Christophe Lucas wrote:
<blockquote cite="mid20051003111256.GB10630@rhum.iomeda.fr" type="cite">
  <pre wrap=""><a class="moz-txt-link-abbreviated" href="mailto:slackfan@users.sourceforge.net">slackfan@users.sourceforge.net</a> (<a class="moz-txt-link-abbreviated" href="mailto:slackfan@users.sourceforge.net">slackfan@users.sourceforge.net</a>) wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">signed-off-by: Anton Brondz

--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 03:00:41.000000000 +0000
+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-03 12:36:30.000000000 +0000
@@ -23,23 +23,23 @@ static void doublefault_fn(void)
 	store_gdt(&amp;gdt_desc);
 	gdt = gdt_desc.address;
 
-	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
+	printk(KERN_WARNING "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
    </pre>
  </blockquote>
  <pre wrap=""><!---->
When a double fault happens we are not in good terms with os ;)
So I don't think KERN_WARNING, KERN_NOTICE, KERN_ERR are the good flags.
I think the issue is in KERN_CRIT, KERN_EMERG, KERN_ALERT.

Please read it (Debugging by printing : printk):

	<a class="moz-txt-link-freetext" href="http://lwn.net/images/pdf/LDD3/ch04.pdf">http://lwn.net/images/pdf/LDD3/ch04.pdf</a>

Have a nice day,

			- Christophe (<a class="moz-txt-link-abbreviated" href="mailto:clucas@rotomalug.org">clucas@rotomalug.org</a>)

  </pre>
  <pre wrap="">
<hr size="4" width="90%">
_______________________________________________
Kernel-janitors mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Kernel-janitors@lists.osdl.org">Kernel-janitors@lists.osdl.org</a>
<a class="moz-txt-link-freetext" href="https://lists.osdl.org/mailman/listinfo/kernel-janitors">https://lists.osdl.org/mailman/listinfo/kernel-janitors</a>
  </pre>
</blockquote>
Now I've made some editing on the patch. I don't want to send the whole
thing now as there may be some more editing. I'll put only the lines
with the constants here now.<br>
<br>
<b>printk(KERN_ALERT "double fault, gdt at %08lx [%d bytes]\n", gdt,
gdt_desc.size);</b><br>
KERN_ALERT because it prints the address of the double fault which
requires immediate action.<br>
<br>
<b>printk(KERN_CRIT "double fault, tss at %08lx\n", tss);</b><br>
KERN_CRIT because it prints the tss address.<br>
<b><br>
printk(KERN_CRIT "eip = %08lx, esp = %08lx\n", t-&gt;eip, t-&gt;esp);<br>
</b>KERN_CRIT because it prints eip and esp address.<br>
<br>
<b>printk(KERN_CRIT "eax = %08lx, ebx = %08lx, ecx = %08lx, edx =
%08lx\n",<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; t-&gt;eax, t-&gt;ebx, t-&gt;ecx, t-&gt;edx);<br>
</b>KERN_CRIT because it prints eax, ebx, ecx and edx address.<br>
<br>
<b>printk(KERN_CRIT "esi = %08lx, edi = %08lx\n",<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; t-&gt;esi, t-&gt;edi);<br>
</b>KERN_CRIT because it prints esi and edi address.<br>
<br>
Hope this is better, so I can send the patch. <span
 class="moz-smiley-s3"><span> ;-) </span></span><br>
</body>
</html>

------------=_1128342328-29159-230--

--===============058845862438917429==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============058845862438917429==--
