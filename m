From: Glauber Costa <glommer@parallels.com>
Date: Thu, 13 Sep 2012 09:50:05 +0000
Subject: Re: [PATCH] idr: Rename MAX_LEVEL to MAX_ID_LEVEL
Message-Id: <5051AC4D.4050003@parallels.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910131426.GA12431@localhost> <504E1182.7080300@bfs.de> <20120911094823.GA29568@localhost> <20120912160302.ae257eb4.akpm@linux-foundation.org> <20120912233801.GA14638@localhost>
In-Reply-To: <20120912233801.GA14638@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, walter harms <wharms@bfs.de>, kernel-janitors@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>

On 09/13/2012 03:38 AM, Fengguang Wu wrote:
> On Wed, Sep 12, 2012 at 04:03:02PM -0700, Andrew Morton wrote:
>> On Tue, 11 Sep 2012 17:48:23 +0800
>> Fengguang Wu <fengguang.wu@intel.com> wrote:
>>
>>> idr: Rename MAX_LEVEL to MAX_IDR_LEVEL
>>>
>>> To avoid name conflicts:
>>>
>>> drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token MAX_LEVEL redefined
>>>
>>> While at it, also make the other names more consistent and
>>> add parentheses.
>>
>> That was a rather modest effort :(
>>
>>  drivers/i2c/i2c-core.c        |    2 +-
>>  drivers/infiniband/core/cm.c  |    2 +-
>>  drivers/pps/pps.c             |    2 +-
>>  drivers/thermal/thermal_sys.c |    2 +-
>>  fs/super.c                    |    2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
>> From: Andrew Morton <akpm@linux-foundation.org>
>> Subject: idr-rename-max_level-to-max_idr_level-fix-fix-2
>>
>> ho hum
>>
>>  lib/idr.c |   14 +++++++-------
> 
> Embarrassing.. Sorry for not build testing it at all!
> 
> Regards,
> Fengguang
> 
You can build test it automatically using Fengguang's 0-day test system.

/me runs
