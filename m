From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sun, 08 Aug 2010 10:25:07 +0000
Subject: Re: [PATCH 2/2] drivers/mtd/ubi: Eliminate update of
Message-Id: <1281263107.2384.13.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008071109140.5821@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008071109140.5821@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Sat, 2010-08-07 at 11:09 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> list_for_each_entry uses its first argument to move from one element to the
> next, so modifying it can break the iteration.  The variable re1 is already
> used within the loop as a temporary variable, and is not live here.

Looks good, thanks, I'll push it to the UBI tree a bit later.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

