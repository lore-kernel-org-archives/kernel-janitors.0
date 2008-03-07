From: "Kok, Auke" <auke-jan.h.kok@intel.com>
Date: Fri, 07 Mar 2008 18:38:01 +0000
Subject: Re: [E1000-devel] [PATCH] drivers/net: convert & to &&
Message-Id: <47D18B89.4000706@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0803061841000.1669@pc-041.diku.dk>	<1204826347.5541.20.camel@localhost>  <47D032FA.9000909@intel.com> <1204914033.5541.74.camel@localhost>
In-Reply-To: <1204914033.5541.74.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: e1000-devel@lists.sourceforge.net, xfs-masters <xfs-masters@oss.sgi.com>, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org

Joe Perches wrote:
> On Thu, 2008-03-06 at 10:07 -0800, Kok, Auke wrote:
>> (which, BTW also could use the uint32_t -> u32 (etc) changes... while you're at it)
> 
> I think this does what you want:
> 
> for size in "8" "16" "32" "64" ; do \
> sed -r -i -e 's/\bu_{0,1}int'$size'_t\b/u'$size'/g' \
> $(grep -rPlw --include=*.[ch] 'u_{0,1}int'$size'_t' drivers/net/e1000 drivers/net/ixgb); done
> 
> But why?  boolean_t is used by 3 subsystems with local typedefs.
> These others are much more frequently used by kernel source.

afaik they're really meant for userspace related code and don't belong in our
driver from that perspective.

> $ grep -rPlw --include=*.[ch] "u{0,1}_{0,1}int(8|16|32|64)_t" * | wc -l
> 876

yes, a lot of that *is* userspace related code.

do the same search in drivers/net/ .... you'll see the only drivers using this for
everything is our old drivers...

Auke
