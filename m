From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 04 Dec 2017 15:15:40 +0000
Subject: Re: [PATCH] of: overlay: fix memory leak of ovcs on error exit path
Message-Id: <CAMuHMdX7-MyxysA4HQk1m=jL4ESnfnD_wxCPbv2_JrEc-w5LrQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171129191750.25254-1-colin.king@canonical.com>
 <dcb4e2a4-707b-0ccc-e12b-c6fa4ef251b7@gmail.com> <20171130125002.wlnnev5pjih6d5bz@mwanda>
In-Reply-To: <20171130125002.wlnnev5pjih6d5bz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Dan,

On Thu, Nov 30, 2017 at 1:50 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, Nov 30, 2017 at 07:14:45AM -0500, Frank Rowand wrote:
>> On 11/29/17 14:17, Colin King wrote:
>> > From: Colin Ian King <colin.king@canonical.com>
>> >
>> > Currently if the call to of_resolve_phandles fails then then ovcs
>> > is not kfree'd on the error exit path.  Rather than try and make
>> > the clean up exit path more convoluted, fix this by just kfree'ing
>> > ovcs at the point of error detection and exit via the same exit
>> > path.
>> >
>> > Detected by CoverityScan, CID#1462296 ("Resource Leak")
>> >
>> > Fixes: f948d6d8b792 ("of: overlay: avoid race condition between applying multiple overlays")
>
> The Fixes tag is wrong.  It should be:
>
> Fixes: bd80e2555c5c ("of: overlay: Fix cleanup order in of_overlay_apply()")
>
>> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> > ---
>> >  drivers/of/overlay.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> > index 53bc9e3f0b98..6c8efe7d8cbb 100644
>> > --- a/drivers/of/overlay.c
>> > +++ b/drivers/of/overlay.c
>> > @@ -708,8 +708,10 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
>> >     of_overlay_mutex_lock();
>> >
>> >     ret = of_resolve_phandles(tree);
>> > -   if (ret)
>> > +   if (ret) {
>> > +           kfree(ovcs);
>> >             goto err_overlay_unlock;
>> > +   }
>> >
>> >     mutex_lock(&of_mutex);
>> >
>> >
>>
>> False coverity warning.  ovcs is freed in free_overlay_changeset().
>
> You're looking at an older version of the code and Colin is looking at
> linux-next.

Actually Colin was right: the bug was introduced in commit f948d6d8b792:
While free_overlay_changeset() is called in the error path, that function
returns early because of:

        if (!ovcs->cset.entries.next)
                return;

So it never gets to freeing the passed pointer.

I'm fixing it for good (let's hope so ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
