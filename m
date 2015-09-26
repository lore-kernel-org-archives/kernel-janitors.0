From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Sep 2015 09:52:20 +0000
Subject: Re: [PATCH] coccinelle: assign signed result to unsigned variable
Message-Id: <56066AD4.9060306@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1443099286-16559-1-git-send-email-a.hajda@samsung.com>
 <56041BE5.5010005@users.sourceforge.net> <56051D2B.5040802@samsung.com>
 <56064D0B.8060907@users.sourceforge.net>
 <alpine.DEB.2.10.1509261106040.2737@hadrien>
 <56066866.1060602@users.sourceforge.net>
 <alpine.DEB.2.10.1509261144270.2737@hadrien>
In-Reply-To: <alpine.DEB.2.10.1509261144270.2737@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> Your approach finds a function definition.

Yes. - I assumed that it might also be relevant.



> My approach works on the call directly, using whatever type information is available.

The connection between the SmPL specification "f(...)@e" and the desired return type
was not obvious for me so far.

Regards,
Markus
