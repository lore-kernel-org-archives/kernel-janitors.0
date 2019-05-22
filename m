From: Sowjanya Komatineni <skomatineni@nvidia.com>
Date: Wed, 22 May 2019 16:22:18 +0000
Subject: Re: [PATCH] mmc: tegra: Fix a warning message
Message-Id: <f8b4cc7c-6f12-21df-e76c-59699ff647b0@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190515093512.GD3409@mwanda>
In-Reply-To: <20190515093512.GD3409@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/22/19 6:37 AM, Thierry Reding wrote:
> On Wed, May 15, 2019 at 01:46:40PM +0200, Ulf Hansson wrote:
>> On Wed, 15 May 2019 at 11:35, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>> The WARN_ON() macro takes a condition, not a warning message.  I've
>>> changed this to use WARN(1, "msg...
>>>
>>> Fixes: ea8fc5953e8b ("mmc: tegra: update hw tuning process")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>>   drivers/mmc/host/sdhci-tegra.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
>>> index f608417ae967..10d7aaf68bab 100644
>>> --- a/drivers/mmc/host/sdhci-tegra.c
>>> +++ b/drivers/mmc/host/sdhci-tegra.c
>>> @@ -865,7 +865,7 @@ static void tegra_sdhci_tap_correction(struct sdhci_host *host, u8 thd_up,
>>>          }
>>>
>>>          if (!first_fail) {
>>> -               WARN_ON("no edge detected, continue with hw tuned delay.\n");
>>> +               WARN(1, "no edge detected, continue with hw tuned delay.\n");
>> Not sure why this is a WARN*() in the first place.
>>
>> Seems like a dev_warn() or possibly a dev_warn_once() should be used instead.
> I think this was on purpose in order to increase the likelihood of this
> getting reported. Sowjanya knows the details much better, but I think
> this is supposed to be very rare and really a problem with the tap
> settings in device tree, which is something that we want to know and
> fix.
>
> Let's see if Sowjanya can shed some light on this.
>
> Thierry
>
This warn can happen when no edge is detected and hw tuning results include

all passing taps which is very unlikely. So, I believe WARN(1, msg) 
should be good to use.

Sowjanya

>>>          } else if (first_pass) {
>>>                  /* set tap location at fixed tap relative to the first edge */
>>>                  edge1 = first_fail_tap + (first_pass_tap - first_fail_tap) / 2;
>>> --
>>> 2.20.1
>>>
>> Kind regards
>> Uffe
