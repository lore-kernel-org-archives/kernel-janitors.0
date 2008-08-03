From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sun, 03 Aug 2008 15:31:19 +0000
Subject: Re: [PATCH] resend: Remove warning 'unused variable battery' in drivers/acpi/sbs.c
Message-Id: <ea11fea30808030819y60355086m5909482b48d1017d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
In-Reply-To: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Aug 3, 2008 at 8:42 PM, Ilpo J=E4rvinen <ilpo.jarvinen@helsinki.fi>=
 wrote:
> On Sun, 3 Aug 2008, Manish Katiyar wrote:
>
>> >>  static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
>> >>  {
>> >> +#if defined (CONFIG_ACPI_SYSFS_POWER) || (CONFIG_ACPI_PROCFS_POWER)
>> >
>> > Sorry, my bad this time, you actually need to have defined() around bo=
th
>> > of the config symbols though I forgot it in one of them in my example
>> > because I was using dots instead of real ones that would have made that
>> > mistake obvious due to capitalization.
>>
>> Sorry... I didn't understand :-( ....... I compile tested the patch.
>
> There are plenty of examples available:

Ohh Ok.. got it. Here is an updated patch.


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
+#if defined(CONFIG_ACPI_SYSFS_POWER) || defined(CONFIG_ACPI_PROCFS_POWER)
        struct acpi_battery *battery =3D &sbs->battery[id];
+#endif
 #ifdef CONFIG_ACPI_SYSFS_POWER
        if (battery->bat.dev) {
                if (battery->have_sysfs_alarm)
--=20
1.5.4.3



>
> $ git-grep '\#if.*||'
> ...
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
