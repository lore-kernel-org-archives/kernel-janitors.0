From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Fri, 13 Apr 2007 13:38:32 +0000
Subject: Re: [KJ] Confusion about build cycle and vmlinux/bzImage (need
Message-Id: <alpine.DEB.0.83.0704130933020.14011@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
In-Reply-To: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>  I did the same tests as you you did, and I could prove the difference, but
> if you compile with optimization flags -O and -O2, then the generated code
> are the same, inclusive which the same size.
>  Do you know if the kernel is compiled with the optimization flags?

It's the standard Makefile, which seems to have -O2 in it. That should be 
standard unless it's changed to -Os by the config.

And I've been using readelf -a and readelf -x to analyze the changes in 
linux-*/vmlinux and even though the size isn't changing, the contents of 
the file are. Someone on kernelnewbies replied to my thread there that the 
sections are aligned, which does seem to be the case, because the section 
sizes are changing but their positions are sort of countering it.

I'm doing more tests and studying the results. I think the bottom line is 
that the savings aren't going to be actual unless I shrink it enough to 
bring it back across a page boundary, which will then decrease the 
utilization by a page. Which doesn't mean the changes are pointless unless 
it saves enough, but I expect that if I don't prove an actual reduction in 
kernel image size, I'll just be annoying maintainers and my changes will 
be ignored.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
