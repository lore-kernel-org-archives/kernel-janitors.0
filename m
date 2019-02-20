From: Jan Kara <jack@suse.cz>
Date: Wed, 20 Feb 2019 09:50:15 +0000
Subject: Re: [PATCH][udf-next] udf: don't call mark_buffer_dirty on a null bh pointer
Message-Id: <20190220095015.GB27474@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219114403.24771-1-colin.king@canonical.com>
 <20190219140240.GA31849@quack2.suse.cz>
 <aef899da-4dc1-1e40-30c9-fc2ca87f2380@digidescorp.com>
In-Reply-To: <aef899da-4dc1-1e40-30c9-fc2ca87f2380@digidescorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Magnani <steve.magnani@digidescorp.com>
Cc: Jan Kara <jack@suse.cz>, Colin King <colin.king@canonical.com>, Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue 19-02-19 08:17:09, Steve Magnani wrote:
> On 2/19/19 8:02 AM, Jan Kara wrote:
> > On Tue 19-02-19 11:44:03, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > There is a null check on the pointer bh to avoid a null pointer dereference
> > > on bh->b_data however later bh is passed to mark_buffer_dirty that can also
> > > cause a null pointer dereference on bh.  Avoid this potential null pointer
> > > dereference by moving the call to mark_buffer_dirty inside the null checked
> > > block.
> > > 
> > > Fixes: e8b4274735e4 ("udf: finalize integrity descriptor before writeback")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > Thanks for the patch! In fact it is the 'if (bh)' check that's
> > unnecessarily defensive (we cannot have sbi->s_lvid_dirty and
> > !sbi->s_lvid_bh). So I'll just drop that check (attached patch).
> > 
> > 								Honza
> > 
> > > ---
> > >   fs/udf/super.c | 12 ++++++------
> > >   1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/udf/super.c b/fs/udf/super.c
> > > index a6940d90bedd..b7e9a83d39db 100644
> > > --- a/fs/udf/super.c
> > > +++ b/fs/udf/super.c
> > > @@ -2336,13 +2336,13 @@ static int udf_sync_fs(struct super_block *sb, int wait)
> > >   			lvid = (struct logicalVolIntegrityDesc *)bh->b_data;
> > >   			udf_finalize_lvid(lvid);
> > > -		}
> > > -		/*
> > > -		 * Blockdevice will be synced later so we don't have to submit
> > > -		 * the buffer for IO
> > > -		 */
> > > -		mark_buffer_dirty(bh);
> > > +			/*
> > > +			 * Blockdevice will be synced later so we don't have
> > > +			 * to submit the buffer for IO
> > > +			 */
> > > +			mark_buffer_dirty(bh);
> > > +		}
> > >   		sbi->s_lvid_dirty = 0;
> > >   	}
> > >   	mutex_unlock(&sbi->s_alloc_mutex);
> > > -- 
> > > 2.20.1
> > > 
> Reviewed-by: Steven J. Magnani <steve@digidescorp.com>

Is this Reviewed-by for my fixup or the Colin's? Because I've decided to
rather remove the 'if (bh)' check completely since it is pointless...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
