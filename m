From: walter harms <wharms@bfs.de>
Date: Tue, 20 May 2014 12:52:02 +0000
Subject: Re: [PATCH 1/8] staging: r8712u: Remove useless return variables
Message-Id: <537B4FF2.4010502@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400582028-24990-1-git-send-email-peter.senna@gmail.com> <537B38FF.4050106@bfs.de> <20140520114113.GG15585@mwanda>
In-Reply-To: <20140520114113.GG15585@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>, devel@driverdev.osuosl.org, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>



Am 20.05.2014 13:41, schrieb Dan Carpenter:
> Those concerns are valid but the code was like that in the original so
> we should merge this patch as is and hope some volunteer will fix things
> up in a follow on patch.
> 
> Fixing them in this patch would be a mistake anyway because of the one
> thing per patch rule.
> 

I see this as a bordercase, the patch from Peter is correct in the context of
removing useless return variables. I question the whole function in the hope
that the maintainer will decide that the function can go completely.

re,
 wh
