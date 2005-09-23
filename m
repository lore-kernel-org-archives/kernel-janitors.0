From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 09:05:26 +0000
Subject: [KJ] [PATCH] printk : arch/alpha/kernel/signal.c
Message-Id: <20050923090526.GH10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93890177726115009=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============93890177726115009==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/signal.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/signal.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/signal.c
@@ -478,7 +478,7 @@ setup_frame(int sig, struct k_sigaction 
 	wrusp((unsigned long) frame);
 	
 #if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
+	printk(KERN_DEBUG "SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
 		current->comm, current->pid, frame, regs->pc, regs->r26);
 #endif
 
@@ -540,7 +540,7 @@ setup_rt_frame(int sig, struct k_sigacti
 	wrusp((unsigned long) frame);
 
 #if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
+	printk(KERN_DEBUG "SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
 		current->comm, current->pid, frame, regs->pc, regs->r26);
 #endif
 


--===============93890177726115009==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93890177726115009==--
