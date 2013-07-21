From: Vyacheslav Dubeyko <slava@dubeyko.com>
Date: Sun, 21 Jul 2013 12:50:36 +0000
Subject: Re: [RFC] nilfs2: double bio_put() in nilfs_end_bio_write()
Message-Id: <CEDFCC8D-B88C-4148-A3A1-5851233C2D41@dubeyko.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719092603.GB22147@longonot.mountain>
In-Reply-To: <20130719092603.GB22147@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Jul 21, 2013, at 1:40 AM, Dan Carpenter wrote:

> On Sat, Jul 20, 2013 at 01:10:23PM +0400, Vyacheslav Dubeyko wrote:
>>> diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
>>> index dc9a913..a660fd7 100644
>>> --- a/fs/nilfs2/segbuf.c
>>> +++ b/fs/nilfs2/segbuf.c
>>> @@ -346,7 +346,8 @@ static void nilfs_end_bio_write(struct bio *bio, int err)
>>> 	if (err = -EOPNOTSUPP) {
>>> 		set_bit(BIO_EOPNOTSUPP, &bio->bi_flags);
>>> 		bio_put(bio);
>>> -		/* to be detected by submit_seg_bio() */
>>> +		/* to be detected by nilfs_segbuf_submit_bio() */
>>> +		return;
>> 
>> I think that simple return from the function is not right way. As I understand the code,
>> then we increment error count in segbuf's sb_err field and signalize about completion of
>> operation. So, from my viewpoint, it needs to remove the bio_put() call for the case of
>> (err = -EOPNOTSUPP) instead of return from function.
>> 
> 
> Do you think you could send that patch and give me a reported-by
> tag?  I feel weird signing off on it when I don't really understand
> this code...
> 

Ok, sure. I'll send the patch and continue discussion with Ryusuke
(if he will have objections).

Thank you for the report and fix suggestion.

With the best regards,
Vyacheslav Dubeyko.

> regards,
> dan carpenter

