From: =?UTF-8?B?Iua9mOWNq+W5syhQZXRlciBQYW4pIg==?=
Date: Mon, 10 May 2010 02:36:57 +0000
Subject: Re: [PATCH] ext2/ext3:useless code for return value
Message-Id: <4BE77149.8050307@redflag-linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4BE2C5D5.2050207@redflag-linux.com> <20100507162348.GD3265@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20100507162348.GD3265@atrey.karlin.mff.cuni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jan Kara <jack@suse.cz>
Cc: tj@kernel.org, Christoph Lameter <cl@linux-foundation.org>, hch@lst.de, akpm@linux-foundation.org, adilger@sun.com, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/08/2010 12:23 AM, Jan Kara wrote:
>> When rsv is the right hand side of goal, we should return NULL,
>> because now rsv's prev is NULL, or we return rsv.
>>
>> Signed-off-by: Peter Pan(潘卫平)<wppan@redflag-linux.com>
>>
>> ---
>>   fs/ext2/balloc.c |    6 +-----
>>   fs/ext3/balloc.c |    6 +-----
>>   2 files changed, 2 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
>> index 3cf038c..023990f 100644
>> --- a/fs/ext2/balloc.c
>> +++ b/fs/ext2/balloc.c
>> @@ -323,11 +323,7 @@ search_reserve_window(struct rb_root *root,
>> ext2_fsblk_t goal)
>>   	 * side of the interval containing the goal.  If it's the RHS,
>>   	 * we need to back up one.
>>   	 */
>> -	if (rsv->rsv_start>  goal) {
>> -		n = rb_prev(&rsv->rsv_node);
>> -		rsv = rb_entry(n, struct ext2_reserve_window_node, rsv_node);
>> -	}
>> -	return rsv;
>> +    return (rsv->rsv_start<  goal) ? rsv : NULL;
>    Hmm, I'm not sure I understand your reasoning. Suppose we have an RB-tree
> with two intervals 0-10, 20-30. Interval 0-10 is in the root. Now we search
> for goal 15. In the root we go to right because 10<15, in the next node we go
> to left because 15<  20. Then the loop terminates. Now your code would return
> NULL but previous code would return rb_prev of interval 20-30 which is 0-10.
> And that is what we want as far as I understand what we expect from the
> function...
>
> 								Honza
You got the point!
Many thanks.

Regards
-- 
Peter Pan
Red Flag Software Co.,Ltd
