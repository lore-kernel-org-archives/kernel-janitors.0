From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 05 Sep 2018 10:14:58 +0000
Subject: Re: [PATCH] staging: most: video: fix registration of an empty comp core_component
Message-Id: <f1fc70f2-6cec-53fa-48a3-36f97c36ec08@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180905094605.14827-1-colin.king@canonical.com>
 <1588498.TolbaFeo5X@ws-140106>
In-Reply-To: <1588498.TolbaFeo5X@ws-140106>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Gromm <christian.gromm@microchip.com>, Abdun Nihaal <abdun.nihaal@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/09/18 11:06, Alexander Stein wrote:
> On Wednesday, September 5, 2018, 11:46:05 AM CEST Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently we have structrues comp (which is empty) and comp_info being
>> used to register and deregister the component.  This mismatch in naming
>> occurred from a previous commit that renamed aim_info to comp. Fix this
>> to use consistent component naming in line with most/net, most/sound etc.
>>
>> This fixes the message two issues, one with a null empty name when
>> loading the module:
>>
>> [ 1485.269515] most_core: registered new core component (null)
>>
>> and an Oops when removing the module:
>>
>> [ 1485.277971] BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
>> [ 1485.278648] PGD 0 P4D 0
>> [ 1485.279253] Oops: 0002 [#2] SMP PTI
>> [ 1485.279847] CPU: 1 PID: 32629 Comm: modprobe Tainted: P      D WC OE     4.18.0-8-generic #9
>> [ 1485.280442] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.0.0 02/06/2015
>> [ 1485.281040] RIP: 0010:most_deregister_component+0x3c/0x70 [most_core]
>> .. etc
>>
>> Fixes: 1b10a0316e2d ("staging: most: video: remove aim designators")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/staging/most/video/video.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
>> index cf342eb58e10..ad7e28ab9a4f 100644
>> --- a/drivers/staging/most/video/video.c
>> +++ b/drivers/staging/most/video/video.c
>> @@ -530,7 +530,7 @@ static int comp_disconnect_channel(struct most_interface *iface,
>>  	return 0;
>>  }
>>  
>> -static struct core_component comp_info = {
>> +static struct core_component comp = {
>>  	.name = "video",
>>  	.probe_channel = comp_probe_channel,
>>  	.disconnect_channel = comp_disconnect_channel,
> 
> Doesn't it make more sense to move that variable defintion where currently the forward declaration is?

Probably, I was just keeping this the same as the other most/* drivers
to be consistent with those for now while just fixing this current buglet.

> This way you can't have 2 variables accidentally. You will need forward declarations for those two functions, but a mismatch here results in a linker error rather than a runtime NULL pointer access
> 
> Best regards,
> Alexander
> 
> 
> 
