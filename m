From: "tom hisch" <t.hisch@gmail.com>
Date: Tue, 11 Jul 2006 20:48:34 +0000
Subject: Re: [KJ] [Patch] acpi: remove unnecassary check of
Message-Id: <8ef77f2e0607111348n19072dco794b02612fec40fe@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0490411516=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607071044u64f2cf23pa22846e77f0fc3af@mail.gmail.com>
In-Reply-To: <8ef77f2e0607071044u64f2cf23pa22846e77f0fc3af@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0490411516==
Content-Type: multipart/alternative;
    boundary="----------=_1152650988-17892-624"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1152650988-17892-624
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/7/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> On Fri, Jul 07, 2006 at 07:44:50PM +0200, tom hisch wrote:
> > it removes an unnecassary check of acpi_ac_dir_param.
>
> No. it doesn't. ;-) Every single user of acpi_unlock_ac_dir() passes to
> it, guess what? Right, value returned from acpi_lock_ac_dir() which is
> valid pointer by that time.


sorry but I don't understand what can happen between the two checks ??

tom

------------=_1152650988-17892-624
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><div><span class="gmail_quote">On 7/7/06, <b class="gmail_sendername">Alexey Dobriyan</b> &lt;<a href="mailto:adobriyan@gmail.com">adobriyan@gmail.com</a>&gt; wrote:</span><blockquote class="gmail_quote" DEFANGED_style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Fri, Jul 07, 2006 at 07:44:50PM +0200, tom hisch wrote:<br>&gt; it removes an unnecassary check of acpi_ac_dir_param.<br><br>No. it doesn't. ;-) Every single user of acpi_unlock_ac_dir() passes to<br>it, guess what? Right, value returned from acpi_lock_ac_dir() which is
<br>valid pointer by that time.</blockquote><div><br>sorry but I don't understand what can happen between the two checks ?? <br></div><br>tom<br></div><br>

------------=_1152650988-17892-624--

--===============0490411516==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0490411516==--
