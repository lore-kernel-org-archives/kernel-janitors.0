From: Dave Airlie <airlied@gmail.com>
Date: Thu, 07 Jan 2010 03:48:49 +0000
Subject: Re: [PATCH] drm/radeon/radeon_cp.c: check for invalid radeon family
Message-Id: <21d7e9971001061948m466e0abdwb03ceef2cb947687@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1262136235.8733.33.camel@ICE-BOX>
In-Reply-To: <1262136235.8733.33.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 30, 2009 at 11:23 AM, Darren Jenkins
<darrenrjenkins@gmail.com> wrote:
> If there is an invalid radeon family the fw_name is NULL and causes an
> NULL pointer dereference.
> This just adds a check for something unexpected.
>

Same as for last one, unless a developer explicity writes code wrong,
this cannot
happen, and I'd prefer a developer would see an oops.

Dave.
