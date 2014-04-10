From: Tilman Schmidt <tilman@imap.cc>
Date: Thu, 10 Apr 2014 11:16:52 +0000
Subject: Re: [patch] isdnloop: several buffer overflows
Message-Id: <1397128612.21813.104938677.2F2327F5@webmail.messagingengine.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140408092309.GA26450@mwanda>
 <20140408.124253.1716775944053750290.davem@davemloft.net>
In-Reply-To: <20140408.124253.1716775944053750290.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: dan.carpenter@oracle.com, isdn@linux-pingi.de, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 8, 2014, at 18:42, David Miller wrote:
> 
> Applied and queued up for -stable, thanks.
> 
> This thing is marked broken-on-smp so the impact is very close to zero.

isdnloop is a loopback test driver for the deprecated old ISDN4Linux
subsystem.
I doubt anyone is still interested in it.

-- 
Tilman Schmidt
tilman@imap.cc
