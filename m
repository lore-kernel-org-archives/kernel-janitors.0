From: bgodavar@codeaurora.org
Date: Wed, 08 Jan 2020 12:43:09 +0000
Subject: Re: [PATCH -next] Bluetooth: hci_qca: Use vfree() instead of kfree()
Message-Id: <79e6ab011f21bc6edad81fc8a01aaf9a@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108035931.51209-1-weiyongjun1@huawei.com>
In-Reply-To: <20200108035931.51209-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org, hemantg@codeaurora.org

On 2020-01-08 09:29, Wei Yongjun wrote:
> Use vfree() instead of kfree() to free vmalloc()
> allocated data.
> 
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory
> dump during SSR")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/bluetooth/hci_qca.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 9392cc7f9908..a17260641283 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -529,7 +529,7 @@ static void hci_memdump_timeout(struct timer_list 
> *t)
>  	bt_dev_err(hu->hdev, "clearing allocated memory due to memdump 
> timeout");
>  	/* Inject hw error event to reset the device and driver. */
>  	hci_reset_dev(hu->hdev);
> -	kfree(memdump_buf);
> +	vfree(memdump_buf);
>  	kfree(qca_memdump);
>  	qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>  	del_timer(&qca->memdump_timer);
> @@ -1437,7 +1437,7 @@ static void qca_wait_for_dump_collection(struct
> hci_dev *hdev)
>  		bt_dev_err(hu->hdev, "Clearing the buffers due to timeout");
>  		if (qca_memdump)
>  			memdump_buf = qca_memdump->memdump_buf_tail;
> -		kfree(memdump_buf);
> +		vfree(memdump_buf);
>  		kfree(qca_memdump);
>  		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>  		del_timer(&qca->memdump_timer);

Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
