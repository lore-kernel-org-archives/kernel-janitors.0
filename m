From: "Carlo Perassi" <carlo@linux.it>
Date: Tue, 29 Mar 2005 14:31:21 +0000
Subject: [KJ] A question about uninitializing static variables
Message-Id: <40875.158.102.162.5.1112106681.squirrel@picard.linux.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.
One of the tasks at http://janitor.kernelnewbies.org/TODO
is described as

"
uninitialize static variables initialized to 0, to make it go to the
.bss, instead of .data.
"

I made two patches for two maintainers which uninitialize some static
int used as module parameters and actually initialized to 0.

One maintainer do not have problems with the patches but the maintainer
of the file the second patch refers to would like to have some kind of
"proof" that "it is still guaranteed that those variables will be
initialized to 0". I wrote him something like "this simple hello module
shows it is still guaranteed..." but it's not enough for him. I guess
he'd like a more formal explanation of the following statement:

An uninitialized static variable of {the kernel, a kernel module} will
be compiled to go to the .bss and it is guaranteed that will be
"zero-ed" there.

Is there someone with a link or something I could send to this
maintainer to show him the reasons why the previous statement is true?
Maybe it could be useful to put this reference in the TODO itself.

Thanks.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
