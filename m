From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sun, 03 Aug 2008 13:24:27 +0000
Subject: [PATCH] resend: Remove warning 'unused variable battery' in drivers/acpi/sbs.c
Message-Id: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@helsinki.fi>
Cc: kernel-janitors@vger.kernel.org, astarikovskiy@suse.de, LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org

Resend of the patch to remove the following warning:
drivers/acpi/sbs.c: In function 'acpi_battery_remove':
drivers/acpi/sbs.c:819: warning: unused variable 'battery'


Signed-off-by:- "Manish Katiyar" <mkatiyar@gmail.com>

---
 drivers/acpi/sbs.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index 10a3651..8493603 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -816,7 +816,9 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int i=
d)

 static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
 {
+#if defined (CONFIG_ACPI_SYSFS_POWER) || (CONFIG_ACPI_PROCFS_POWER)
       struct acpi_battery *battery =3D &sbs->battery[id];
+#endif
 #ifdef CONFIG_ACPI_SYSFS_POWER
       if (battery->bat.dev) {
               if (battery->have_sysfs_alarm)
--
1.5.4.3


Thanks -
Manish

On Sun, Aug 3, 2008 at 6:00 PM, Ilpo J=E4rvinen <ilpo.jarvinen@helsinki.fi>=
 wrote:
> On Sun, 3 Aug 2008, Manish Katiyar wrote:
>
>> Below patch removes the following warning:
>> drivers/acpi/sbs.c: In function 'acpi_battery_remove':
>> drivers/acpi/sbs.c:819: warning: unused variable 'battery'
>>
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
>> +#ifdef CONFIG_ACPI_SYSFS_POWER || CONFIG_ACPI_PROCFS_POWER
>
> I don't think you can use || operator in ifdef like that... ...Try
> #if defined(...) || (...) instead.
>
>
> --
>  i.
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
