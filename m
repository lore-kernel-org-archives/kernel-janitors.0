From: shenghui <crosslonelyover@gmail.com>
Date: Thu, 22 Jul 2010 00:03:18 +0000
Subject: Re: [PATCH] check name_len before down_read xattr_sem and sb_read in
Message-Id: <AANLkTikXSOHrIw0SVJMYqsQy1aG5sCXkvvOFU4XLDNGv@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007122229025316610@gmail.com>
	<20100721174457.GE1215@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20100721174457.GE1215@atrey.karlin.mff.cuni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jan Kara <jack@suse.cz>
Cc: linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

2010/7/22 Jan Kara <jack@suse.cz>:
>> Hi,
>>        I walked through ext2_xattr_get, and felt that we can
>> do some optimization on it. For name_len check, it's done
>> after down xattr_sem and sb_read, both of which are time
>> consuming operation compared with strlen:
>>          down_read(&EXT2_I(inode)->xattr_sem);
>>  ...
>>          bh = sb_bread(inode->i_sb, EXT2_I(inode)->i_file_acl);
>>  ...
>>          /* find named attribute */
>>          name_len = strlen(name);
>>
>>          error = -ERANGE;
>>          if (name_len > 255)
>>                  goto cleanup;
>>
>>        Most of the case, you'll get one valid block, but if the
>> name len > 255, then the xattr_sem down and sb_bread operation
>> can be seen as a waste of time. So I think we'd better do
>> name len check as early as possible.
>>        Following is my patch, and it's against 2.6.35-rc4.
>> Please check it.
>>
>> Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
>> ---
>>  fs/ext2/xattr.c |   12 +++++++-----
>>  1 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
>> index 7c39157..0b94d61 100644
>> --- a/fs/ext2/xattr.c
>> +++ b/fs/ext2/xattr.c
>> @@ -161,6 +161,13 @@ ext2_xattr_get(struct inode *inode, int name_index, const char *name,
>>
>>       if (name = NULL)
>>               return -EINVAL;
>> +
>> +     /* find named attribute */
>> +     name_len = strlen(name);
>> +     error = -ERANGE;
>> +     if (name_len > 255)
>> +             goto cleanup;
>  But you cannot go to cleanup here because you don't hold xattr_sem...
>

Sorry, I'm a little confused by your words.
The patch just checks name_len, and it
doesn't need xattr_sem.



-- 


Thanks and Best Regards,
shenghui
