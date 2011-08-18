From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Aug 2011 16:24:47 +0000
Subject: Re: [patch 2/2 -next] hid-lg4ff: add a kfree() to an error path
Message-Id: <20110818162447.GE21927@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818134343.GB21927@shale.localdomain>
 <CAMvewQJigdY81gPrpndqV=FxN+cEeif4NkzSbBZKCO4z3guQew@mail.gmail.com>
In-Reply-To: <CAMvewQJigdY81gPrpndqV=FxN+cEeif4NkzSbBZKCO4z3guQew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zic Rim <zicrim@gmail.com>
Cc: Jiri Kosina <jkosina@suse.cz>, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 18, 2011 at 07:59:32PM +0530, Zic Rim wrote:
> There is no leak here. If kzalloc fails , it means memory is not allocated.
> It is wrong to free something that is not allocated .

No.  The entry allocation succeeded and the entry->device_id
allocation failed.  Look again.

regards,
dan carpenter

