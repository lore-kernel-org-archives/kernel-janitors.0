From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Wed, 21 Jan 2004 18:47:54 +0000
Subject: Re: [PATCH] mm/pdflush.c - handle kernel_thread failure
Message-Id: <20040121184754.GA17659@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040121183259.GA17474@eugeneteo.net>
In-Reply-To: <20040121183259.GA17474@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<quote sender="Randy.Dunlap">
> On Thu, 22 Jan 2004 02:32:59 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:
> 
> | A similar patch is included in 2.6.1-kj1. I am resubmitting
> | this with a couple of amendments - store the return value to
> | pid_t type variable, and use C99 __func__ instead.
> | 

[snip]

> Nope.  As Andrew pointed out to me:
> "Nope, if we fail to start a thread here we'll just try again later. 
> There's no need to warn."

All right. Make sense. 

Eugene

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }



-------------------------------------------------------
The SF.Net email is sponsored by EclipseCon 2004
Premiere Conference on Open Tools Development and Integration
See the breadth of Eclipse activity. February 3-5 in Anaheim, CA.
http://www.eclipsecon.org/osdn
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
