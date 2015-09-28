From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Sep 2015 12:55:50 +0000
Subject: Re: [Cocci] [PATCH v2] coccinelle: assign signed result to unsigned variable
Message-Id: <560938D6.70305@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1509261106040.2737@hadrien>
 <1443437687-16559-1-git-send-email-a.hajda@samsung.com>
 <56092D7B.4030106@users.sourceforge.net> <56092E98.9000103@samsung.com>
 <560930A7.2070400@users.sourceforge.net>
 <alpine.DEB.2.10.1509281440320.3108@hadrien>
In-Reply-To: <alpine.DEB.2.10.1509281440320.3108@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> I guess parallelism would be helpful?
> You could try the following options:
> 
> -j n --chunksize 10 --recursive-includes --include-headers-for-types
> 
> where n is the number of cores that you want to use.

Has the make target "coccicheck" direct support for such special parameters?


> Parsed header files will be cached within chunks.

Can the Coccinelle software work together with a kind of "precompiled
header database"?

Regards,
Markus
