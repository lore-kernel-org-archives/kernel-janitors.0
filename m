From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Tue, 25 May 2010 23:25:29 +0000
Subject: Re: [PATCH 12/27] drivers/ieee1394: Use memdup_user
Message-Id: <4BFC5C69.4050105@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221021460.13021@ask.diku.dk>	<4BF7A31B.2040302@s5r6.in-berlin.de> <20100525153244.73069b6a.akpm@linux-foundation.org>
In-Reply-To: <20100525153244.73069b6a.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Julia Lawall <julia@diku.dk>, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Andrew Morton wrote:
> On Sat, 22 May 2010 11:25:47 +0200
> Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:
> 
>> Julia Lawall wrote:
>>> Use memdup_user when user data is immediately copied into the
>>> allocated region.
>> Looks nice.  We won't apply janitorial updates to drivers/ieee1394
>> anymore though, since it is made obsolete by drivers/firewire and to be
>> removed sooner than later.  (I will post a proposed removal schedule
>> today to make this better known.)
> 
> I don't see much point in declaring a moratorium against
> drivers/ieee1394.  Perhaps that removal will never happen.

That's a wrong impression due to us driver developers dragging the
coexistence of two driver stacks out for too long.

> Perhaps
> third parties will find reason to revert that removal and to continue
> to maintain drivers/ieee1394.  Perhaps people will take code snippets
> from drivers/ieee1394 and will move them into drivers/firewire.
> 
> The bottom line is that the patch improves the code.  And there ain't
> nothing wrong with having better code.

This code is as good as it needs to be.

Spending time on things that can be done is fun, but spending time on
things that need to be done can't hurt either.
-- 
Stefan Richter
-===-=-=- -=-= =-=-
http://arcgraph.de/sr/
