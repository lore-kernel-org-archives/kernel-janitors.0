From: walter harms <wharms@bfs.de>
Date: Sun, 27 Feb 2005 16:17:36 +0000
Subject: [KJ] question ACPI & CMPXCHG
Message-Id: <4221F2A0.5050105@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46454212177382492=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502271349.20737.vicente.feito@gmail.com>
In-Reply-To: <200502271349.20737.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============46454212177382492==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi list,
when i was looking into arch/i386/kernel/acpi/boot.c

i found:

#ifndef __HAVE_ARCH_CMPXCHG
#warning ACPI uses CMPXCHG, i486 and later hardware
#endif


perhaps its nitpicking but ...
I think the setup should disable ACPI if CMPXCHG does not exist.
second best generate at least an error ! compile time these day is short 
and you have a good change to miss warnings.

re,
	walter


(since i have no idea about the setup, no patch)

re,
	walter


quick fix (better example) , hopyfully someone can find some better text


--- boot.c.org  2005-02-27 17:10:24.000000000 +0100
+++ boot.c      2005-02-27 17:11:58.000000000 +0100
@@ -82,7 +82,7 @@
  #endif

  #ifndef __HAVE_ARCH_CMPXCHG
-#warning ACPI uses CMPXCHG, i486 and later hardware
+#error  ACPI requires CMPXCHG
  #endif

  #define MAX_MADT_ENTRIES       256

--===============46454212177382492==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46454212177382492==--
