From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 08:25:16 +0000
Subject: Re: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
Message-Id: <20200714082516.GZ2571@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200626103959.GC314359@mwanda>
 <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
In-Reply-To: <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, VMware Graphics <linux-graphics-maintainer@vmware.com>, dri-devel@lists.freedesktop.org

On Tue, Jul 14, 2020 at 03:39:13AM +0200, Roland Scheidegger wrote:
> Am 26.06.20 um 12:39 schrieb Dan Carpenter:
> > These if statements are supposed to be true if we ended the
> > list_for_each_entry() loops without hitting a break statement but they
> > don't work.
> > 
> > In the first loop, we increment "i" after the "if (i = unit)" condition
> > so we don't necessarily know that "i" is not equal to unit at the end of
> > the loop.
> So, if I understand this right, this would only really be a problem if
> there's no list entries at all, right? That is i = unit = 0.
> Not sure if that can actually happen, but in any case the fix looks correct.

An empty list and there is another potential issue where unit is exactly
off by one.

	list_for_each_entry(con, &dev_priv->dev->mode_config.connector_list,
			    head) {
		if (i = unit)
			break;
		++i;  <-- this is the last iteration and it's off by one
			  so now i = unit but we didn't exit via the
			  break statement.
	}

	if (i != unit) {
            ^^^^^^^^^
Since we didn't exit by the break statement we want this to be true but
it's false instead.

		DRM_ERROR("Could not find initial display unit.\n");

I don't know how *likely* this is, but static checkers complain.
Technically correct is the best kind of correct!  ;)

regards,
dan carpenter
