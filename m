From: Robert Hogan <robert@roberthogan.net>
Date: Tue, 17 Apr 2007 18:43:02 +0000
Subject: [KJ] i/o stats in /proc/net/tcp
Message-Id: <200704171943.02655.robert@roberthogan.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This may be a more appropriate question for lkml, but:

Why does /proc/net/tcp not give i/o stats per inode? Briefly looking at 
tcp_ipv4.c and co., it seems none of the sock structures associated with a 
tcp sock contain i/o counters so it may be reasons of non-triviality. That 
said, it does seem as if tcp_input.c and tcp_output.c could implement 
counting if there was a counter available in tcp_sock or the like.

Is there another /proc file that can be used in conjuction with /proc/net/tcp 
to gather per inode i/o stats? 

It just seems like such a natural thing to offer - as a user I'm always 
wondering where that little trickle of i/o on my bw monitor is coming from.

Can someone enlighten me? Where is the best place for this question?


Thanks,
Robert

-- 

KlamAV - An Anti-Virus Manager for KDE - http://www.klamav.net
TorK   - A Tor Controller For KDE      - http://tork.sf.net
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
