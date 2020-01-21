From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Tue, 21 Jan 2020 14:13:29 +0000
Subject: Re: [PATCH] ide: make drive->dn read only
Message-Id: <beada2e3-29bd-2165-b6d7-d28a8c83060e@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200121130719eucas1p15e8bc52b9167b48a1eb7be191ef103f5@eucas1p1.samsung.com>
        <20200121125942.hkr3zg77i5gtgc7v@kili.mountain>
In-Reply-To: <20200121125942.hkr3zg77i5gtgc7v@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org


On 1/21/20 2:06 PM, Dan Carpenter wrote:
> The IDE core always sets ->dn correctly so changing it is never
> required.
> 
> Setting it to a different value than assigned by IDE core is very likely
> to result in data corruption (due to wrong transfer timings being set on
> the controller etc.)
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, it looks fine (though patch summary can be improved further i.e.:
"[PATCH] ide-proc: make "number" setting read-only").

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

I've also verified it (using ARAnyM emulator):

Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> 
>  include/linux/ide.h    | 4 ++++
>  drivers/ide/ide-proc.c | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/ide.h b/include/linux/ide.h
> index 06dae6438557..a254841bd315 100644
> --- a/include/linux/ide.h
> +++ b/include/linux/ide.h
> @@ -945,6 +945,10 @@ ide_devset_get(_name, _field); \
>  ide_devset_set(_name, _field); \
>  IDE_DEVSET(_name, DS_SYNC, get_##_name, set_##_name)
>  
> +#define ide_devset_ro_field(_name, _field) \
> +ide_devset_get(_name, _field); \
> +IDE_DEVSET(_name, 0, get_##_name, NULL)
> +
>  #define ide_devset_rw_flag(_name, _field) \
>  ide_devset_get_flag(_name, _field); \
>  ide_devset_set_flag(_name, _field); \
> diff --git a/drivers/ide/ide-proc.c b/drivers/ide/ide-proc.c
> index 11a801aa92d8..15c17f3781ee 100644
> --- a/drivers/ide/ide-proc.c
> +++ b/drivers/ide/ide-proc.c
> @@ -206,7 +206,7 @@ static int set_xfer_rate (ide_drive_t *drive, int arg)
>  ide_devset_rw(current_speed, xfer_rate);
>  ide_devset_rw_field(init_speed, init_speed);
>  ide_devset_rw_flag(nice1, IDE_DFLAG_NICE1);
> -ide_devset_rw_field(number, dn);
> +ide_devset_ro_field(number, dn);
>  
>  static const struct ide_proc_devset ide_generic_settings[] = {
>  	IDE_PROC_DEVSET(current_speed, 0, 70),
> 
