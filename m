From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 18 Feb 2006 05:57:22 +0000
Subject: [KJ][Patch] update: Make storage class first
Message-Id: <1140242243.7781.48.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35753083921302231=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35753083921302231==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

Here is a combined patch with an updated justification.

from http://linuxicc.sourceforge.net

ICC warns about :Storage Class is not First.

In the cases below, this is syntactically correct, but a coding style
issue.

Not putting the storage class specifier first:
1) is confusing
2) dilutes the logical meaning of the specifier
3) Issues warnings from ICC
4) is only done like this in 4 files (from looking at ICC warnings)
5) is safe to re-order in non-pointer declarations

The below patches simply re-order the modifiers so that the storage
class is first.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

 --- linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-kiara.h.orig	2006-02-17 21:47:21.000000000 +1100
+++ linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-kiara.h	2006-02-17 21:47:30.000000000 +1100
@@ -37,8 +37,8 @@ struct Kiara_table_entry
 	unsigned char mode[12];		/* precomputed mode settings for cam */
 };
 
-const extern struct Kiara_table_entry Kiara_table[PSZ_MAX][6][4];
-const extern unsigned int KiaraRomTable[8][2][16][8];
+extern const struct Kiara_table_entry Kiara_table[PSZ_MAX][6][4];
+extern const unsigned int KiaraRomTable[8][2][16][8];
 
 #endif
 
--- linux-2.6.16-rc3/arch/i386/kernel/machine_kexec.c.orig	2006-02-17 22:02:14.000000000 +1100
+++ linux-2.6.16-rc3/arch/i386/kernel/machine_kexec.c	2006-02-17 22:07:00.000000000 +1100
@@ -133,9 +133,9 @@ typedef asmlinkage NORET_TYPE void (*rel
 					unsigned long start_address,
 					unsigned int has_pae) ATTRIB_NORET;
 
-const extern unsigned char relocate_new_kernel[];
+extern const unsigned char relocate_new_kernel[];
 extern void relocate_new_kernel_end(void);
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned int relocate_new_kernel_size;
 
 /*
  * A architecture hook called to validate the
--- linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-timon.h.orig	2006-02-17 22:29:16.000000000 +1100
+++ linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-timon.h	2006-02-17 22:29:50.000000000 +1100
@@ -52,8 +52,8 @@ struct Timon_table_entry
 	unsigned char mode[13];		/* precomputed mode settings for cam */
 };
 
-const extern struct Timon_table_entry Timon_table[PSZ_MAX][6][4];
-const extern unsigned int TimonRomTable [16][2][16][8];
+extern const struct Timon_table_entry Timon_table[PSZ_MAX][6][4];
+extern const unsigned int TimonRomTable [16][2][16][8];
 
 
 #endif
--- linux-2.6.16-rc3/fs/nfs/nfs4proc.c.orig	2006-02-17 23:03:04.000000000 +1100
+++ linux-2.6.16-rc3/fs/nfs/nfs4proc.c	2006-02-17 23:03:51.000000000 +1100
@@ -2958,7 +2958,7 @@ static void nfs4_delegreturn_release(voi
 	kfree(calldata);
 }
 
-const static struct rpc_call_ops nfs4_delegreturn_ops = {
+static const struct rpc_call_ops nfs4_delegreturn_ops = {
 	.rpc_call_prepare = nfs4_delegreturn_prepare,
 	.rpc_call_done = nfs4_delegreturn_done,
 	.rpc_release = nfs4_delegreturn_release,



--===============35753083921302231==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35753083921302231==--
