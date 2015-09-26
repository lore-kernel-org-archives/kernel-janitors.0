From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Sep 2015 07:45:15 +0000
Subject: Re: [PATCH] coccinelle: assign signed result to unsigned variable
Message-Id: <56064D0B.8060907@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1443099286-16559-1-git-send-email-a.hajda@samsung.com>
 <56041BE5.5010005@users.sourceforge.net> <56051D2B.5040802@samsung.com>
In-Reply-To: <56051D2B.5040802@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> Generally I want to catch all assignments of signed function result to unsigned var.

Such a static source code analysis will be useful to some degree.


> In this script I have implemented it this way:
> 1. Look for all assignments 'unsigned = signed' (rs rule).
> 2. Check if signed from rs rule looks as a function call.

I recommend to reconsider a few implementation details because I have got
the impression that this check sequence is inappropriate.


> Is there better way to do it?

I suggest to fix expression weaknesses and a design mistake in this SmPL approach.

I guess that you want to determine functions with a signed return type first
before corresponding variable assignments will be checked further.
* Would you like to collect function names for this purpose by a general analysis
  of more source files?
  (How do you think about to store them in a dedicated database?)

* Which couple of function calls will be interesting for you?

* Should the search approach take also recursively included files into account?

Regards,
Markus
