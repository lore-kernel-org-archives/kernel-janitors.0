From: Michael Still <mikal@stillhq.com>
Date: Tue, 13 Jan 2004 05:54:03 +0000
Subject: [Kernel-janitors] stat64() series of calls in 2.6.x
Message-Id: <Pine.LNX.4.44.0401131637300.23658-100000@diskbox.stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hey,

I've been looking at the stat64() series of calls in fs/stat.c, which all 
take three arguements: a file descriptor, a pointer to a struct stat64 
buffer, and a long arguement for flags.

The flags arguement is never used, and a google shows me patches to add 
stat64 support to glibc which ignore this argument. I've also checked the 
glibc code from their CVS, and they don't appear to be using this 
argument.

Perhaps I'm blind, but can someone give me a pointer as to why this 
arguement is there? If no one is using it, isn't it a little dangerous 
having it here?

Thanks,
Mikal

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
