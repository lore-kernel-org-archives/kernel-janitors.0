From: Sage Weil <sage@newdream.net>
Date: Wed, 20 Jan 2010 23:18:49 +0000
Subject: Re: [ceph-devel] [PATCH 8/9] fs/ceph: Eliminate useless code
Message-Id: <Pine.LNX.4.64.1001201518230.29039@cobra.newdream.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1001161659520.28745@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1001161659520.28745@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: ceph-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 16 Jan 2010, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> The variable client is initialized twice to the same (side effect-free)
> expression.  Drop one initialization.

Applied to the ceph tree.

Thanks-
sage
