From: David Farning <dfarning@gmail.com>
Date: Mon, 11 Sep 2006 13:08:42 +0000
Subject: Re: [KJ] Patch acceptance in mainline
Message-Id: <1157980123.4644.5.camel@dfarning-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157789352.7814.11.camel@amol.verismonetworks.com>
In-Reply-To: <1157789352.7814.11.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 2006-09-11 at 17:34 +0530, Amol Lad wrote:
> Hi,
> 
> After submitting patches to kernel janitors, how are they submitted for
> inclusion in the main line kernel ? When it is done ? Who does it ? i.e.
> After submitting a patch to kernel janitors do I need to forward it to
> lkml (ofcourse, after taking all the review comments from here..)
> 
> If the maintainer of the list is submitting the patches for mainline
> inclusion then how would original author would come to know ? Does he
> need to monitor changelogs for every -rc kernel released ?
> 
I am also wondering about the process.  There is an interesting section
in
http://www.kernel.org/pub/software/scm/git/docs/howto/using-topic-branches.txt
about how to track your changes upstream.

<snip>

 $ git-rev-list branchname ^test
or
 $ git-rev-list branchname ^release

[If this branch has not yet been merged you will see a set of SHA1 values
for the commits, if it has been merged, then there will be no output]

Once a patch completes the great cycle (moving from test to release, then
pulled by Linus, and finally coming back into your local "linus" branch)
the branch for this change is no longer needed.  You detect this when the
output from:

 $ git-rev-list branchname ^linus

is empty.  At this point the branch can be deleted:
<snip>

> Please resond. I think FAQ should be also be updated based on the reply
> 
> Thanks
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
