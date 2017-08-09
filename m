From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 09 Aug 2017 14:38:33 +0000
Subject: Re: [PATCH] drm: Shift wrap bug in create_in_format_blob()
Message-Id: <CAPj87rNrFXUTByzCTr8h28ieskEo+HB21RtfZ2KNCBXGQ+ShZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809111906.4rv3hzritctfktv3@mwanda> <20170809143650.ql6juzihjfylebft@art_vandelay>
In-Reply-To: <20170809143650.ql6juzihjfylebft@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Paul <seanpaul@chromium.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Ben Widawsky <ben@bwidawsk.net>, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>

On 9 August 2017 at 15:36, Sean Paul <seanpaul@chromium.org> wrote:
> On Wed, Aug 09, 2017 at 02:19:06PM +0300, Dan Carpenter wrote:
>> "plane->format_count" can go up to 64.  (It's capped in
>> drm_universal_plane_init().)  So we should be using ULL type instead of
>> int here to prevent shift wrapping.
>>
>> Fixes: db1689aa61bd ("drm: Create a format/modifier blob")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Thank you for the fix, Dan.
>
> I've applied it to drm-misc-next.

Yes, thanks Dan!

Out of interest, how was this found? With sparse?

Cheers,
Daniel
