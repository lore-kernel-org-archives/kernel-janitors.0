From: Jesse Millan <jesse.millan@gmail.com>
Date: Wed, 20 Apr 2005 18:19:15 +0000
Subject: [KJ] Re: Audit return codes (Question about getting started)
Message-Id: <42669D23.9010501@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


I just want to make sure that I understand the process correctly:

For example, take kalloc(). If I find instances that that the return
value is not checked (and I have) i.e. they call kalloc() and
automatically assume success and dereference the allocated memory
without checking for NULL. I would insert to proper error checking,
create the patch and mail the patch to kernel-janitors@lists.osdl.org?

Is this the process?

Thanks.


Jesse Millan wrote:
> Is anyone already working on this?
> 
> Its the first item in the TODO list:
> 
> http://janitor.kernelnewbies.org/TODO
> 
> I am looking for an easy project. I am a total newbie, but I want to get
> involved with Kernel Janitors.
> 
> Thanks.
> 

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-3285
Fax: (503) 725-6487
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

Recursive: Adj. See Recursive.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
