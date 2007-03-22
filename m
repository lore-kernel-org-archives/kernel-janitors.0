From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
Date: Thu, 22 Mar 2007 08:43:58 +0000
Subject: Re: [KJ] [PATCH] wireless: gcc attribute short form for hermes
Message-Id: <20070322084358.GA5495@tux>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello,

I sent this first mail to the list, but had no feedback. Should I
contact anyone directly?

On Tue, Mar 20, 2007 at 03:14:58PM +0100, Charles Cl=E9ment wrote:
> Hello kernel-janitors,
>=20
> Changed calls in hermes driver to use the short defined gcc attribute mac=
ro.
> Signed-off-by: Charles Cl=E9ment <caratorn@gmail.com>
>=20
> ---
>=20
> I would be glad to be assigned that task on the TODO list, if someone is
> not currently working on it.
> Thanks.
>=20
>=20
> Index: linux-2.6.21-rc4/drivers/net/wireless/hermes.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D> --- linux-2.6.21-rc4.orig/drivers/net/wireless=
/hermes.h
> +++ linux-2.6.21-rc4/drivers/net/wireless/hermes.h
> @@ -198,7 +198,7 @@ struct hermes_tx_descriptor {
>  	u8 retry_count;
>  	u8 tx_rate;
>  	__le16 tx_control;=09
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  #define HERMES_TXSTAT_RETRYERR		(0x0001)
>  #define HERMES_TXSTAT_AGEDERR		(0x0002)
> @@ -245,7 +245,7 @@ struct hermes_tallies_frame {
>  	/* Those last are probably not available in very old firmwares */
>  	__le16 RxDiscards_WEPICVError;
>  	__le16 RxDiscards_WEPExcluded;
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  /* Grabbed from wlan-ng - Thanks Mark... - Jean II
>   * This is the result of a scan inquiry command */
> @@ -262,7 +262,7 @@ struct prism2_scan_apinfo {
>  	u8 rates[10];		/* Bit rate supported */
>  	__le16 proberesp_rate;	/* Data rate of the response frame */
>  	__le16 atim;		/* ATIM window time, Kus (hostscan only) */
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  /* Same stuff for the Lucent/Agere card.
>   * Thanks to h1kari <h1kari AT dachb0den.com> - Jean II */
> @@ -276,7 +276,7 @@ struct agere_scan_apinfo {
>  	/* bits: 0-ess, 1-ibss, 4-privacy [wep] */
>  	__le16 essid_len;	/* ESSID length */
>  	u8 essid[32];		/* ESSID of the network */
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  /* Moustafa: Scan structure for Symbol cards */
>  struct symbol_scan_apinfo {
> @@ -294,7 +294,7 @@ struct symbol_scan_apinfo {
>  	__le16 basic_rates;	/* Basic rates bitmask */
>  	u8 unknown2[6];		/* Always FF:FF:FF:FF:00:00 */
>  	u8 unknown3[8];		/* Always 0, appeared in f/w 3.91-68 */
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  union hermes_scan_info {
>  	struct agere_scan_apinfo	a;
> @@ -312,7 +312,7 @@ union hermes_scan_info {
>   =20
>  struct hermes_linkstatus {
>  	__le16 linkstatus;         /* Link status */
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  struct hermes_response {
>  	u16 status, resp0, resp1, resp2;
> @@ -322,11 +322,11 @@ struct hermes_response {
>  struct hermes_idstring {
>  	__le16 len;
>  	__le16 val[16];
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  struct hermes_multicast {
>  	u8 addr[HERMES_MAX_MULTICAST][ETH_ALEN];
> -} __attribute__ ((packed));
> +} __packed;
> =20
>  /* Timeouts */
>  #define HERMES_BAP_BUSY_TIMEOUT (10000) /* In iterations of ~1us */
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--=20
Charles Cl=E9ment.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
