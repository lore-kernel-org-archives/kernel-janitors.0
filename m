From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 14 Sep 2012 07:42:18 +0000
Subject: Re: [PATCH 1/9] drivers/block/aoe/aoecmd.c: Remove useless kfree
Message-Id: <CA+MoWDrHbDVkCrDt2XTadWxcb+t6D2ARMLXRkREa_mCosQusYg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347462407-13499-1-git-send-email-peter.senna@gmail.com>
	<5051E9F3.4020708@bfs.de>
	<20120913144205.GN19396@mwanda>
In-Reply-To: <20120913144205.GN19396@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: walter harms <wharms@bfs.de>, "Ed L. Cashin" <ecashin@coraid.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 13, 2012 at 4:42 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, Sep 13, 2012 at 04:13:07PM +0200, walter harms wrote:
>> > diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
>> > index 5461faa..cbb0521 100644
>> > --- a/drivers/block/aoe/aoecmd.c
>> > +++ b/drivers/block/aoe/aoecmd.c
>> > @@ -1257,7 +1257,6 @@ addtgt(struct aoedev *d, char *addr, ulong nframes)
>> >     }
>> >     t = kcalloc(1, sizeof *t, GFP_ATOMIC);
>> >     if (!t) {
>> > -           kfree(t);
>> >             printk(KERN_INFO "aoe: cannot allocate memory to add target\n");
>> >             return NULL;
>> >     }
>> >
>>
>>
>> this should read kzalloc(sizeof (*t), GFP_ATOMIC);
>> see: [PATCH 3/9] drivers/gpu/drm/ttm/ttm_page_alloc_dma.c: Remove useless kfree
>
> I already fixed this one last week actually.  I did it the way
> Walter suggests.
So please ignore my patch.

>
> regards,
> dan carpenter
>



-- 
Peter
