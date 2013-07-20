From: Vyacheslav Dubeyko <slava@dubeyko.com>
Date: Sat, 20 Jul 2013 09:10:23 +0000
Subject: Re: [RFC] nilfs2: double bio_put() in nilfs_end_bio_write()
Message-Id: <8D04BC36-EF1A-4ED9-86CC-50F17A0EAA11@dubeyko.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719092603.GB22147@longonot.mountain>
In-Reply-To: <20130719092603.GB22147@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Jul 19, 2013, at 1:26 PM, Dan Carpenter wrote:

> I don't know if this is correct or not, but if feels like we shouldn't
> be calling bio_put() twice in nilfs_end_bio_write().  Also the comment
> is out of date.  If this is correct then I can resend with a proper
> Signed-off-by line and everything.
> 

I think that you have caught the important issue.

> diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
> index dc9a913..a660fd7 100644
> --- a/fs/nilfs2/segbuf.c
> +++ b/fs/nilfs2/segbuf.c
> @@ -346,7 +346,8 @@ static void nilfs_end_bio_write(struct bio *bio, int err)
> 	if (err = -EOPNOTSUPP) {
> 		set_bit(BIO_EOPNOTSUPP, &bio->bi_flags);
> 		bio_put(bio);
> -		/* to be detected by submit_seg_bio() */
> +		/* to be detected by nilfs_segbuf_submit_bio() */
> +		return;

I think that simple return from the function is not right way. As I understand the code,
then we increment error count in segbuf's sb_err field and signalize about completion of
operation. So, from my viewpoint, it needs to remove the bio_put() call for the case of
(err = -EOPNOTSUPP) instead of return from function.

Thanks,
Vyacheslav Dubeyko.

> 	}
> 
> 	if (!uptodate)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nilfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

