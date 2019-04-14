From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 14 Apr 2019 12:40:13 +0000
Subject: Re: [PATCH -next] iio: imu: st_lsm6dsx: remove set but not used variables 'acc_sensor' and 'gyro_sen
Message-Id: <20190414134013.257d58ac@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409021217.155327-1-yuehaibing@huawei.com>
        <20190409082448.GA26320@localhost.localdomain>
In-Reply-To: <20190409082448.GA26320@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 9 Apr 2019 10:24:49 +0200
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> > Fixes gcc '-Wunused-but-set-variable' warning:
> > 
> > drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c: In function 'st_lsm6dsx_read_tagged_fifo':
> > drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:520:41: warning:
> >  variable 'gyro_sensor' set but not used [-Wunused-but-set-variable]
> > 
> > drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:520:28: warning:
> >  variable 'acc_sensor' set but not used [-Wunused-but-set-variable]
> > 
> > They are not used since commit 14c7c6e1a860 ("iio: imu: st_lsm6dsx: add
> > st_lsm6dsx_push_tagged_data routine")
> > 
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>  
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

thanks,

Jonathan

> 
> > ---
> >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> > index 2da8c5ff699a..bd08711d5b75 100644
> > --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> > +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> > @@ -517,7 +517,6 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw *hw)
> >  {
> >  	u16 pattern_len = hw->sip * ST_LSM6DSX_TAGGED_SAMPLE_SIZE;
> >  	u16 fifo_len, fifo_diff_mask;
> > -	struct st_lsm6dsx_sensor *acc_sensor, *gyro_sensor;
> >  	u8 iio_buff[ST_LSM6DSX_IIO_BUFF_SIZE], tag;
> >  	bool reset_ts = false;
> >  	int i, err, read_len;
> > @@ -539,9 +538,6 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw *hw)
> >  	if (!fifo_len)
> >  		return 0;
> >  
> > -	acc_sensor = iio_priv(hw->iio_devs[ST_LSM6DSX_ID_ACC]);
> > -	gyro_sensor = iio_priv(hw->iio_devs[ST_LSM6DSX_ID_GYRO]);
> > -
> >  	for (read_len = 0; read_len < fifo_len; read_len += pattern_len) {
> >  		err = st_lsm6dsx_read_block(hw,
> >  					    ST_LSM6DSX_REG_FIFO_OUT_TAG_ADDR,
> > 
> > 
> >   
