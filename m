From: "Breno Leitao" <breno.leitao@gmail.com>
Date: Fri, 13 Apr 2007 13:14:33 +0000
Subject: Re: [KJ] Confusion about build cycle and vmlinux/bzImage (need
Message-Id: <1e464b5b0704130614p7a4c3a09m1b55dacfeb4899ce@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1005795018=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
In-Reply-To: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============1005795018==
Content-Type: multipart/alternative;
    boundary="----------=_1176470308-29801-477"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1176470308-29801-477
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi John,
  I did the same tests as you you did, and I could prove the difference, but
if you compile with optimization flags -O and -O2, then the generated code
are the same, inclusive which the same size.
  Do you know if the kernel is compiled with the optimization flags?

Thanks
Breno Leitao

On 4/12/07, John Anthony Kazos Jr. <jakj@j-a-k-j.com> wrote:
>
> (Meant to CC this list, sorry. Same thread as on kernelnewbies.)
>
> I did a few simple independent tests between 'char *foo = "foo"' and 'char
> foo[] = "foo"' and they confirmed what the KJ docs say, that the latter
> results in a smaller object. So I did a test with <fs/partitions/check.c>.
>
> static char *make_block_name(struct gendisk *disk)
> {
> -       static char *block_str = "block:";
> +       static char block_str[] = "block:";
>
> <fs/partitions/check.o> goes from 8149 bytes to 8137 bytes. 'readelf'
> shows that "block:" got moved from .rodata.str1.1 to .data and a
> relocation token got removed that pointed into .rodata.str1.1, saving 12
> bytes.
>
> <fs/built-in.o> goes from 1337360 to 1337320, saving 40 bytes.
>
> <vmlinux>, however, stays exactly the same, at 4520468 bytes. And
> <arch/i386/boot/bzImage> actually increases from 1702520 to 1072552,
> losing 32 bytes.
>
> I could assume that the latter could be due to happenstance of data
> ordering before compression, but I'm sure I'm looking at the wrong
> pre-compression file. What file should I be looking at if I want the ELF
> image of the kernel fully-built but before the bootsector and so forth get
> added to it?
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
>

------------=_1176470308-29801-477
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi John, <br>&nbsp; I did the same tests as you you did, and I could prove the difference, but if you compile with optimization flags -O and -O2, then the generated code are the same, inclusive which the same size.<br>&nbsp; Do you know if the kernel is compiled with the optimization flags?
<br><br>Thanks<br>Breno Leitao<br><br><div><span class="gmail_quote">On 4/12/07, <b class="gmail_sendername">John Anthony Kazos Jr.</b> &lt;<a href="mailto:jakj@j-a-k-j.com" target="_blank" DEFANGED_onclick="return top.js.OpenExtLink(window,event,this)">
jakj@j-a-k-j.com</a>&gt; wrote:</span><blockquote class="gmail_quote" DEFANGED_style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
(Meant to CC this list, sorry. Same thread as on kernelnewbies.)<br><br>I did a few simple independent tests between &#39;char *foo = &quot;foo&quot;&#39; and &#39;char<br>foo[] = &quot;foo&quot;&#39; and they confirmed what the KJ docs say, that the latter
<br>results in a smaller object. So I did a test with &lt;fs/partitions/check.c&gt;.<br><br>static char *make_block_name(struct gendisk *disk)<br>{<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static char *block_str = &quot;block:&quot;;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static char block_str[] = &quot;block:&quot;;
<br><br>&lt;fs/partitions/check.o&gt; goes from 8149 bytes to 8137 bytes. &#39;readelf&#39;<br>shows that &quot;block:&quot; got moved from .rodata.str1.1 to .data and a<br>relocation token got removed that pointed into .rodata.str1.1, saving 12
<br>bytes.<br><br>&lt;fs/built-in.o&gt; goes from 1337360 to 1337320, saving 40 bytes.<br><br>&lt;vmlinux&gt;, however, stays exactly the same, at 4520468 bytes. And<br>&lt;arch/i386/boot/bzImage&gt; actually increases from 1702520 to 1072552,
<br>losing 32 bytes.<br><br>I could assume that the latter could be due to happenstance of data<br>ordering before compression, but I&#39;m sure I&#39;m looking at the wrong<br>pre-compression file. What file should I be looking at if I want the ELF
<br>image of the kernel fully-built but before the bootsector and so forth get<br>added to it?<br>_______________________________________________<br>Kernel-janitors mailing list<br><a href="mailto:Kernel-janitors@lists.linux-foundation.org" target="_blank" DEFANGED_onclick="return top.js.OpenExtLink(window,event,this)">

Kernel-janitors@lists.linux-foundation.org</a><br><a href="https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors" target="_blank" DEFANGED_onclick="return top.js.OpenExtLink(window,event,this)">https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
</a><br></blockquote></div>
<br>

------------=_1176470308-29801-477--

--===============1005795018==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--===============1005795018==--
