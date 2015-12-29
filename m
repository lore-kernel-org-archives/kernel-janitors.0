From: bojan prtvar <prtvar.b@gmail.com>
Date: Tue, 29 Dec 2015 15:04:41 +0000
Subject: Re: [PATCH] resources: Remove unneeded initialization of local variable
Message-Id: <CAOmT4fRQ1RQeP_hcVX2Z8o+t9dgmkyhriAMd0sbLiSO1_9veaA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451395493-22380-1-git-send-email-prtvar.b@gmail.com>
	<CAH7P7NjofbwyUDjy8bq0NNDr0x_h=xYy9Zm3WxcXK-GhRyJspg@mail.gmail.com>
In-Reply-To: <CAH7P7NjofbwyUDjy8bq0NNDr0x_h=xYy9Zm3WxcXK-GhRyJspg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Navet <laurent.navet@gmail.com>
Cc: toshi.kani@hp.com, dan.j.williams@intel.com, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, jiang.liu@linux.intel.com, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Dec 29, 2015 at 2:36 PM, Laurent Navet <laurent.navet@gmail.com> wrote:
> why not directly ?
>
> struct region_devres *dr = devres_alloc(devm_region_release,
> sizeof(struct region_devres),..
>

I follow Dan's rationale [1]

[1]
http://www.spinics.net/lists/target-devel/msg11355.html
