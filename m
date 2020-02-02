From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 02 Feb 2020 11:07:45 +0000
Subject: Re: [PATCH] iio: imu: st_lsm6dsx: Fix mismatched comments
Message-Id: <20200202110745.1d16533e@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200127120359.3955-1-jieun.kim4758@gmail.com>
In-Reply-To: <20200127120359.3955-1-jieun.kim4758@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JieunKim <jieun.kim4758@gmail.com>
Cc: lorenzo.bianconi83@gmail.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 27 Jan 2020 21:03:59 +0900
JieunKim <jieun.kim4758@gmail.com> wrote:

> odr to odr_table
> gain to fs_table
> 
> 'gain' is actually in 'st_lsm6dsx_fs' structure of 'fs_table'
> 
> Signed-off-by: JieunKim <jieun.kim4758@gmail.com>
Applied.  Thanks.

Jonathan

> ---
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> index 9c3486a8134f..f2113a63721a 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> @@ -230,8 +230,8 @@ enum st_lsm6dsx_ext_sensor_id {
>   * @i2c_addr: I2c slave address list.
>   * @wai: Wai address info.
>   * @id: external sensor id.
> - * @odr: Output data rate of the sensor [Hz].
> - * @gain: Configured sensor sensitivity.
> + * @odr_table: Output data rate of the sensor [Hz].
> + * @fs_table: Configured sensor sensitivity table depending on full scale.
>   * @temp_comp: Temperature compensation register info (addr + mask).
>   * @pwr_table: Power on register info (addr + mask).
>   * @off_canc: Offset cancellation register info (addr + mask).
