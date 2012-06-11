From: Mark Einon <mark.einon@gmail.com>
Date: Mon, 11 Jun 2012 21:48:50 +0000
Subject: Re: [patch] Staging: et131x: fix | vs & typos
Message-Id: <CANK3SE2-rNhicW55kStCfCCGcweiEwmHDYa1k-G_TQ2OQ9RWGg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120609091701.GE877@elgon.mountain>
In-Reply-To: <20120609091701.GE877@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 9 June 2012 10:17, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> These two places seem like they should be using bitwise OR instead of
> bitwise AND. =A0The first one is a noop which is equivalent to:
>
> =A0 =A0 =A0 =A0imr |=3D (0x0100 & 0x0004 & 0x0001);
>
> The second is sets lcr2 to zero instead of just clearing the high bits.
>
> =A0 =A0 =A0 =A0lcr2 &=3D (0x00F0 & 0x000F);
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't have this hardware.
>
> diff --git a/drivers/staging/et131x/et131x.c b/drivers/staging/et131x/et1=
31x.c
> index 5b11c5e..0582183 100644
> --- a/drivers/staging/et131x/et131x.c
> +++ b/drivers/staging/et131x/et131x.c
> @@ -1767,8 +1767,8 @@ static void et131x_xcvr_init(struct et131x_adapter =
*adapter)
> =A0 =A0 =A0 =A0/* Set the link status interrupt only. =A0Bad behavior whe=
n link status
> =A0 =A0 =A0 =A0 * and auto neg are set, we run into a nested interrupt pr=
oblem
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 imr |=3D (ET_PHY_INT_MASK_AUTONEGSTAT &
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ET_PHY_INT_MASK_LINKSTAT &
> + =A0 =A0 =A0 imr |=3D (ET_PHY_INT_MASK_AUTONEGSTAT |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ET_PHY_INT_MASK_LINKSTAT |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ET_PHY_INT_MASK_ENABLE);
>
> =A0 =A0 =A0 =A0et131x_mii_write(adapter, PHY_INTERRUPT_MASK, imr);
> @@ -1784,7 +1784,7 @@ static void et131x_xcvr_init(struct et131x_adapter =
*adapter)
> =A0 =A0 =A0 =A0if ((adapter->eeprom_data[1] & 0x4) =3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0et131x_mii_read(adapter, PHY_LED_2, &lcr2);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 lcr2 &=3D (ET_LED2_LED_100TX & ET_LED2_LED_=
1000T);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lcr2 &=3D (ET_LED2_LED_100TX | ET_LED2_LED_=
1000T);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lcr2 |=3D (LED_VAL_LINKON_ACTIVE << LED_LI=
NK_SHIFT);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((adapter->eeprom_data[1] & 0x8) =3D 0)

Good spot. The fix is consistent with the original driver code and
tested ok with real hardware.

Acked-by: Mark Einon <mark.einon@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
