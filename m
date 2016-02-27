From: walter harms <wharms@bfs.de>
Date: Sat, 27 Feb 2016 11:18:05 +0000
Subject: Re: [patch] drm/amd: cleanup get_mfd_cell_dev()
Message-Id: <56D185ED.3010906@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160225074709.GA7333@mwanda> <56D17170.80408@bfs.de>
 <20160227104049.GN5273@mwanda>
In-Reply-To: <20160227104049.GN5273@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Murali Krishna Vemuri <murali-krishna.vemuri@amd.com>



Am 27.02.2016 11:40, schrieb Dan Carpenter:
> On Sat, Feb 27, 2016 at 10:50:40AM +0100, walter harms wrote:
>>
>>
>> Am 25.02.2016 08:47, schrieb Dan Carpenter:
>>> It's simpler to just use snprintf() to print this to one buffer instead
>>> of using strcpy() and strcat().  Also using snprintf() is slightly safer
>>> than using sprintf().
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>>> index 9f8cfaa..d6b0bff 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>>> @@ -240,12 +240,10 @@ static int acp_poweron(struct generic_pm_domain *genpd)
>>>  static struct device *get_mfd_cell_dev(const char *device_name, int r)
>>>  {
>>>  	char auto_dev_name[25];
>>> -	char buf[8];
>>>  	struct device *dev;
>>>  
>>> -	sprintf(buf, ".%d.auto", r);
>>> -	strcpy(auto_dev_name, device_name);
>>> -	strcat(auto_dev_name, buf);
>>> +	snprintf(auto_dev_name, sizeof(auto_dev_name),
>>> +		 "%s.%d.auto", device_name, r);
>>>  	dev = bus_find_device_by_name(&platform_bus_type, NULL, auto_dev_name);
>>>  	dev_info(dev, "device %s added to pm domain\n", auto_dev_name);
>>>  
>>
>> hi,
>> i tried to understand what is the base for char auto_dev_name[25]. It is not clear
>> from these snipped if that is large or small.
>>
>> (To be aware i assume that
>> get_mfd_cell_dev("terrible_long_and_Stupid_name",1234567899346712) will never happen
>> but i could find no reason)
>>
>> A small comment that explains the magic 25 would be nice.
> 
> I have no idea, either of course.  For example,
> mc13xxx_add_subdevice_pdata() assumes device_name by itself can be 30
> characters.  Hence the change to snprintf.
> 

Hi Dan,
i also think that this limit is artificial, one of those "it works" things.
The problem is that i have seen changes in the naming als ready done, like the
shift from /dev/sda to things like /dev/disk/by-id/scsi-SATA_WDC_WD5000AAKS-_WD-WCASY5869245-part1
and you are out of the game here. snprintf will cut the tail and the %d.auto stuff is dead in the water.
To make it clear, I do not thing that is security related issue but it could result in annoying
failures. (the solution is obviously to use asprintf() and free the mem later :) ).

re,
 wh
