From: Scott Branden <scott.branden@broadcom.com>
Date: Mon, 01 Feb 2021 22:49:42 +0000
Subject: Re: [PATCH] misc: bcm-vk: unlock on error in bcm_to_h_msg_dequeue()
Message-Id: <f4f98962-5c0e-c32a-6e12-ae3b830b19c1@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBfyb+jU5lDUe+5g@mwanda>
 <CAEuuh2_BH4_7bm7tTZ2VSKNv7eCjj-ZU=zcV3vKbD1H_tJRLcQ@mail.gmail.com>
In-Reply-To: <CAEuuh2_BH4_7bm7tTZ2VSKNv7eCjj-ZU=zcV3vKbD1H_tJRLcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Desmond Yan <desmond.yan@broadcom.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Great, looks good then.

On 2021-02-01 10:32 a.m., Desmond Yan wrote:
> Acked-by: Desmond Yan <desmond.yan@broadcom.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
>
> On Mon, Feb 1, 2021 at 4:24 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> Unlock before returning on this error path.
>>
>> Fixes: 111d746bb476 ("misc: bcm-vk: add VK messaging support")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  drivers/misc/bcm-vk/bcm_vk_msg.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.c b/drivers/misc/bcm-vk/bcm_vk_msg.c
>> index eec90494777d..fc972e43258a 100644
>> --- a/drivers/misc/bcm-vk/bcm_vk_msg.c
>> +++ b/drivers/misc/bcm-vk/bcm_vk_msg.c
>> @@ -849,7 +849,8 @@ s32 bcm_to_h_msg_dequeue(struct bcm_vk *vk)
>>                                  * that is fatal.
>>                                  */
>>                                 dev_crit(dev, "Kernel mem allocation failure.\n");
>> -                               return -ENOMEM;
>> +                               total = -ENOMEM;
>> +                               goto idx_err;
>>                         }
>>
>>                         /* flush rd pointer after a message is dequeued */
>> --
>> 2.29.2
>>
