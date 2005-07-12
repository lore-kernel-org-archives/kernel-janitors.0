From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 12 Jul 2005 12:03:36 +0000
Subject: [KJ] [patch 2.6.13-rc1 17/23] Audit return code of create_proc_*
Message-Id: <20050712120336.GE4712@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67822000354836565=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707154638.321093000@rhum.iomeda.fr>
In-Reply-To: <20050707154638.321093000@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============67822000354836565==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/ppc/platforms/residual.c
===================================================================
--- 2.6.13-rc1.orig/arch/ppc/platforms/residual.c
+++ 2.6.13-rc1/arch/ppc/platforms/residual.c
@@ -1024,9 +1024,13 @@ static int proc_prep_residual_read(char 
 int __init
 proc_prep_residual_init(void)
 {
+	struct proc_dir_entry *ent;
 	if (have_residual_data)
-		create_proc_read_entry("residual", S_IRUGO, NULL,
+		ent = create_proc_read_entry("residual", S_IRUGO, NULL,
 					proc_prep_residual_read, NULL);
+		if (!ent)
+			printk(KERN_WARNING 
+				"residual: Unable to create /proc entry.\n");
 	return 0;
 }
 

--===============67822000354836565==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67822000354836565==--
