From: walter harms <wharms@bfs.de>
Date: Sun, 10 Sep 2006 15:03:01 +0000
Subject: Re: [KJ] FIx kernel build warnings
Message-Id: <45042925.9040107@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157858661.24136.6.camel@dfarning-desktop>
In-Reply-To: <1157858661.24136.6.camel@dfarning-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi david,

you may try anything that is supported: gcc3 or gcc4 or icc.
other commercial compilers have problems since the kernel build only
with a LOT of gcc features.
beware: some versions of gcc have know problems.
A good way to test is using 'make randconfig'. if you have some experience:
try to use a crosscompiler to check different architectures.

re,
 wh


David Farning wrote:
> I am interested in working on some kj projects.
> 
> First, I thought that I would look at fixing some of the compile
> warning.
> TODO LIST 
> <snip>
> - Fix gcc 4 warnings.
>   [D: http://marc.theaimsgroup.com/?t0348353800003]
>   Note: Set CONFIG_DEBUG_INFO=n to make compiles faster and smaller.
> 
> The thread link looks pretty old.  Which version of gcc should the kernel be compiled against.
> 
> David Farning
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
