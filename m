From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sun, 16 Oct 2005 21:41:50 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/kprobes.c
Message-Id: <20051016214150.GH28213@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24329444578842097=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4352D95D.8090308@users.sourceforge.net>
In-Reply-To: <4352D95D.8090308@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============24329444578842097==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16.10.2005 [22:51:09 +0000], slackfan@users.sourceforge.net wrote:
> Signed-off-by: Anton Brondz <anton.slack@tele2.no>
> 
> *--- linux-2.6.14-rc4.orig/arch/i386/kernel/kprobes.c	2005-10-11 
> 01:19:19.000000000 +0000*
> *+++ linux-2.6.14-rc4/arch/i386/kernel/kprobes.c	2005-10-16 
> 22:42:30.000000000 +0000*
> @@ -521,11 +521,11 @@ int __kprobes longjmp_break_handler(stru
> 		if (&regs->esp != jprobe_saved_esp) {
> 			struct pt_regs *saved_regs =
> 			    container_of(jprobe_saved_esp, struct pt_regs, 
> 			    esp);
> -			printk("current esp %p does not match saved esp 
> %p\n",
> +			printk(KERN_WARN "current esp %p does not match 
> saved esp %p\n",
> 			       &regs->esp, jprobe_saved_esp);
> -			printk("Saved registers for jprobe %p\n", jp);
> +			printk(KERN_INFO "Saved registers for jprobe %p\n", 
> jp);
> 			show_registers(saved_regs);
> -			printk("Current registers\n");
> +			printk(KERN_INFO "Current registers\n");
> 			show_registers(regs);
> 			BUG();
> 		}
> 
> 
> Just a small patch this time. Hope it'll work.

Your patches should always include a description of what they do. Your
e-mails containing patches should always indicate what they are doing
concisely in the subject line. It is not necessary, though, to give the
exact file being modified, e.g. I would have simply put, as the subject,
"kprobes: use appropriate KERN_* in printk".

Also, it's probably best to put your comments *before* the patch, not
after.

Care to redo?

Thanks,
Nish

--===============24329444578842097==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24329444578842097==--
