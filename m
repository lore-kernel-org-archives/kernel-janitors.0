From: Michael Still <mikal@stillhq.com>
Date: Mon, 19 Jan 2004 23:45:25 +0000
Subject: [Kernel-janitors] TODO item: kernel-doc missing parameters
Message-Id: <Pine.LNX.4.44.0401201039140.9691-100000@diskbox.stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hey,

so, I was bored last night and was playing around with the kernel-doc 
build process. It turns out that the documentation is pretty badly out of 
sync with the kernel source itself. 
http://www.stillhq.com/linux/audit-2.6.1-kerneldoc-parammissing lists 1800 
or so instances of a parameter not being documented in the kernel-doc 
comment at the start of a function.

Perhaps we should add to the todo list that these need to be brought up to 
date. This might be as simple as renaming a parameter in the comment, or 
might be as hard as actually understanding the function being documented, 
depending on the instance.

Here's how to generate your own list of missing parameters:

find . -type f -name "*.[ch]" -exec scripts/kernel-doc -man {} 2>> errs \; 
> /dev/null

Then grep for the parameters missing message:

grep "No description found" errs

I'll look into some of these as time provides, but there is so many of 
them that I can't possibly do them all... Offers of help accepted. :)

Cheers,
Mikal

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
