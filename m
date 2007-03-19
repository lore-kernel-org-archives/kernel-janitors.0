From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 19 Mar 2007 16:32:07 +0000
Subject: Re: [KJ] SEC() and MSEC() and USEC() macros
Message-Id: <20070319163207.GE774@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703191148570.12453@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703191148570.12453@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 19.03.2007 [11:51:23 -0400], Robert P. J. Day wrote:
> 
>   no, it's not a serious proposal but, boy, wouldn't it have made the
> code more readable if someone had defined macros/inline functions like
> sec(), msec() and usec() rather than cluttering up the code with
> things like "22*HZ/10" and "30*HZ/100".
> 
>   just thinking out loud, don't take it seriously.

Uh... You mean jiffies_to_msecs, jiffies_to_usecs (and their opposites)?

Note, you have to be careful with rounding, so you may need to add 1 to
the return of these *functions* (macros would be a terrible idea :)

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
