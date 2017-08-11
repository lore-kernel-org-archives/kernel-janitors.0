From: walter harms <wharms@bfs.de>
Date: Fri, 11 Aug 2017 09:36:12 +0000
Subject: Re: [PATCH 1/3 v2] thermal: core: Add some new helper functions to free resources
Message-Id: <598D7A8C.6030709@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98e96edd53ea3109ec127f82608c8d5df5437c9c.1502201798.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <98e96edd53ea3109ec127f82608c8d5df5437c9c.1502201798.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 11.08.2017 10:20, schrieb Zhang Rui:
> On Fri, 2017-08-11 at 09:30 +0200, walter harms wrote:
>>
>> Am 08.08.2017 16:39, schrieb Christophe JAILLET:
>>>
>>> In order to easily free resources allocated by
>>> 'thermal_zone_create_device_groups()' we need 2 new helper
>>> functions.
>>>
>>> The first one undoes 'thermal_zone_create_device_groups()'.
>>> The 2nd one undoes 'create_trip_attrs()', which is a function
>>> called by
>>> 'thermal_zone_create_device_groups()'.
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> These functions will be used in patch 2/3 in order to simplify
>>> 'thermal_release()'
>>> I've tried to implement it as close a possible as the way the
>>> resources have
>>> been allocated.
>>> However, in 'thermal_release()', the code is simplier without some
>>> additionnal 'if'.
>>> No sure if we should prefer consistancy with allocation or
>>> simplicity of code.
>>> ---
>>>  drivers/thermal/thermal_core.h  |  1 +
>>>  drivers/thermal/thermal_sysfs.c | 29 +++++++++++++++++++++++++++++
>>>  2 files changed, 30 insertions(+)
>>>
>>> diff --git a/drivers/thermal/thermal_core.h
>>> b/drivers/thermal/thermal_core.h
>>> index 2412b3759e16..27e3b1df7360 100644
>>> --- a/drivers/thermal/thermal_core.h
>>> +++ b/drivers/thermal/thermal_core.h
>>> @@ -71,6 +71,7 @@ int thermal_build_list_of_policies(char *buf);
>>>  
>>>  /* sysfs I/F */
>>>  int thermal_zone_create_device_groups(struct thermal_zone_device
>>> *, int);
>>> +void thermal_zone_destroy_device_groups(struct thermal_zone_device
>>> *);
>>>  void thermal_cooling_device_setup_sysfs(struct
>>> thermal_cooling_device *);
>>>  /* used only at binding time */
>>>  ssize_t
>>> diff --git a/drivers/thermal/thermal_sysfs.c
>>> b/drivers/thermal/thermal_sysfs.c
>>> index a694de907a26..eb95d64b9446 100644
>>> --- a/drivers/thermal/thermal_sysfs.c
>>> +++ b/drivers/thermal/thermal_sysfs.c
>>> @@ -605,6 +605,24 @@ static int create_trip_attrs(struct
>>> thermal_zone_device *tz, int mask)
>>>  	return 0;
>>>  }
>>>  
>>> +/**
>>> + * destroy_trip_attrs() - create attributes for trip points
>>> + * @tz:		the thermal zone device
>>> + *
>>> + * helper function to free resources alocated by
>>> create_trip_attrs()
>>> + */
>>> +static void(struct thermal_zone_device *tz)
>>> +{
>>> +	if (!tz)
>>> +		return;
>>> +
>>> +	kfree(tz->trip_type_attrs);
>>> +	kfree(tz->trip_temp_attrs);
>>> +	if (tz->ops->get_trip_hyst)
>>> +		kfree(tz->trip_hyst_attrs);
>>> +	kfree(tz->trips_attribute_group.attrs);
>>> +}
>>> +
>>>  int thermal_zone_create_device_groups(struct thermal_zone_device
>>> *tz,
>>>  				      int mask)
>>>  {
>>> @@ -637,6 +655,17 @@ int thermal_zone_create_device_groups(struct
>>> thermal_zone_device *tz,
>>>  	return 0;
>>>  }
>>>  
>>> +void thermal_zone_destroy_device_groups(struct thermal_zone_device
>>> *tz)
>>> +{
>>> +	if (!tz)
>>> +		return;
>>> +
>>> +	if (tz->trips)
>>> +		destroy_trip_attrs(tz);
>> why the check for tz->trips ?
>> destroy_trip_attrs does not access tz->trips->
>>
> tz->trips is an integer represents the number of trip points.
> 
> We add this check because there is not any trips attributes if we don't
> have any trip points.
> It is true that the code also works if we don't have this check as
> destroy_trip_attrs() would be no-op when tz->trips equals 0.
> But I won't say this check is wrong.
> 

I understand, then i would suggest to move the check into destroy_trip_attrs().
Without that knowledge it is confusing to read.

re,
 wh

> thanks,
> rui
>> re,
>>  wh
>>
>>>
>>> +
>>> +	kfree(tz->device.groups);
>>> +}
>>> +
>>>  /* sys I/F for cooling device */
>>>  static ssize_t
>>>  thermal_cooling_device_type_show(struct device *dev,
> 
