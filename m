From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 May 2014 11:41:13 +0000
Subject: Re: [PATCH 1/8] staging: r8712u: Remove useless return variables
Message-Id: <20140520114113.GG15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400582028-24990-1-git-send-email-peter.senna@gmail.com>
 <537B38FF.4050106@bfs.de>
In-Reply-To: <537B38FF.4050106@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>, devel@driverdev.osuosl.org, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

Those concerns are valid but the code was like that in the original so
we should merge this patch as is and hope some volunteer will fix things
up in a follow on patch.

Fixing them in this patch would be a mistake anyway because of the one
thing per patch rule.

regards,
dan carpenter
