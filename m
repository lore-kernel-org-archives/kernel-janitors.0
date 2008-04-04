From: walter harms <WHarms@bfs.de>
Date: Fri, 04 Apr 2008 14:44:40 +0000
Subject: Re: any value to numerous checks of "#ifdef __GNUC__"?
Message-Id: <47F63ED8.9080505@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Robert P. J. Day wrote:
>   there are numerous header files that contain a check of the form
> 
>     #ifdef __GNUC__
> 
> but <linux/compiler.h> already insists on a GNU C-flavoured compiler:
> 
> #if __GNUC__ >= 4
> # include <linux/compiler-gcc4.h>
> #elif __GNUC__ = 3 && __GNUC_MINOR__ >= 2
> # include <linux/compiler-gcc3.h>
> #else
> # error Sorry, your compiler is too old/not recognized.
> #endif
> 
>   so is there any point in keeping all those checks around?  is it
> even remotely feasible that the kernel might someday support a non-GNU
> C compiler, given the numerous gcc extensions that are used?
> 
> rday
> --
> 

hi,
so far i know the intel compiler can compile a linux kernel.
ntl. this is most likely crap since the compiler is checked much more early.
(or at least should).
I only reason i can think of is that this module is used in other places outside
the linux kernle tree.

re,
 wh






