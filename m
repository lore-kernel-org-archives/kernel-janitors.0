From: "Kovarththanan Rajaratnam" <krj@cs.aau.dk>
Date: Wed, 22 Dec 2004 16:44:39 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <cqc89l$imc$1@sea.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hey

"Andi Kleen" <ak@muc.de> wrote in message
news:20041220080406.GB47521@muc.de...
> >   CC      kernel/acct.o
> > kernel/acct.c: In function ???encode_float???:
> > kernel/acct.c:366: fatal error: internal consistency failure
> > compilation terminated.
>
> I checked this and it doesn't seem to happen with my compiler
> (which is a newer CVS checkout). So I assume it has been fixed already.
>
I just tried to make a new CVS checkout, but I still get the 'internal
consistency failure'. Any advice on what to do?

--
Best Regards
Kovarththanan Rajaratnam





-------------------------------------------------------
SF email is sponsored by - The IT Product Guide
Read honest & candid reviews on hundreds of IT Products from real users.
Discover which products truly live up to the hype. Start reading now. 
http://productguide.itmanagersjournal.com/
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
