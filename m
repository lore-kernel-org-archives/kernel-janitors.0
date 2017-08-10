From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 20:21:15 +0000
Subject: Re: [PATCH] drm: Shift wrap bug in create_in_format_blob()
Message-Id: <20170810202115.6jdmnusnhb2fc3g7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809111906.4rv3hzritctfktv3@mwanda>
 <20170809143650.ql6juzihjfylebft@art_vandelay>
 <CAPj87rNrFXUTByzCTr8h28ieskEo+HB21RtfZ2KNCBXGQ+ShZg@mail.gmail.com>
In-Reply-To: <CAPj87rNrFXUTByzCTr8h28ieskEo+HB21RtfZ2KNCBXGQ+ShZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sean Paul <seanpaul@chromium.org>, Ben Widawsky <ben@bwidawsk.net>, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>

On Wed, Aug 09, 2017 at 03:38:33PM +0100, Daniel Stone wrote:
> On 9 August 2017 at 15:36, Sean Paul <seanpaul@chromium.org> wrote:
> > On Wed, Aug 09, 2017 at 02:19:06PM +0300, Dan Carpenter wrote:
> >> "plane->format_count" can go up to 64.  (It's capped in
> >> drm_universal_plane_init().)  So we should be using ULL type instead of
> >> int here to prevent shift wrapping.
> >>
> >> Fixes: db1689aa61bd ("drm: Create a format/modifier blob")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thank you for the fix, Dan.
> >
> > I've applied it to drm-misc-next.
> 
> Yes, thanks Dan!
> 
> Out of interest, how was this found? With sparse?
> 

These are Smatch checks that I haven't totally cleaned up enough to
publish yet.  I have a couple versions of this check.  This one is doing
cross function analysis so it knows that ->format_count can go up to 64
bits.

regards,
dan carpenter

