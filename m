From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Wed, 09 Dec 2020 08:05:38 +0000
Subject: Re: [PATCH] block/rnbd-clt: Fix error code in rnbd_clt_add_dev_symlink()
Message-Id: <CAMGffE=5PJhKujzdHyP_AsujfcABxRQoCSkC6HnM+AuxxcVCmQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9B0IyxwbBDq+cSS@mwanda> <CAMGffEn6a92UDBgzkR2L6wutNBpxY_xNf3cakvbivkaGRnk_uQ@mail.gmail.com>
 <20201209080323.GE2767@kadam>
In-Reply-To: <20201209080323.GE2767@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Md Haris Iqbal <haris.iqbal@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Lutz Pogrell <lutz.pogrell@cloud.ionos.com>, linux-block <linux-block@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 9, 2020 at 9:03 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Dec 09, 2020 at 08:36:31AM +0100, Jinpu Wang wrote:
> > Hi Dan,
> >
> >
> >
> > On Wed, Dec 9, 2020 at 7:52 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > The "ret" variable should be set to -ENOMEM but it returns uninitialized
> > > stack data.
> > >
> > > Fixes: 64e8a6ece1a5 ("block/rnbd-clt: Dynamically alloc buffer for pathname & blk_symlink_name")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks for the patch. But there is already a fix from Colin merged in
> > block tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-5.11/drivers&ids3c15bd3a944b8eeaacdddf061759b6a83dd3f4
> >
> > There is still other problem through with commit 64e8a6ece1a5
> > ("block/rnbd-clt: Dynamically alloc buffer for pathname &
> > blk_symlink_name")
> >
> > I will send the fix today together with other changes.
>
> Ah...  Haha...  Sorry about that.  We already discussed this yesterday.
>
> What happens is that when I write a patch, I normally save it in my
> postponed messages until the next day.  But then I decided to not fix it
> but instead to just report it.  Unfortunately, I forgot to delete it and
> I also forgot about yesterday's discussion because I have the memory of
> a gnat.  :P
>
> regards,
> dan carpenter
>
No problem, thanks! :)
