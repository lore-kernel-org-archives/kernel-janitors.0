From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Aug 2017 12:14:26 +0000
Subject: Re: [PATCH] staging: pi433: remove some macros, introduce some inline functions
Message-Id: <20170802121426.l3wmnyeeoig3p44u@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee876334d7eb4af0d2277d0b9a61fdb6-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQDVFE=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
 <20170802115330.uvvzqrimbz2ixoyk@mwanda>
 <1105187501.38159.1501675658122@ox.hosteurope.de>
In-Reply-To: <1105187501.38159.1501675658122@ox.hosteurope.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 02, 2017 at 02:07:37PM +0200, Marcus Wolf wrote:
> Hi Dan,
> 
> I get your point and I understand, that there need to be rules to
> simplify the life for the maintainers...
> 
> But I honestly must confess, that at the moment, I don't have the
> time for doing that. I am into two customer projects, that keep me
> very busy these weeks.
> 
> The only thing, I can offer, is to remove all the lines, dealing 
> with the #ifdef DEBUG and leave the rest, as it is and send it again.
> Then all other changes are related to the move from macro to inline...
> If that helps, please let me know.
> 
> If it needs further fragmentation, it'll take something like half 
> a day / a day. I most probably can spent that day end of August, 
> begin of September the earliest.
> 

One trick that might help is you can just use `git citool` and highlight
all the rmw() lines, add selected lines to the commit, then commit that
as one patch.  Repeat for all five patches.

The kernel process does kind of have a steep learning with redoing
patches...  Sorry about that.

regards,
dan carpenter

