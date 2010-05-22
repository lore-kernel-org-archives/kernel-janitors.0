From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sat, 22 May 2010 09:25:47 +0000
Subject: Re: [PATCH 12/27] drivers/ieee1394: Use memdup_user
Message-Id: <4BF7A31B.2040302@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221021460.13021@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005221021460.13021@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> Use memdup_user when user data is immediately copied into the
> allocated region.

Looks nice.  We won't apply janitorial updates to drivers/ieee1394
anymore though, since it is made obsolete by drivers/firewire and to be
removed sooner than later.  (I will post a proposed removal schedule
today to make this better known.)
-- 
Stefan Richter
-===-=-=- -=-= =-=-
http://arcgraph.de/sr/
