From: Ed Cashin <ecashin@coraid.com>
Date: Sun, 16 May 2010 12:42:59 +0000
Subject: Re: [PATCH 35/37] drivers/block/aoe: Use kmemdup
Message-Id: <FA04A0D0-4BAF-4E1D-B8E8-3148E290009F@coraid.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152323310.21345@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005152323310.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>

On May 15, 2010, at 5:23 PM, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Use kmemdup when some other buffer is immediately copied into the
> allocated region.

I have seen this patch but have no comment about it specifically.

(Because the argument about whether this kind of change
adds value in general has already taken place.  I'd say no, but that's 
based on a maybe faulty idea that if folks weren't doing this they'd have
more time for reviewing patches, etc.)

-- 
  Ed Cashin
  ecashin@coraid.com

