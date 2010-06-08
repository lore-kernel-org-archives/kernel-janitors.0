From: shenghui <crosslonelyover@gmail.com>
Date: Tue, 08 Jun 2010 11:15:34 +0000
Subject: Re: [PATCH] Documentation/filesystems/xip.txt: clarify the statement:
Message-Id: <AANLkTikNN8A0X2z8TL0MPHqjXrS-4uqrkVcoV_dqxeiv@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTik9UM9ta3r7ZNt8Z-CNS6Vz-aIWb_qewgECFfoe@mail.gmail.com>
	<20100608092458.GA5483@bicker>
In-Reply-To: <20100608092458.GA5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, cotte@de.ibm.com

2010/6/8 Dan Carpenter <error27@gmail.com>:
> On Tue, Jun 08, 2010 at 04:37:04PM +0800, shenghui wrote:
>> diff --git a/Documentation/filesystems/xip.txt
>> b/Documentation/filesystems/xip.txt
>> index 0466ee5..bef4120 100644
>> --- a/Documentation/filesystems/xip.txt
>> +++ b/Documentation/filesystems/xip.txt
>> @@ -35,8 +35,7 @@ is performed. A struct block_device reference is
>> used to address the device,
>
> I don't know about xip, but the patch is malformed.  It's line wrapped
> here.
>
>>  and a sector_t argument is used to identify the individual block. As an
>>  alternative, memory technology devices can be used for this.
>>
>> -The block device operation is optional, these block devices support it as of
>> -today:
>> +The block device operation is mandatory for execute-in-place, these
>> block devices support it as of today:
>
> And here.
>
>>  - dcssblk: s390 dcss block device driver
>>
>
> There is documentation in Documentation/email-clients.txt.  Send a patch
> to yourself, then save it as a raw document.
>
> cd path/to/linux
> cat raw-email | patch -p1
>
> If it applies correctly resend your patch to the list.
>
> regards,
> dan carpenter
>
>
>

Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
 Documentation/filesystems/xip.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/xip.txt
b/Documentation/filesystems/xip.txt
index 0466ee5..caaa8b4 100644
--- a/Documentation/filesystems/xip.txt
+++ b/Documentation/filesystems/xip.txt
@@ -35,8 +35,8 @@ is performed. A struct block_device reference is
used to address the device,
 and a sector_t argument is used to identify the individual block. As an
 alternative, memory technology devices can be used for this.

-The block device operation is optional, these block devices support it as of
-today:
+The block device operation is mandatory for execute-in-place, these block
+devices support it as of today:
 - dcssblk: s390 dcss block device driver

 An address space operation named get_xip_mem is used to retrieve references
-- 
1.7.0.1


-- 


Thanks and Best Regards,
shenghui
