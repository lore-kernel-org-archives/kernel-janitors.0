From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Mon, 21 Nov 2011 06:33:56 +0000
Subject: Re: [patch] caif: fix endian conversion in cffrml_transmit()
Message-Id: <20111121063356.GH2203@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121061722.GD7354@elgon.mountain>
In-Reply-To: <20111121061722.GD7354@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sjur Braendeland <sjur.brandeland@stericsson.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 21, 2011 at 09:17:22AM +0300, Dan Carpenter wrote:
> The "tmp" variable here is used to store the result of cpu_to_le16()
> so it should be a u16 instead of an int.  We want the high bits set
> and the current code works on little endian systems but not on big
> endian systems.

Charming...  On b-e we end up feeding zeroes instead of the value we want.

However, that u16 clearly ought to be __le16 - it's there for purpose.
