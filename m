From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 26 Jul 2013 15:51:27 +0000
Subject: Re: Need clearance before sending patch
Message-Id: <alpine.DEB.2.02.1307261746260.2266@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 26 Jul 2013, Kumar Gaurav wrote:

> Hi Dan,
>
> I had sent my first patch with lots of changes which wasn't correct.
> Now i'm splitting them in parts as below:
> 1.One patch for variable name replacement (one patch per file)
> 2.One Patch for fixing coding style issue (one patch per file)
> 3.One Patch for fixing warning about using pr_warn,pr_error functions instead 
> of printk(KERN_WARNING... and printk(KERN_ERR... (havn't replaced yet as last 
> time you weren't convinced)
>
> please tell me that should i apply these patches per file or one patch for 
> replacement in all applied files?

I wonder if one would be better off by starting with small isolated bugs, 
rather than these things that, even though they seem simple, are a bit 
pervasive and rely a lot on taste?

Finding real bugs is not so hard.  One can either use the various tools 
that are provided, or study the git logs to see what kind of bugs others 
have found.

julia
