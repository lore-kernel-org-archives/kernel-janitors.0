From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 12 Jan 2004 23:27:40 +0000
Subject: Re: [Kernel-janitors] Documentation/sysctl/vm.txt outdated reference
Message-Id: <20040112152740.654357a8.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 21 Oct 2003 01:42:46 -0400 Patrick McLean <pmclean@linuxfreak.ca> wrote:

| Lines 55 & 56 of Documentation/sysctl/vm.txt:
| 
| See Documentation/vm/overcommit-accounting and
| mm/mmap.c::vm_enough_memory() for more information.
| 
| There is no vm_enough_memory() in mm/mmap.c, the function must have been 
| moved to a new location, and the documentation has not been updated yet.

Yes, patch will be in 2.6.1-kj1 patchset.

Thanks.

--
~Randy
http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
