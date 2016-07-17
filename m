From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 17 Jul 2016 18:56:59 +0000
Subject: Re: [PATCH 5/9] staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <alpine.DEB.2.10.1607172056220.3177@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net> <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
In-Reply-To: <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Sun, 17 Jul 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 17 Jul 2016 18:15:23 +0200
>
> Some return values can also be directly used for various condition checks.
> Thus remove a local variable for intermediate assignments.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/staging/ks7010/ks7010_sdio.c | 81 +++++++++++++++---------------------
>  1 file changed, 34 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
> index eea18fb..b3ca8e2 100644
> --- a/drivers/staging/ks7010/ks7010_sdio.c
> +++ b/drivers/staging/ks7010/ks7010_sdio.c
> @@ -90,7 +90,6 @@ static int ks7010_sdio_write(struct ks_wlan_private *priv, unsigned int address,
>  void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
>  {
>  	unsigned char rw_data;
> -	int retval;
>
>  	DPRINTK(4, "\n");
>
> @@ -99,9 +98,10 @@ void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
>
>  	if (atomic_read(&priv->sleepstatus.status) = 0) {
>  		rw_data = GCR_B_DOZE;
> -		retval > -		    ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
> -		if (retval) {
> +		if (ks7010_sdio_write(priv,
> +				      GCR_B,
> +				      &rw_data,
> +				      sizeof(rw_data))) {

A multi-line function call in an if test does not look nice at all.  The
original code was an easy-to-read expectable pattern.

julia

>  			DPRINTK(1, " error : GCR_B=%02X\n", rw_data);
>  			goto out;
>  		}
> @@ -121,7 +121,6 @@ out:
>  void ks_wlan_hw_sleep_wakeup_request(struct ks_wlan_private *priv)
>  {
>  	unsigned char rw_data;
> -	int retval;
>
>  	DPRINTK(4, "\n");
>
> @@ -130,9 +129,10 @@ void ks_wlan_hw_sleep_wakeup_request(struct ks_wlan_private *priv)
>
>  	if (atomic_read(&priv->sleepstatus.status) = 1) {
>  		rw_data = WAKEUP_REQ;
> -		retval > -		    ks7010_sdio_write(priv, WAKEUP, &rw_data, sizeof(rw_data));
> -		if (retval) {
> +		if (ks7010_sdio_write(priv,
> +				      WAKEUP,
> +				      &rw_data,
> +				      sizeof(rw_data))) {
>  			DPRINTK(1, " error : WAKEUP=%02X\n", rw_data);
>  			goto out;
>  		}
> @@ -152,16 +152,15 @@ out:
>  void ks_wlan_hw_wakeup_request(struct ks_wlan_private *priv)
>  {
>  	unsigned char rw_data;
> -	int retval;
>
>  	DPRINTK(4, "\n");
>  	if (atomic_read(&priv->psstatus.status) = PS_SNOOZE) {
>  		rw_data = WAKEUP_REQ;
> -		retval > -		    ks7010_sdio_write(priv, WAKEUP, &rw_data, sizeof(rw_data));
> -		if (retval) {
> +		if (ks7010_sdio_write(priv,
> +				      WAKEUP,
> +				      &rw_data,
> +				      sizeof(rw_data)))
>  			DPRINTK(1, " error : WAKEUP=%02X\n", rw_data);
> -		}
>  		DPRINTK(4, "wake up : WAKEUP=%02X\n", rw_data);
>  		priv->last_wakeup = jiffies;
>  		++priv->wakeup_count;
> @@ -175,7 +174,6 @@ int _ks_wlan_hw_power_save(struct ks_wlan_private *priv)
>  {
>  	int rc = 0;
>  	unsigned char rw_data;
> -	int retval;
>
>  	if (priv->reg.powermgt = POWMGT_ACTIVE_MODE)
>  		return rc;
> @@ -198,11 +196,11 @@ int _ks_wlan_hw_power_save(struct ks_wlan_private *priv)
>  				if (!atomic_read(&priv->psstatus.confirm_wait)
>  				    && !atomic_read(&priv->psstatus.snooze_guard)
>  				    && !cnt_txqbody(priv)) {
> -					retval > -					    ks7010_sdio_read(priv, INT_PENDING,
> +					if (ks7010_sdio_read(priv,
> +							     INT_PENDING,
>  							     &rw_data,
> -							     sizeof(rw_data));
> -					if (retval) {
> +							     sizeof(rw_data))
> +							     ) {
>  						DPRINTK(1,
>  							" error : INT_PENDING=%02X\n",
>  							rw_data);
> @@ -212,12 +210,11 @@ int _ks_wlan_hw_power_save(struct ks_wlan_private *priv)
>  					}
>  					if (!rw_data) {
>  						rw_data = GCR_B_DOZE;
> -						retval > -						    ks7010_sdio_write(priv,
> +						if (ks7010_sdio_write(priv,
>  								      GCR_B,
>  								      &rw_data,
> -								      sizeof(rw_data));
> -						if (retval) {
> +								      sizeof(rw_data))
> +								      ) {
>  							DPRINTK(1,
>  								" error : GCR_B=%02X\n",
>  								rw_data);
> @@ -413,7 +410,6 @@ static void rx_event_task(unsigned long dev)
>  static void ks_wlan_hw_rx(void *dev, uint16_t size)
>  {
>  	struct ks_wlan_private *priv = (struct ks_wlan_private *)dev;
> -	int retval;
>  	struct rx_device_buffer *rx_buffer;
>  	struct hostif_hdr *hdr;
>  	unsigned char read_status;
> @@ -429,12 +425,11 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
>  	}
>  	rx_buffer = &priv->rx_dev.rx_dev_buff[priv->rx_dev.qtail];
>
> -	retval > -	    ks7010_sdio_read(priv, DATA_WINDOW, &rx_buffer->data[0],
> -			     hif_align_size(size));
> -	if (retval) {
> +	if (ks7010_sdio_read(priv,
> +			     DATA_WINDOW,
> +			     &rx_buffer->data[0],
> +			     hif_align_size(size)))
>  		goto error_out;
> -	}
>
>  	/* length check */
>  	if (size > 2046 || size = 0) {
> @@ -446,12 +441,11 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
>  #endif
>  		/* rx_status update */
>  		read_status = READ_STATUS_IDLE;
> -		retval > -		    ks7010_sdio_write(priv, READ_STATUS, &read_status,
> -				      sizeof(read_status));
> -		if (retval) {
> +		if (ks7010_sdio_write(priv,
> +				      READ_STATUS,
> +				      &read_status,
> +				      sizeof(read_status)))
>  			DPRINTK(1, " error : READ_STATUS=%02X\n", read_status);
> -		}
>  		goto error_out;
>  	}
>
> @@ -462,12 +456,11 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
>
>  	/* read status update */
>  	read_status = READ_STATUS_IDLE;
> -	retval > -	    ks7010_sdio_write(priv, READ_STATUS, &read_status,
> -			      sizeof(read_status));
> -	if (retval) {
> +	if (ks7010_sdio_write(priv,
> +			      READ_STATUS,
> +			      &read_status,
> +			      sizeof(read_status)))
>  		DPRINTK(1, " error : READ_STATUS=%02X\n", read_status);
> -	}
>  	DPRINTK(4, "READ_STATUS=%02X\n", read_status);
>
>  	if (atomic_read(&priv->psstatus.confirm_wait)) {
> @@ -489,7 +482,6 @@ static void ks7010_rw_function(struct work_struct *work)
>  	struct hw_info_t *hw;
>  	struct ks_wlan_private *priv;
>  	unsigned char rw_data;
> -	int retval;
>
>  	hw = container_of(work, struct hw_info_t, rw_wq.work);
>  	priv = container_of(hw, struct ks_wlan_private, ks_wlan_hw);
> @@ -538,9 +530,7 @@ static void ks7010_rw_function(struct work_struct *work)
>  	}
>
>  	/* read (WriteStatus/ReadDataSize FN1:00_0014) */
> -	retval > -	    ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data, sizeof(rw_data));
> -	if (retval) {
> +	if (ks7010_sdio_read(priv, WSTATUS_RSIZE, &rw_data, sizeof(rw_data))) {
>  		DPRINTK(1, " error : WSTATUS_RSIZE=%02X psstatus=%d\n", rw_data,
>  			atomic_read(&priv->psstatus.status));
>  		goto release_host;
> @@ -708,7 +698,6 @@ static void trx_device_exit(struct ks_wlan_private *priv)
>  static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
>  {
>  	int rc = 0;
> -	int retval;
>  	unsigned char *data_buf;
>
>  	data_buf = kmalloc(sizeof(u32), GFP_KERNEL);
> @@ -716,14 +705,12 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
>  		return 1;
>
>  	memcpy(data_buf, &index, sizeof(index));
> -	retval = ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index));
> -	if (retval) {
> +	if (ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index))) {
>  		rc = 2;
>  		goto free_buf;
>  	}
>
> -	retval = ks7010_sdio_write(priv, READ_INDEX, data_buf, sizeof(index));
> -	if (retval)
> +	if (ks7010_sdio_write(priv, READ_INDEX, data_buf, sizeof(index)))
>  		rc = 3;
>  free_buf:
>  	kfree(data_buf);
> --
> 2.9.1
>
>
