From: Jonathan Stafford <thecabinet@gmail.com>
Date: Sat, 26 Feb 2005 02:08:47 +0000
Subject: [KJ] [PATCH] arch/i386/kernel/acpi/boot.c
Message-Id: <7a4211f805022518082a5c12a4@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41151081775008169=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41151081775008169==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I've never done any kernel work before, but the gcc 4 warning fixes
seems like a fairly easy place to start.  As there will ultimately be
several hundred patches, is there are particular order to fix these?
I've been tinkering with them simply in compiled order.

Should I be sending/cc'ing these patches to somewhere besides KJML as
I write them?  I know that many of the various parts have their own
mailings lists, but I don't begin to know what all of them are.  What
about trivial patch monkey?

Thanks,
jonathan

Here's my first would-be patch; anything I should change?
==============================================

Description: Fixes gcc 4 warnings.  See
http://marc.theaimsgroup.com/?t=110348353800003 for details

Signed-off-by: Jonathan Stafford <thecabinet@gmail.com>

diff -Nru a/arch/i386/kernel/acpi/boot.c b/arch/i386/kernel/acpi/boot.c
--- a/arch/i386/kernel/acpi/boot.c      2005-02-24 04:36:13 -05:00
+++ b/arch/i386/kernel/acpi/boot.c      2005-02-24 04:36:13 -05:00
@@ -153,7 +153,7 @@
                mapped_size += PAGE_SIZE;
        }

-       return ((unsigned char *) base + offset);
+       return ((char *) base + offset);
 }
 #endif

--===============41151081775008169==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41151081775008169==--
