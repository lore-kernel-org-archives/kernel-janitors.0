From: Chris Mason <chris.mason@oracle.com>
Date: Mon, 27 Jul 2009 16:28:39 +0000
Subject: Re: [PATCH 9/12] fs/btrfs: Correct redundant test
Message-Id: <20090727162839.GB895@think>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907271814490.2682@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907271814490.2682@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 27, 2009 at 06:15:05PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> dir has already been tested.  It seems that this test should be on the
> recently returned value inode.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://www.emn.fr/x-info/coccinelle/)

Thank you, this is queued up in my tree along with the
other btrfs patches you've sent.

-chris
