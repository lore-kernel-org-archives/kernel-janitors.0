From: Joe Perches <joe@perches.com>
Date: Fri, 07 Mar 2008 18:20:33 +0000
Subject: Re: [E1000-devel] [PATCH] drivers/net: convert & to &&
Message-Id: <1204914033.5541.74.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0803061841000.1669@pc-041.diku.dk>
	 <1204826347.5541.20.camel@localhost>  <47D032FA.9000909@intel.com>
In-Reply-To: <47D032FA.9000909@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kok, Auke" <auke-jan.h.kok@intel.com>
Cc: Julia Lawall <julia@diku.dk>, e1000-devel@lists.sourceforge.net, xfs-masters <xfs-masters@oss.sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2008-03-06 at 10:07 -0800, Kok, Auke wrote:
> (which, BTW also could use the uint32_t -> u32 (etc) changes... while you're at it)

I think this does what you want:

for size in "8" "16" "32" "64" ; do \
sed -r -i -e 's/\bu_{0,1}int'$size'_t\b/u'$size'/g' \
$(grep -rPlw --include=*.[ch] 'u_{0,1}int'$size'_t' drivers/net/e1000 drivers/net/ixgb); done

But why?  boolean_t is used by 3 subsystems with local typedefs.
These others are much more frequently used by kernel source.

$ grep -rPlw --include=*.[ch] "u{0,1}_{0,1}int(8|16|32|64)_t" * | wc -l
876

include/linux/types.h has typedefs for these but not boolean_t

include/linux/types.h:typedef           __u8            u_int8_t;
include/linux/types.h:typedef           __s8            int8_t;
include/linux/types.h:typedef           __u16           u_int16_t;
include/linux/types.h:typedef           __s16           int16_t;
include/linux/types.h:typedef           __u32           u_int32_t;
include/linux/types.h:typedef           __s32           int32_t;
include/linux/types.h:typedef           __u8            uint8_t;
include/linux/types.h:typedef           __u16           uint16_t;
include/linux/types.h:typedef           __u32           uint32_t;
include/linux/types.h:typedef           __u64           uint64_t;
include/linux/types.h:typedef           __u64           u_int64_t;
include/linux/types.h:typedef           __s64           int64_t;

cheers, Joe

