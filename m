From: David Miller <davem@davemloft.net>
Date: Tue, 08 Jan 2008 06:38:54 +0000
Subject: Re: [PATCH] /net/bluetooth: Use sockfd_put
Message-Id: <20080107.223854.225989700.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0801061650370.24950@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0801061650370.24950@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: marcel@holtmann.org, maxk@qualcomm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 6 Jan 2008 16:51:45 +0100 (CET)

> The function sockfd_lookup uses fget on the value that is stored in the
> file field of the returned structure, so fput should ultimately be applied
> to this value.  This can be done directly, but it seems better to use the
> specific macro sockfd_put, which does the same thing.

Applied to net-2.6.25, thanks.
