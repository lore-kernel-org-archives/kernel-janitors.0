From: Tejun Heo <tj@kernel.org>
Date: Mon, 28 Dec 2015 16:10:54 +0000
Subject: Re: sata_mv: Another source code review around exception handling?
Message-Id: <20151228161054.GR5003@mtj.duckdns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567D681E.7050903@users.sourceforge.net>
In-Reply-To: <567D681E.7050903@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello,

On Fri, Dec 25, 2015 at 05:00:30PM +0100, SF Markus Elfring wrote:
> The value "-ENOMEM" will be returned if one of these function calls failed.
> Can it be that any system resources (like memory) are not appropriately
> released if any calls of this sequence succeeded before the failure?

Most of those are managed resources (devm_, pcim_ and so on) and are
released automatically when the driver detaches from the device.

> Is the use of the single jump label "err" also suspicious here?

And that exit label deal with resources which aren't managed - some
just haven't grown managed variant yet while others don't fit the
model too well.

Thanks.

-- 
tejun
