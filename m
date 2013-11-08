From: Namjae Jeon <linkinjeon@gmail.com>
Date: Fri, 08 Nov 2013 06:20:26 +0000
Subject: Re: [patch] fat: double unlock on error path
Message-Id: <CAKYAXd9M1W+2raJzkE+ZfTzL6Z=dnOiQ3UeL6c3fFAnTZnw3vg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107074108.GB21844@elgon.mountain>
	<87zjpfv5w3.fsf@devron.myhome.or.jp>
In-Reply-To: <87zjpfv5w3.fsf@devron.myhome.or.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>

2013/11/8, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
>> There is a stray unlock here which was not intended.  I have removed it.
>>
>> Fixes: 3f9f3dfb5755 ('fat: add fat_fallocate operation')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/fs/fat/file.c b/fs/fat/file.c
>> index 03f716f..befedee 100644
>> --- a/fs/fat/file.c
>> +++ b/fs/fat/file.c
>> @@ -257,10 +257,8 @@ static long fat_fallocate(struct file *file, int
>> mode,
>>  		goto error;
>>
>>  	err = inode_newsize_ok(inode, (len + offset));
>> -	if (err) {
>> -		mutex_unlock(&inode->i_mutex);
>> +	if (err)
>>  		goto error;
>> -	}
>>
>>  	if (mode & FALLOC_FL_KEEP_SIZE) {
>>  		/* First compute the number of clusters to be allocated */
>
> Right. Namjae, please include this fix to patchset at next time.
Okay, I will include it in the next patch-set.
Thank you!

>
> Thanks.
> --
> OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
