From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 14 Apr 2020 16:58:35 +0000
Subject: Re: [PATCH][next] drivers: hv: remove redundant assignment to pointer primary_channel
Message-Id: <606c442c-1923-77d4-c350-e06878172c44@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200414152343.243166-1-colin.king@canonical.com>
 <87d08axb7k.fsf@vitty.brq.redhat.com>
In-Reply-To: <87d08axb7k.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org

On 14/04/2020 17:51, Vitaly Kuznetsov wrote:
> Colin King <colin.king@canonical.com> writes:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The pointer primary_channel is being assigned with a value that is never,
>> The assignment is redundant and can be removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/hv/channel_mgmt.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
>> index ffd7fffa5f83..f7bbb8dc4b0f 100644
>> --- a/drivers/hv/channel_mgmt.c
>> +++ b/drivers/hv/channel_mgmt.c
>> @@ -425,8 +425,6 @@ void hv_process_channel_removal(struct vmbus_channel *channel)
>>  
>>  	if (channel->primary_channel = NULL) {
>>  		list_del(&channel->listentry);
>> -
>> -		primary_channel = channel;
>>  	} else {
>>  		primary_channel = channel->primary_channel;
>>  		spin_lock_irqsave(&primary_channel->lock, flags);
> 
> If I'm looking at the right source (5.7-rc1) it *is* beeing used:
> 
> 	if (channel->primary_channel = NULL) {
> 		list_del(&channel->listentry);
> 
> 		primary_channel = channel;
> 	} else {
> 		primary_channel = channel->primary_channel;
> 		spin_lock_irqsave(&primary_channel->lock, flags);
> 		list_del(&channel->sc_list);
> 		spin_unlock_irqrestore(&primary_channel->lock, flags);
> 	}
> 
> 	/*
> 	 * We need to free the bit for init_vp_index() to work in the case
> 	 * of sub-channel, when we reload drivers like hv_netvsc.
> 	 */
> 	if (channel->affinity_policy = HV_LOCALIZED)
> 		cpumask_clear_cpu(channel->target_cpu,
> 				  &primary_channel->alloced_cpus_in_node);
>                                    ^^^^^ HERE ^^^^^
> 

I was basing my change on linux-next that has removed a hunk of code:

commit bcefa400900739310e8ef0cb34cbe029c404455c
Author: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
Date:   Mon Apr 6 02:15:11 2020 +0200

    Drivers: hv: vmbus: Remove the unused HV_LOCALIZED channel affinity
logic

    The logic is unused since commit 509879bdb30b8 ("Drivers: hv: Introduce
    a policy for controlling channel affinity").

    This logic assumes that a channel target_cpu doesn't change during the
    lifetime of a channel, but this assumption is incompatible with the new
    functionality that allows changing the vCPU a channel will interrupt.

    Signed-off-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
    Link:
https://lore.kernel.org/r/20200406001514.19876-9-parri.andrea@gmail.com
    Reviewed-by: Michael Kelley <mikelley@microsoft.com>
    Signed-off-by: Wei Liu <wei.liu@kernel.org>

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index 7fb6eb647f14..476592b0bc00 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -433,14 +433,6 @@ void hv_process_channel_removal(struct
vmbus_channel *channel)
                spin_unlock_irqrestore(&primary_channel->lock, flags);
        }

-       /*
-        * We need to free the bit for init_vp_index() to work in the case
-        * of sub-channel, when we reload drivers like hv_netvsc.
-        */
-       if (channel->affinity_policy = HV_LOCALIZED)
-               cpumask_clear_cpu(channel->target_cpu,
-                                 &primary_channel->alloced_cpus_in_node);
-
