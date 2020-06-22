From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jun 2020 17:18:47 +0000
Subject: Re: [PATCH net-next] ath11k: fix uninitialized return in ath11k_spectral_process_data()
Message-Id: <20200622171846.GE4151@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200619142922.GA267142@mwanda>
 <87a70vf923.fsf@codeaurora.org>
In-Reply-To: <87a70vf923.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Mon, Jun 22, 2020 at 05:51:16PM +0300, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > There is a success path where "ret" isn't initialized where we never
> > have a ATH11K_SPECTRAL_TAG_SCAN_SEARCH and then ret isn't initialized.
> >
> > Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
> > index 1c5d65bb411f..bfbf905f7507 100644
> > --- a/drivers/net/wireless/ath/ath11k/spectral.c
> > +++ b/drivers/net/wireless/ath/ath11k/spectral.c
> > @@ -677,7 +677,7 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
> >  	u32 data_len, i;
> >  	u8 sign, tag;
> >  	int tlv_len, sample_sz;
> > -	int ret;
> > +	int ret = 0;
> >  	bool quit = false;
> 
> I try to avoid initialising ret variables so I would like find another
> way. What about doing this (completely untested!) in the end of the
> function:
> 
>         return 0;
> 
> err:
> 	kfree(fft_sample);
> unlock:
> 	spin_unlock_bh(&ar->spectral.lock);
> 	return ret;

I normally avoid it as well...  If I were to redo this patch, I would
probably do:

	ret = 0;
err:
	kfree(fft_sample);
unlock:
	spin_unlock_bh(&ar->spectral.lock);
	return ret;

Would that be better?

regards,
dan carpenter
