From: "tom hisch" <t.hisch@gmail.com>
Date: Fri, 07 Jul 2006 13:09:01 +0000
Subject: Re: [KJ] [Kj] [PATCH] drivers/acpi/cm_sbs.c: if statement moved
Message-Id: <8ef77f2e0607070609g321fbe5bv577316c0b156461a@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0085833141=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
In-Reply-To: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0085833141==
Content-Type: multipart/alternative;
    boundary="----------=_1152277760-8327-651"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1152277760-8327-651
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

sorry for the mistake with the "h" in the patch. here is the new patch

--- linux-2.6/drivers/acpi/cm_sbs.c.orig        2006-07-06 23:54:
04.000000000 +0200
+++ linux-2.6/drivers/acpi/cm_sbs.c     2006-07-07 15:07:57.000000000 +0200
@@ -69,10 +69,10 @@ void acpi_unlock_ac_dir(struct proc_dir_
        down(&cm_sbs_sem);
        if (acpi_ac_dir_param) {
                lock_ac_dir_cnt--;
-       }
-       if (lock_ac_dir_cnt == 0 && acpi_ac_dir_param && acpi_ac_dir) {
-               remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);
-               acpi_ac_dir = 0;
+               if (lock_ac_dir_cnt == 0 && acpi_ac_dir) {
+                       remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);
+                       acpi_ac_dir = 0;
+               }
        }
        up(&cm_sbs_sem);
 }


On 7/7/06, tom hisch <t.hisch@gmail.com> wrote:
>
> hello.
>
> this is my first "little" patch it only moves an if statement in
> drivers/acpi/cm_sbs.c
> Any recommendations on this are welcome.
>
> ------
> thomas hisch
>
>
> --- linux-2.6/drivers/acpi/cm_sbs.c.orig        2006-07-06 23:54:
> 04.000000000 +0200
> +++ linux-2.6/drivers/acpi/cm_sbs.c     2006-07-07 14:54:49.000000000+0200
> @@ -1,4 +1,4 @@
> -/*
> +h/*
>   *
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   *
>   *  This program is free software; you can redistribute it and/or modify
> @@ -69,10 +69,10 @@ void acpi_unlock_ac_dir(struct proc_dir_
>         down(&cm_sbs_sem);
>         if (acpi_ac_dir_param) {
>                 lock_ac_dir_cnt--;
> -       }
> -       if (lock_ac_dir_cnt == 0 && acpi_ac_dir_param && acpi_ac_dir) {
> -               remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);
> -               acpi_ac_dir = 0;
> +               if (lock_ac_dir_cnt == 0 && acpi_ac_dir) {
> +                       remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);
> +                       acpi_ac_dir = 0;
> +               }
>         }
>         up(&cm_sbs_sem);
>  }
>
>

------------=_1152277760-8327-651
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

sorry for the mistake with the &quot;h&quot; in the patch. here is the new patch<br><br>--- linux-2.6/drivers/acpi/cm_sbs.c.orig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2006-07-06 23:54:04.000000000 +0200<br>+++ linux-2.6/drivers/acpi/cm_sbs.c&nbsp;&nbsp;&nbsp;&nbsp; 2006-07-07 15:07:
57.000000000 +0200<br>@@ -69,10 +69,10 @@ void acpi_unlock_ac_dir(struct proc_dir_<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; down(&amp;cm_sbs_sem);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acpi_ac_dir_param) {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lock_ac_dir_cnt--;<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lock_ac_dir_cnt == 0 &amp;&amp; acpi_ac_dir_param &amp;&amp; acpi_ac_dir) {
<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_ac_dir = 0;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lock_ac_dir_cnt == 0 &amp;&amp; acpi_ac_dir) {<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);
<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_ac_dir = 0;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; up(&amp;cm_sbs_sem);<br>&nbsp;}<br><br><br><div><span class="gmail_quote">On 7/7/06, <b class="gmail_sendername">tom hisch</b> &lt;<a href="mailto:t.hisch@gmail.com">
t.hisch@gmail.com</a>&gt; wrote:</span><blockquote class="gmail_quote" DEFANGED_style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div>hello.<br><br>this is my first &quot;little&quot; patch it only moves an if statement in drivers/acpi/cm_sbs.c
<br>Any recommendations on this are welcome.<br><br>------<br>thomas hisch<br><br><br>--- linux-2.6/drivers/acpi/cm_sbs.c.orig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2006-07-06 23:54:
04.000000000 +0200<br>+++ linux-2.6/drivers/acpi/cm_sbs.c&nbsp;&nbsp;&nbsp;&nbsp; 2006-07-07 14:54:49.000000000 +0200<br>@@ -1,4 +1,4 @@<br>-/*<br>+h/*<br>&nbsp; * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>&nbsp; *
<br>
&nbsp; *&nbsp; This program is free software; you can redistribute it and/or modify<br>@@ -69,10 +69,10 @@ void acpi_unlock_ac_dir(struct proc_dir_<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; down(&amp;cm_sbs_sem);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acpi_ac_dir_param) {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lock_ac_dir_cnt--;
<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lock_ac_dir_cnt == 0 &amp;&amp; acpi_ac_dir_param &amp;&amp; acpi_ac_dir) {<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_ac_dir = 0;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lock_ac_dir_cnt == 0 &amp;&amp; acpi_ac_dir) {
<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_ac_dir = 0;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; up(&amp;cm_sbs_sem);<br>&nbsp;}<br><br>

</div></blockquote></div><br>

------------=_1152277760-8327-651--

--===============0085833141==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0085833141==--
