From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Sep 2015 09:41:58 +0000
Subject: Re: [PATCH] coccinelle: assign signed result to unsigned variable
Message-Id: <56066866.1060602@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1443099286-16559-1-git-send-email-a.hajda@samsung.com>
 <56041BE5.5010005@users.sourceforge.net> <56051D2B.5040802@samsung.com>
 <56064D0B.8060907@users.sourceforge.net>
 <alpine.DEB.2.10.1509261106040.2737@hadrien>
In-Reply-To: <alpine.DEB.2.10.1509261106040.2737@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> To collect function calls that have a return value of a given type t,
> it should be sufficient to do the following:
> 
> @@
> t e;
> identifier f;
> @@
> 
> f(...)@e

Is such a SmPL approach better than a variant like the following?

@find_function@
type t;
identifier f;
@@
 t f(...)
 { ... }

Regards,
Markus
