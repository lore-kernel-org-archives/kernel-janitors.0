From: walter harms <wharms@bfs.de>
Date: Tue, 22 May 2007 12:08:36 +0000
Subject: Re: [KJ] what's the value of "NORET_TYPE"?
Message-Id: <4652DD44.7030108@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705211425310.25535@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705211425310.25535@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


i have a (wild) guess
gcc supports an __attribute__ ((noreturn)). To make stuff compatible sometime ago
someone decided he will need it.

IMHO remove it look like ancient

see also: http://www.ussg.iu.edu/hypermail/linux/kernel/9605/1957.html

re,
 wh


Robert P. J. Day wrote:
>   what exactly is the rationale behind the macro NORET_TYPE?
> 
> $ grep -r "define.*NORET_TYPE" *
> include/linux/ext4_fs.h:# define NORET_TYPE    /**/
> include/linux/ext3_fs.h:# define NORET_TYPE    /**/
> include/linux/linkage.h:#define NORET_TYPE    /**/
> $
> 
>   oooooookay, so ... what's up with this?
> 
> rday
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
