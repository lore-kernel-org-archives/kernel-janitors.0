From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
Date: Mon, 06 Jul 2020 13:29:19 +0000
Subject: Re: [PATCH][next] staging: wfx: fix uninitialized variable bytes_done
Message-Id: <6155735.5LkVgl88Ba@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200706132017.487627-1-colin.king@canonical.com>
In-Reply-To: <20200706132017.487627-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 6 July 2020 15:20:17 CEST Colin King wrote:
>=20
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable bytes_done is not initialized and hence the first
> FIFO size check on bytes_done may be breaking prematurely from
> the loop if bytes_done contains a large bogus uninitialized value.
> Fix this by initializing bytes_done to zero.
>=20
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: a9408ad79ff3 ("staging: wfx: load the firmware faster")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch!

I am surprised that my gcc hasn't caught that.

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>


> ---
>  drivers/staging/wfx/fwio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/fwio.c b/drivers/staging/wfx/fwio.c
> index d9a886f3e64b..206c6cf6511c 100644
> --- a/drivers/staging/wfx/fwio.c
> +++ b/drivers/staging/wfx/fwio.c
> @@ -177,7 +177,7 @@ static int wait_ncp_status(struct wfx_dev *wdev, u32 =
status)
>  static int upload_firmware(struct wfx_dev *wdev, const u8 *data, size_t =
len)
>  {
>         int ret;
> -       u32 offs, bytes_done;
> +       u32 offs, bytes_done =3D 0;
>         ktime_t now, start;
>=20
>         if (len % DNLD_BLOCK_SIZE) {
> --
> 2.27.0
>=20
>=20


--=20
J=E9r=F4me Pouiller
