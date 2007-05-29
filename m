From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 29 May 2007 15:59:48 +0000
Subject: Re: [KJ] what is it that checks for "__user" annotation?
Message-Id: <20070529085948.11262f25.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705291143340.30993@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705291143340.30993@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 29 May 2007 11:44:49 -0400 (EDT) Robert P. J. Day wrote:

> 
>   i'm aware that the "__user" annotation is strictly for
> documentation, so what is it that uses it to find misuse of user-space
> addresses?  sparse?  anything?

yes, sparse.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
