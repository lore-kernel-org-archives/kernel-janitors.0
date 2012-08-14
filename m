From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 14 Aug 2012 11:15:32 +0000
Subject: Re: [patch] [media] em28xx: use after free in em28xx_v4l2_close()
Message-Id: <CALF0-+XVpGhtODTfeayov1aayQhCihF7FG=vo60XYeHbDhW6Vw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120814065814.GB4791@elgon.mountain>
	<CALF0-+UU8dGBdihLgm==d0gCE4aHKdAbEVfe54U1LDjBHss8XQ@mail.gmail.com>
	<20120814110546.GD4559@mwanda>
In-Reply-To: <20120814110546.GD4559@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Hans Verkuil <hans.verkuil@cisco.com>, Hans de Goede <hdegoede@redhat.com>, Gianluca Gennari <gennarone@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2012 at 8:05 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Tue, Aug 14, 2012 at 07:50:12AM -0300, Ezequiel Garcia wrote:
>> Hi Dan,
>>
>> On Tue, Aug 14, 2012 at 3:58 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> > We need to move the unlock before the kfree(dev);
>> >
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> > Applies to linux-next.
>> >
>> > diff --git a/drivers/media/video/em28xx/em28xx-video.c b/drivers/media/video/em28xx/em28xx-video.c
>> > index ecb23df..78d6ebd 100644
>> > --- a/drivers/media/video/em28xx/em28xx-video.c
>> > +++ b/drivers/media/video/em28xx/em28xx-video.c
>> > @@ -2264,9 +2264,9 @@ static int em28xx_v4l2_close(struct file *filp)
>> >                 if (dev->state & DEV_DISCONNECTED) {
>> >                         em28xx_release_resources(dev);
>>
>> Why not unlocking here?
>
> I don't see a reason to prefer one over the other.
>

Mmm, I see now what you mean,

Thanks and sorry for dumb question,
Ezequiel.
