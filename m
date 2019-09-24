From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Sep 2019 06:17:48 +0000
Subject: Re: [PATCH] staging: rtl8188eu: remove dead code in do-while conditional step
Message-Id: <20190924061748.GA27389@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190923194806.25347-1-connor.kuehl@canonical.com>
 <c2ce3fb0-6407-982a-a3f2-172cef17f2a6@lwfinger.net>
In-Reply-To: <c2ce3fb0-6407-982a-a3f2-172cef17f2a6@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Connor Kuehl <connor.kuehl@canonical.com>

On Mon, Sep 23, 2019 at 03:38:39PM -0500, Larry Finger wrote:
> This patch is correct; however, the do..while loop will always be executed

s/correct/harmless/.

> once, thus you could remove the loop and the loop variable bcmd_down.
> 
> @greg: If you would prefer a two-step process, then this one is OK.

It has to be done in one step.

regards,
dan carpenter
