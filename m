From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 07 Dec 2020 10:43:17 +0000
Subject: Re: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Message-Id: <9e3c4e1c-b7fa-1b1f-342d-cb23e0065a56@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8eoN/jMAJb3H3iv@mwanda>
 <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ernst, Justin" <justin.ernst@hpe.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Gross <mgross@linux.intel.com>, Borislav Petkov <bp@suse.de>, "Wahl, Steve" <steve.wahl@hpe.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi,

On 12/2/20 9:50 PM, Ernst, Justin wrote:
>> Return -ENOMEM on allocation failure instead of returning success.
>>
>> Fixes: 4fc2cf1f2daf ("x86/platform/uv: Add new uv_sysfs platform driver")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thank you for taking the time to find this.
> 
> Reviewed-by: Justin Ernst <justin.ernst@hpe.com> 
> (With an acknowledgement of Boris's 's/success/random stack memory contents/' comment)

ATM the drivers/platform/x86/uv_sysfs.c only exists in the tip/x86 tree -next
branch, so this fix needs to be merged through the tip/x86 tree, here is my ack
for merging it that way:

Acked-by: Hans de Goede <hdegoede@redhat.com>

(either with a fixed up commit-msg as suggested by Borislav, or feel
free to add it to a fixed v2 of the patch)

Regards,

Hans



> 
>> ---
>>  drivers/platform/x86/uv_sysfs.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
>> index 54c342579f1c..e17ce8c4cdad 100644
>> --- a/drivers/platform/x86/uv_sysfs.c
>> +++ b/drivers/platform/x86/uv_sysfs.c
>> @@ -248,6 +248,7 @@ static int uv_hubs_init(void)
>>  		uv_hubs[i] = kzalloc(sizeof(*uv_hubs[i]), GFP_KERNEL);
>>  		if (!uv_hubs[i]) {
>>  			i--;
>> +			ret = -ENOMEM;
>>  			goto err_hubs;
>>  		}
>>
>> --
>> 2.29.2
> 
