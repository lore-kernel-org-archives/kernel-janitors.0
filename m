From: David Miller <davem@davemloft.net>
Date: Mon, 18 Feb 2013 19:45:54 +0000
Subject: Re: [PATCH] ethernet: neterion: vxge: vxge-traffic.c: fix for a potential NULL pointer dereference
Message-Id: <20130218.144554.1124057233943399415.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1361037394-14731-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1361037394-14731-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gmate.amit@gmail.com
Cc: jdmason@kudzu.us, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Sat, 16 Feb 2013 09:56:34 -0800

> fix for a potential NULL pointer dereference and removal of a redundant
> assignment operation. Found using smatch.
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>

Obviously whoever wrote this code intended for ALARM_CLEARED
and EVENT_UNKNOWN events to not be logged.

But you're changing that.

I'm not applying this patch, sorry.
