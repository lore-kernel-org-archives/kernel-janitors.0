From: Michael Thayer <michael.thayer@oracle.com>
Date: Sat, 22 Jul 2017 07:22:53 +0000
Subject: Re: [PATCH] staging: vboxvideo: make a couple of symbols static
Message-Id: <3541f5b7-b355-c15b-153f-50c609ba3298@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719093616.9853-1-colin.king@canonical.com>
 <5af53a54-9ca3-702e-909f-e27e56bf855b@redhat.com>
In-Reply-To: <5af53a54-9ca3-702e-909f-e27e56bf855b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hans de Goede <hdegoede@redhat.com>, Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Vetter <daniel@ffwll.ch>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

22.07.2017 00:17, Hans de Goede wrote:
> Hi,
> 
> On 19-07-17 11:36, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Module parameter vbox_modeset and structure vbox_bo_driver do not need to
>> be in global scope and hence can be made static.
>>
>> Cleans up a couple of sparse warnings:
>> symbol 'vbox_modeset' was not declared. Should it be static?
>> symbol 'vbox_bo_driver' was not declared. Should it be static?
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Looks good to me:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Looks good to me too.  Sorry for the slow response.  Still had no time
to actually apply it, but as said, it looks completely sensible.

Regards
Michael

Acked-by: Michael Thayer <michael.thayer@oracle.com>

>> ---
>>   drivers/staging/vboxvideo/vbox_drv.c | 2 +-
>>   drivers/staging/vboxvideo/vbox_ttm.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/vboxvideo/vbox_drv.c
>> b/drivers/staging/vboxvideo/vbox_drv.c
>> index 6d0600c37c0c..e18642e5027e 100644
>> --- a/drivers/staging/vboxvideo/vbox_drv.c
>> +++ b/drivers/staging/vboxvideo/vbox_drv.c
>> @@ -36,7 +36,7 @@
>>     #include "vbox_drv.h"
>>   -int vbox_modeset = -1;
>> +static int vbox_modeset = -1;
>>     MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>>   module_param_named(modeset, vbox_modeset, int, 0400);
>> diff --git a/drivers/staging/vboxvideo/vbox_ttm.c
>> b/drivers/staging/vboxvideo/vbox_ttm.c
>> index 34a905d40735..4eb410a2a1a8 100644
>> --- a/drivers/staging/vboxvideo/vbox_ttm.c
>> +++ b/drivers/staging/vboxvideo/vbox_ttm.c
>> @@ -230,7 +230,7 @@ static void vbox_ttm_tt_unpopulate(struct ttm_tt
>> *ttm)
>>       ttm_pool_unpopulate(ttm);
>>   }
>>   -struct ttm_bo_driver vbox_bo_driver = {
>> +static struct ttm_bo_driver vbox_bo_driver = {
>>       .ttm_tt_create = vbox_ttm_tt_create,
>>       .ttm_tt_populate = vbox_ttm_tt_populate,
>>       .ttm_tt_unpopulate = vbox_ttm_tt_unpopulate,
>>

-- 
Michael Thayer | VirtualBox engineer
ORACLE Deutschland B.V. & Co. KG | Werkstr. 24 | D-71384 Weinstadt

ORACLE Deutschland B.V. & Co. KG
Hauptverwaltung: Riesstraße 25, D-80992 München
Registergericht: Amtsgericht München, HRA 95603

Komplementärin: ORACLE Deutschland Verwaltung B.V.
Hertogswetering 163/167, 3543 AS Utrecht, Niederlande Handelsregister
der Handelskammer Midden-Nederland, Nr. 30143697
Geschäftsführer: Alexander van der Ven, Jan Schultheiss, Val Maher
