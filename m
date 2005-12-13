From: "Jaco Kroon" <jaco@kroon.co.za>
Date: Tue, 13 Dec 2005 14:01:59 +0000
Subject: [KJ] de-initialization of = 0 globals
Message-Id: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Has there been decided on a standard for these?  There are approximately
800  (in just under 500 files) of these statements left in the kernel
sources.

Currently these will read something like:

static int variable_name = 0;

Are we going with

static int variable_name;

or

static int variable_name; /* =0 */

?

Also, if I'm going to be sending patches for these it's obviously a patch
per affected file, so if I'm going to be sending let's say a hundred of
these patches it's still a mail per patch or do I just archive them
somehow and attach them or do I place them on a webserver and mail a uri
to them?


-- 
There are 10 kinds of people in the world, those who understand binary,
and those who don't.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
