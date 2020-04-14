From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 14 Apr 2020 18:30:04 +0000
Subject: Re: [PATCH] pwm: Add missing '\n' in log messages
Message-Id: <f13a8754-3866-d3d2-eaff-29cb6d14ff8d@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411153528.30130-1-christophe.jaillet@wanadoo.fr>
 <20200414135827.GB3593749@ulmo>
In-Reply-To: <20200414135827.GB3593749@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Thierry Reding <thierry.reding@gmail.com>, paul@crapouillou.net, Joe Perches <joe@perches.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: u.kleine-koenig@pengutronix.de, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 14/04/2020 =E0 15:58, Thierry Reding a =E9crit=A0:
> On Sat, Apr 11, 2020 at 05:35:28PM +0200, Christophe JAILLET wrote:
>> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
>>
>> Fixes: 3ad1f3a33286 ("pwm: Implement some checks for lowlevel drivers")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/pwm/core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
>> index 9973c442b455..bca04965bfe6 100644
>> --- a/drivers/pwm/core.c
>> +++ b/drivers/pwm/core.c
>> @@ -537,7 +537,7 @@ static void pwm_apply_state_debug(struct pwm_device =
*pwm,
>>  =20
>>   	if (!state->enabled && s2.enabled && s2.duty_cycle > 0)
>>   		dev_warn(chip->dev,
>> -			 "requested disabled, but yielded enabled with duty > 0");
>> +			 "requested disabled, but yielded enabled with duty > 0\n");
>>  =20
>>   	/* reapply the state that the driver reported being configured. */
>>   	err =3D chip->ops->apply(chip, pwm, &s1);
> I don't think this is strictly necessary any longer since the logging
> functions are supposed to add these themselves nowadays. But I like the
> consistency of this, so I'll apply this anyway.
>
> Thanks,
> Thierry

Hi Thierry,

I've sent more or less 10 similar patches against files updated=20
recently, that is to say against files which are actively maintained.

I've done it to get feedback on the acceptances rate of such proposals.
The goal is not to flood everyone with such patches, but rather to see=20
if adding a new kind of test to checkpatch.pl makes sense.

Being able to detect early missing trailing '\n' would help maintainers=20
and patch providers.

You are the 2nd person (I've added Paul Cercueil in copy of my reply)=20
who reports that he is thinking that it is no more required to add a '\n'.


If you have any pointer about it, it would be much appreciated.

It would mean, that either this additional checkpatch test is useless,=20
or maybe that it should be reversed and spot *un*needed '\n'.

CJ
