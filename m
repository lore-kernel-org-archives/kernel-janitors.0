From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 10:37:08 +0000
Subject: [KJ] [patch 2.6.13-rc1 10/23][RESEND] printk :
Message-Id: <20050708103708.GR4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92274628082637111=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92274628082637111==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
printk() calls should include appropriate KERN_* constant.


Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/um/drivers/mconsole_kern.c
===================================================================
--- 2.6.13-rc1.orig/arch/um/drivers/mconsole_kern.c
+++ 2.6.13-rc1/arch/um/drivers/mconsole_kern.c
@@ -557,7 +557,7 @@ static int create_proc_mconsole(void)
 
 	ent = create_proc_entry("mconsole", S_IFREG | 0200, NULL);
 	if(ent == NULL){
-		printk("create_proc_mconsole : create_proc_entry failed\n");
+		printk(KERN_INFO "create_proc_mconsole : create_proc_entry failed\n");
 		return(0);
 	}
 

--===============92274628082637111==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92274628082637111==--
