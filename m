From: Carlo Perassi <carlo@linux.it>
Date: Fri, 19 Mar 2004 15:06:59 +0000
Subject: [Kernel-janitors] [PATCH] 81 patches for strings
Message-Id: <20040319150659.GA20615@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.
With some scripting and manual check, I patched 81 files
from
[const] char *foo = "blah";
to
[const] char foo[] = "blah";
(this change makes one variable insted of two variables in the final
assembly output; see line 385 of the TODO file)

I don't attach all the patch files.
A tarball of 81 patch files is here:
http://www.linux.it/~carlo/somehacks/tkp/char81.tar.gz
The text file patches are here:
http://www.linux.it/~carlo/somehacks/tkp/char/
the patch files are in different folders like:
patches_arch/
patches_drivers/
patches_fs/
patches_lib/
patches_net/
patches_sound/

-- 
Carlo Perassi - http://www.linux.it/~carlo/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
