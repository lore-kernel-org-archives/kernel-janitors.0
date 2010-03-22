From: =?UTF-8?B?Iua9mOWNq+W5syhQZXRlciBQYW4pIg==?=
Date: Mon, 22 Mar 2010 12:14:04 +0000
Subject: Re: [PATCH] vfs: set proper level for printk in fs/super.c
Message-Id: <4BA75F0C.5050509@redflag-linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4BA4C92F.5070007@redflag-linux.com> <20100320133848.GD5331@bicker>
In-Reply-To: <20100320133848.GD5331@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

On 03/20/2010 09:38 PM, Dan Carpenter wrote:
> On Sat, Mar 20, 2010 at 09:10:07PM +0800, "潘卫平(Peter Pan)" wrote:
>> Signed-off-by: Peter Pan(潘卫平)<wppan@redflag-linux.com>
>> ---
>>   fs/super.c |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/super.c b/fs/super.c
>> index f35ac60..60d720f 100644
>> --- a/fs/super.c
>> +++ b/fs/super.c
>> @@ -312,7 +312,7 @@ void generic_shutdown_super(struct super_block *sb)
>>
>>   		/* Forget any remaining inodes */
>>   		if (invalidate_inodes(sb)) {
>> -			printk("VFS: Busy inodes after unmount of %s. "
>> +			printk(KERN_INFO "VFS: Busy inodes after unmount of %s. "
>>   			   "Self-destruct in 5 seconds.  Have a nice day...\n",
>
> I'm pretty sure that both of these should be a higher priority than
> KERN_INFO.
>
> regards,
> dan carpenter
>
>>   			sb->s_id);
>>   		}
>> @@ -642,7 +642,7 @@ static void do_emergency_remount(struct work_struct
>> *work)
>>   	}
>>   	spin_unlock(&sb_lock);
>>   	kfree(work);
>> -	printk("Emergency Remount complete\n");
>> +	printk(KERN_INFO "Emergency Remount complete\n");
>>   }
>>
>>   void emergency_remount(void)
>> --
>> 1.6.6
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


Signed-off-by: 潘卫平(Peter Pan) <wppan@redflag-linux.com>
---
  fs/super.c |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index f35ac60..baffd23 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -312,7 +312,7 @@ void generic_shutdown_super(struct super_block *sb)

  		/* Forget any remaining inodes */
  		if (invalidate_inodes(sb)) {
-			printk("VFS: Busy inodes after unmount of %s. "
+			printk(KERN_WARNING "VFS: Busy inodes after unmount of %s. "
  			   "Self-destruct in 5 seconds.  Have a nice day...\n",
  			   sb->s_id);
  		}
@@ -642,7 +642,7 @@ static void do_emergency_remount(struct work_struct 
*work)
  	}
  	spin_unlock(&sb_lock);
  	kfree(work);
-	printk("Emergency Remount complete\n");
+	printk(KERN_NOTICE "Emergency Remount complete\n");
  }

  void emergency_remount(void)
-- 
1.6.6



-- 
Peter Pan(潘卫平)
Red Flag Software Co.,Ltd
