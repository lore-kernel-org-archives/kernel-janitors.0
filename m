From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 23 Sep 2016 13:30:06 +0000
Subject: Re: GPU-DRM-QXL: Move three assignments in qxl_device_init()
Message-Id: <CACvgo53Fc+xFeGnmmdDJJjrgmB3vA77gct4EngONuZ+Xym4_gQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
 <f7eb26ad-39be-2918-627b-5f4981d07808@users.sourceforge.net>
 <20160922100257.GN13620@mwanda> <45c2ad6e-fadc-8d4a-f6bd-ddf8604ec622@users.sourceforge.net>
 <20160922202419.GP13620@mwanda> <CAOw6vbL79fDPpo8jJ4j9tkHGhJipP+k6izPQ7JjyJxJVhMXp2w@mail.gmail.com>
 <CAPM=9twZjDec3dk0y5UN0HHx_pR-kiaf9+Q7n5E2_=v6TgQ=Lw@mail.gmail.com> <65f2917b-4264-01a3-2441-367d1e3a313b@users.sourceforge.net>
In-Reply-To: <65f2917b-4264-01a3-2441-367d1e3a313b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Dave Airlie <airlied@gmail.com>, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, Daniel Vetter <daniel.vetter@ffwll.ch>, Tejun Heo <tj@kernel.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

On 23 September 2016 at 09:50, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> Markus, please contact the list in advance in future before posting a bunch
>> of patches that don't fix any problems.
>
> I am trying to improve various open issues also in Linux source files.
>
That the fact that you see issues (in these particular cases) while
others do not indicates that the commit summary could be explained
better.

A good commit summary should provide enough information to do that and
make people _want_ the patch. From my limited experience through your
patches (just skimmed a few) you seems to be describing what the patch
does as opposed to why it does it and why should one find it
interesting/wanted.

You might want to read through the following [1] [2] and many others
that exist out there.

-Emil

[1] http://chris.beams.io/posts/git-commit/
[2] http://who-t.blogspot.fi/2009/12/on-commit-messages.html
