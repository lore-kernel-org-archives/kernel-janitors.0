From: Andi Kleen <andi@firstfloor.org>
Date: Mon, 24 Dec 2007 15:31:52 +0000
Subject: Re: [PATCH 7/38] arch/x86/ia32: Use time_before, time_before_eq, etc.
Message-Id: <20071224153152.GA21971@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241522410.23999@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712241522410.23999@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: andi@firstfloor.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 24, 2007 at 03:23:19PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The functions time_before, time_before_eq, time_after, and time_after_eq
> are more robust for comparing jiffies against other values.

The old code was actually correct I think, but the change is ok for me.

-Andi
