From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:30 +0000
Subject: [KJ] [PATCH][1/26 ] arch/i386/math-emu/* - compile warning cleanup
Message-Id: <420BEF86.27720.587CD5@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============091013478677649751=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============091013478677649751==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/arch/i386/math-emu/fpu_entry.c linux-2.6.11-rc3-mm/arch/i386/math-emu/fpu_entry.c
--- linux-2.6.11-rc3-mm-original/arch/i386/math-emu/fpu_entry.c	2005-02-03 03:56:35.000000000 +0200
+++ linux-2.6.11-rc3-mm/arch/i386/math-emu/fpu_entry.c	2005-02-08 16:38:38.000000000 +0200
@@ -742,7 +742,8 @@ int save_i387_soft(void *s387, struct _f
   S387->fcs &= ~0xf8000000;
   S387->fos |= 0xffff0000;
 #endif /* PECULIAR_486 */
-  __copy_to_user(d, &S387->cwd, 7*4);
+  if (__copy_to_user(d, &S387->cwd, 7*4))
+    return -1;
   RE_ENTRANT_CHECK_ON;
 
   d += 7*4;
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/arch/i386/math-emu/reg_ld_str.c linux-2.6.11-rc3-mm/arch/i386/math-emu/reg_ld_str.c
--- linux-2.6.11-rc3-mm-original/arch/i386/math-emu/reg_ld_str.c	2005-02-03 03:56:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/arch/i386/math-emu/reg_ld_str.c	2005-02-08 16:36:20.000000000 +0200
@@ -89,12 +89,17 @@ int FPU_tagof(FPU_REG *ptr)
 int FPU_load_extended(long double __user *s, int stnr)
 {
   FPU_REG *sti_ptr = &st(stnr);
+  int user_copy_err;
 
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_READ, s, 10);
-  __copy_from_user(sti_ptr, s, 10);
+  user_copy_err = __copy_from_user(sti_ptr, s, 10);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return TAG_Special;
+  }
   return FPU_tagof(sti_ptr);
 }
 
@@ -240,13 +245,19 @@ int FPU_load_int64(long long __user *_s)
 {
   long long s;
   int sign;
+  int user_copy_err;
   FPU_REG *st0_ptr = &st(0);
 
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_READ, _s, 8);
-  copy_from_user(&s,_s,8);
+  user_copy_err = copy_from_user(&s,_s,8);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return TAG_Special;
+  }
+
   if (s == 0)
     {
       reg_copy(&CONST_Z, st0_ptr);
@@ -859,6 +870,7 @@ int FPU_store_int64(FPU_REG *st0_ptr, u_
   FPU_REG t;
   long long tll;
   int precision_loss;
+  int user_copy_err;
 
   if ( st0_tag == TAG_Empty )
     {
@@ -907,9 +919,14 @@ int FPU_store_int64(FPU_REG *st0_ptr, u_
 
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_WRITE,d,8);
-  copy_to_user(d, &tll, 8);
+  user_copy_err = copy_to_user(d, &tll, 8);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return 0;
+  }
+
   return 1;
 }
 
@@ -1271,15 +1288,21 @@ void frstor(fpu_addr_modes addr_modes, u
   int i, regnr;
   u_char __user *s = fldenv(addr_modes, data_address);
   int offset = (top & 7) * 10, other = 80 - offset;
+  int user_copy_err;
 
   /* Copy all registers in stack order. */
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_READ,s,80);
-  __copy_from_user(register_base+offset, s, other);
-  if ( offset )
-    __copy_from_user(register_base, s+other, offset);
+  user_copy_err = __copy_from_user(register_base+offset, s, other);
+  if ( !user_copy_err && offset )
+    user_copy_err = __copy_from_user(register_base, s+other, offset);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return;
+  }
+
   for ( i = 0; i < 8; i++ )
     {
       regnr = (i+top) & 7;
@@ -1325,6 +1348,7 @@ u_char __user *fstenv(fpu_addr_modes add
     }
   else
     {
+      int user_copy_err;
       RE_ENTRANT_CHECK_OFF;
       FPU_verify_area(VERIFY_WRITE, d, 7*4);
 #ifdef PECULIAR_486
@@ -1336,8 +1360,12 @@ u_char __user *fstenv(fpu_addr_modes add
       I387.soft.fcs &= ~0xf8000000;
       I387.soft.fos |= 0xffff0000;
 #endif /* PECULIAR_486 */
-      __copy_to_user(d, &control_word, 7*4);
+      user_copy_err = __copy_to_user(d, &control_word, 7*4);
       RE_ENTRANT_CHECK_ON;
+
+      if(user_copy_err)
+	EXCEPTION(EX_INTERNAL);
+
       d += 0x1c;
     }
   
@@ -1352,6 +1380,7 @@ void fsave(fpu_addr_modes addr_modes, u_
 {
   u_char __user *d;
   int offset = (top & 7) * 10, other = 80 - offset;
+  int user_copy_err;
 
   d = fstenv(addr_modes, data_address);
 
@@ -1359,11 +1388,14 @@ void fsave(fpu_addr_modes addr_modes, u_
   FPU_verify_area(VERIFY_WRITE,d,80);
 
   /* Copy all registers in stack order. */
-  __copy_to_user(d, register_base+offset, other);
-  if ( offset )
-    __copy_to_user(d+other, register_base, offset);
+  user_copy_err = __copy_to_user(d, register_base+offset, other);
+  if (!user_copy_err && offset )
+    user_copy_err = __copy_to_user(d+other, register_base, offset);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err)
+	EXCEPTION(EX_INTERNAL);
+
   finit();
 }
 




--===============091013478677649751==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============091013478677649751==--
