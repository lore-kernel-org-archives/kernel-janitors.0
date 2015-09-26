From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 26 Sep 2015 09:07:57 +0000
Subject: Re: [PATCH] coccinelle: assign signed result to unsigned variable
Message-Id: <alpine.DEB.2.10.1509261106040.2737@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1443099286-16559-1-git-send-email-a.hajda@samsung.com>
 <56041BE5.5010005@users.sourceforge.net> <56051D2B.5040802@samsung.com>
 <56064D0B.8060907@users.sourceforge.net>
In-Reply-To: <56064D0B.8060907@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

To collect function calls that have a return value of a given type t, it
should be sufficient to do the following:

@@
t e;
identifier f;
@@

f(...)@e

The @e notation reaches upwards to match the innermost enclosing term of
the right kind (here expression).

t can of course be arbitrarily complicated.

julia
