From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 11 Jul 2005 10:37:03 +0000
Subject: Re: [KJ] [PATCH 00/20] Fix "nocast type" warnings
Message-Id: <200507111437.03797.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507102317.52514.victor@cetuc.puc-rio.br>
In-Reply-To: <200507102317.52514.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 11 July 2005 03:17, Victor Fusco wrote:
> The following series of patches fixes the sparse warning 
> "implicit cast to nocast type" in some subsystems/files.

A couple of advices:
1) $ echo 'QUILT_DIFF_OPTS="-p"' >>~/.quiltrc   or similar.

2) Subject lines shoudn't be 1:1 cloned.
	[PATCH 01/20] xfs: Fix "nocast type" warnings
   or
	[PATCH 02/20] selinux: Fix "nocast type" warnings
   is much, much better. Subject lines are in Linus's shortlogs, and
   kernel.org/git/ summaries/shortlogs.

P. S.: I'm in the middle of net/sctp/* mess (not funny). You can ignore nocast
       warnings there, if you haven't fixed them yet. If they are already
       fixed, oh, well...
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
