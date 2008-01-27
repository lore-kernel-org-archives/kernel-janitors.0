From: "Paolo Ciarrocchi" <paolo.ciarrocchi@gmail.com>
Date: Sun, 27 Jan 2008 23:10:32 +0000
Subject: #if 0
Message-Id: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,
I'm failing to understand why the following patch is changing the md5sum
of the relative .o file

-#if 0
-void Un_impl(void)
-{
-  u_char byte1, FPU_modrm;
-  unsigned long address = FPU_ORIG_EIP;
-
-  RE_ENTRANT_CHECK_OFF;
-  /* No need to check access_ok(), we have previously fetched these bytes. */
-  printk("Unimplemented FPU Opcode at eip=%p : ", (void __user *) address);
-  if ( FPU_CS = __USER_CS )
-    {
-      while ( 1 )
-       {
-         FPU_get_user(byte1, (u_char __user *) address);
-         if ( (byte1 & 0xf8) = 0xd8 ) break;
-         printk("[%02x]", byte1);
-         address++;
-       }
-      printk("%02x ", byte1);
-      FPU_get_user(FPU_modrm, 1 + (u_char __user *) address);
-
-      if (FPU_modrm >= 0300)
-       printk("%02x (%02x+%d)\n", FPU_modrm, FPU_modrm & 0xf8, FPU_modrm & 7);
-      else
-       printk("/%d\n", (FPU_modrm >> 3) & 7);
-    }
-  else
-    {
-      printk("cs selector = %04x\n", FPU_CS);
-    }
-
-  RE_ENTRANT_CHECK_ON;
-
-  EXCEPTION(EX_Invalid);
-
-}
-#endif  /*  0  */

Isn't the code included in the #if 0 #endif section supposed to be
ignored by the compiler?

I'm compiling as follow:
make clean && make arch/x86/math-emu/errors.o
before and after the patch.
And comparing the md5sum of the two .o files using the md5sum command.

Thanks!

Ciao,
-- 
Paolo
http://paolo.ciarrocchi.googlepages.com/
