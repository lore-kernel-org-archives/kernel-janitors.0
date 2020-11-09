From: Lars Poeschel <poeschel@lemonage.de>
Date: Mon, 09 Nov 2020 09:34:01 +0000
Subject: Re: [PATCH] auxdisplay: fix use after free in lcd2s_i2c_remove()
Message-Id: <20201109093401.oufzm5z3kcckloks@lem-wkst-02.lemonage>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106192415.GA2696904@mwanda>
In-Reply-To: <20201106192415.GA2696904@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 06, 2020 at 10:24:15PM +0300, Dan Carpenter wrote:
> The kfree() needs to be moved down a line to prevent a use after free.
>=20
> Fixes: 8c9108d014c5 ("auxdisplay: add a driver for lcd2s character displa=
y")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/auxdisplay/lcd2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/auxdisplay/lcd2s.c b/drivers/auxdisplay/lcd2s.c
> index cfa5f86deeef..3eb7f04db6cb 100644
> --- a/drivers/auxdisplay/lcd2s.c
> +++ b/drivers/auxdisplay/lcd2s.c
> @@ -348,8 +348,8 @@ static int lcd2s_i2c_remove(struct i2c_client *i2c)
>  {
>  	struct lcd2s_data *lcd2s =3D i2c_get_clientdata(i2c);
> =20
> -	kfree(lcd2s->charlcd);
>  	charlcd_unregister(lcd2s->charlcd);
> +	kfree(lcd2s->charlcd);
>  	return 0;
>  }

Reviewed-by: Lars P=F6schel <poeschel@lemonage.de>

Thanks,
Lars
