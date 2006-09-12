From: Henne <henne@nachtwindheim.de>
Date: Tue, 12 Sep 2006 08:39:24 +0000
Subject: [KJ] New idea for the TODO list
Message-Id: <4506723C.2060104@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi there,

I have a new idea for the TODO list.
Sometimes some arguments of functions change in the kernel, but the kerneldoc isn't changed.
The perl-script under scripts/kernel-doc prints error messages when arguments have no description,
but it doesn't print a warning if there's a description for an argument which doesn't exists.
Maybe someone who is familiar with perl or who wants to get it can take a try.

Greets,
Henne

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
