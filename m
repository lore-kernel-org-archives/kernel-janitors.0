From: Nick Crews <ncrews@chromium.org>
Date: Wed, 20 Feb 2019 22:15:18 +0000
Subject: Re: [PATCH -next] platform/chrome: Fix off-by-one error in wilco_ec/debugfs.c
Message-Id: <CAHX4x87KP9QsnX-vAwyEs45tXngbiSSq+vrByj01S-LpUdO40g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220215826.44366-1-ncrews@chromium.org> <a0cf4649-e06f-aded-55ad-893560c2414a@collabora.com>
In-Reply-To: <a0cf4649-e06f-aded-55ad-893560c2414a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Duncan Laurie <dlaurie@chromium.org>

Hi Enric,

On Wed, Feb 20, 2019 at 3:06 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Nick,
>
> Thanks for the patch.
>
> On 20/2/19 22:58, Nick Crews wrote:
> > Before, in debugfs.c it was possible to supply only the message type,
> > and not supply any other arguments when sending raw commands. However,
> > this is never used by the EC, and it led to an underflow error. Now,
> > just don't allow too short of a command, we will never need
> > that anyways.
> >
> > Fixes: 46c7fd06f8c9 ("platform/chrome: wilco_ec: Add support for raw commands in debugfs")
>
> As this is -next material I'd like to squash the fix if you don't mind.


Please do. Fixing something after it's already in the tree was a new
process for me,
so I tried to copy other people's examples. Please let me know
if there's anything else I should do something different next time.

Nick

>
> -- Enric
>
> > Signed-off-by: Nick Crews <ncrews@chromium.org>
> > ---
> >  drivers/platform/chrome/wilco_ec/debugfs.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/wilco_ec/debugfs.c b/drivers/platform/chrome/wilco_ec/debugfs.c
> > index 46ff3b6c46c7..c090db2cd5be 100644
> > --- a/drivers/platform/chrome/wilco_ec/debugfs.c
> > +++ b/drivers/platform/chrome/wilco_ec/debugfs.c
> > @@ -136,8 +136,8 @@ static ssize_t raw_write(struct file *file, const char __user *user_buf,
> >       ret = parse_hex_sentence(buf, kcount, request_data, TYPE_AND_DATA_SIZE);
> >       if (ret < 0)
> >               return ret;
> > -     /* Need at least two bytes for message type */
> > -     if (ret < 2)
> > +     /* Need at least two bytes for message type and one for command */
> > +     if (ret < 3)
> >               return -EINVAL;
> >
> >       /* Clear response data buffer */
> > @@ -145,7 +145,7 @@ static ssize_t raw_write(struct file *file, const char __user *user_buf,
> >
> >       msg.type = request_data[0] << 8 | request_data[1];
> >       msg.flags = WILCO_EC_FLAG_RAW;
> > -     msg.command = ret > 2 ? request_data[2] : 0;
> > +     msg.command = request_data[2];
> >       msg.request_data = ret > 3 ? request_data + 3 : 0;
> >       msg.request_size = ret - 3;
> >       msg.response_data = debug_info->raw_data;
> >
