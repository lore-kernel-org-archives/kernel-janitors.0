From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Sep 2015 12:20:55 +0000
Subject: Re: [PATCH v2] coccinelle: assign signed result to unsigned variable
Message-Id: <560930A7.2070400@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1509261106040.2737@hadrien>
 <1443437687-16559-1-git-send-email-a.hajda@samsung.com>
 <56092D7B.4030106@users.sourceforge.net> <56092E98.9000103@samsung.com>
In-Reply-To: <56092E98.9000103@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

>> How do you think about the reuse of the parameter "--recursive-includes" here?
> 
> Last time I have tried it, kernel source check took more than 10 hours,
> so I gave up.

This is interesting background information.

There are opportunities for more fine-tuning of such a source code analysis,
aren't there?

Regards,
Markus
