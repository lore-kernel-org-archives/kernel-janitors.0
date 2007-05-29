From: Florian Westphal <fw-kernel@strlen.de>
Date: Tue, 29 May 2007 19:06:51 +0000
Subject: Re: [KJ] why does struct inodes_stat_t include "int dummy[5]"?
Message-Id: <20070529190651.GC11023@Chamillionaire.breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day <rpjday@mindspring.com> wrote:
>   in fact, i did just that, grepping through the tree to see if i
> could spot any definition of that structure for which the "dummy"
> array was referenced, and i didn't find one.  doesn't mean there
> isn't one, only that i didn't notice one.

inode stats are exported via /proc/sys/fs/inode-stats, see
Documentation/sysctl/fs.txt

(on a side note, the docs say there are four dummy values:
'preshrink' got removed and there are now 5 dummies).
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
