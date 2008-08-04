From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Mon, 04 Aug 2008 13:23:21 +0000
Subject: Re: [PATCH] resend: Remove warning 'unused variable battery' in drivers/acpi/sbs.c
Message-Id: <ea11fea30808040611s61305c74m9a235d1fd15aa199@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
In-Reply-To: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Aug 3, 2008 at 9:01 PM, walter harms <wharms@bfs.de> wrote:
>
>
> Manish Katiyar wrote:
>
>> On Sun, Aug 3, 2008 at 8:42 PM, Ilpo J=E4rvinen <ilpo.jarvinen@helsinki.=
fi> wrote:
>>> On Sun, 3 Aug 2008, Manish Katiyar wrote:
>>>
>>>>>>  static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
>>>>>>  {
>>>>>> +#if defined (CONFIG_ACPI_SYSFS_POWER) || (CONFIG_ACPI_PROCFS_POWER)
>>>>> Sorry, my bad this time, you actually need to have defined() around b=
oth
>>>>> of the config symbols though I forgot it in one of them in my example
>>>>> because I was using dots instead of real ones that would have made th=
at
>>>>> mistake obvious due to capitalization.
>>>> Sorry... I didn't understand :-( ....... I compile tested the patch.
>>> There are plenty of examples available:
>>
>> Ohh Ok.. got it. Here is an updated patch.
>>
>>
>> Signed-off-by:- "Manish Katiyar" <mkatiyar@gmail.com>
>>
>> ---
>>  drivers/acpi/sbs.c |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
>> index 10a3651..8493603 100644
>> --- a/drivers/acpi/sbs.c
>> +++ b/drivers/acpi/sbs.c
>> @@ -816,7 +816,9 @@ static int acpi_battery_add(struct acpi_sbs *sbs, in=
t id)
>>
>>  static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
>>  {
>> +#if defined(CONFIG_ACPI_SYSFS_POWER) || defined(CONFIG_ACPI_PROCFS_POWE=
R)
>>         struct acpi_battery *battery =3D &sbs->battery[id];
>> +#endif
>>  #ifdef CONFIG_ACPI_SYSFS_POWER
>>         if (battery->bat.dev) {
>>                 if (battery->have_sysfs_alarm)
>
>
> i suggest to move the #ifdef CONFIG_ACPI_SYSFS_POWER a few lines up, just=
 to improve
> readability for me. I did not dive into the code just the patch but i sus=
pect the whole
> function depends on CONFIG_ACPI_SYSFS_POWER.

Hi Walter,

From the code it looks like they are separate config options and are
independant, but I am too novice to say that :-) .

Thanks -
Manish



>
>  #if defined(CONFIG_ACPI_SYSFS_POWER)
>
>  #if defined(CONFIG_ACPI_PROCFS_POWER)
>          struct acpi_battery *battery =3D &sbs->battery[id];
>  #endif
>
>         if (battery->bat.dev) {
>                 if (battery->have_sysfs_alarm)
>
>
>
> happy hacking,
>  wh
>
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
