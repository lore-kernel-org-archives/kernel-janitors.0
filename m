From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:31:51 +0000
Subject: [Kernel-janitors] [PATCH] Check return value in fs/cifs/file.c
Message-Id: <20040103133151.GH21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/cifs-check-ret-d_alloc-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/fs/cifs/file.c 2.6.1-rc1-mm1-fix/fs/cifs/file.c
--- 2.6.1-rc1-mm1/fs/cifs/file.c	2003-12-18 10:57:58.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/fs/cifs/file.c	2004-01-03 20:37:47.000000000 +0800
@@ -1250,6 +1250,10 @@
 		}
 	} else {
 		tmp_dentry = d_alloc(file->f_dentry, qstring);
+		if (!tmp_dentry) {
+			cERROR(1,("could not allocate a dcache entry"));
+			return;
+		}
 		*ptmp_inode = new_inode(file->f_dentry->d_sb);
 		tmp_dentry->d_op = &cifs_dentry_ops;
 		cFYI(0, (" instantiate dentry 0x%p with inode 0x%p ",

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
