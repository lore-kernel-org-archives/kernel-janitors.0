From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Thu, 25 Dec 2008 15:31:37 +0000
Subject: Re: [PATCH 4/7] drivers/media/dvb/firesat: Use DEFINE_SPINLOCK
Message-Id: <4953A759.2070609@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812251534060.22039@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812251534060.22039@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: v4l-dvb-maintainer@linuxtv.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
> in Documentation/spinlocks.txt

Committed to linux1394-2.6.git.  Thanks,
-- 
Stefan Richter
-===-=--- =-- =--http://arcgraph.de/sr/
