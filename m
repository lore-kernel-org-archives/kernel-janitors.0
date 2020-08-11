From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Aug 2020 10:17:47 +0000
Subject: Re: [PATCH] staging: ks7010: Do not use GFP_KERNEL in atomic context
Message-Id: <20200811101746.GN1793@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809111846.745826-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809111846.745826-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devel@driverdev.osuosl.org, sfr@canb.auug.org.au, mhocko@suse.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, longman@redhat.com, akpm@linux-foundation.org

On Sun, Aug 09, 2020 at 01:18:46PM +0200, Christophe JAILLET wrote:
> A possible call chain is as follow:
>   ks_wlan_start_xmit                    (ks_wlan_net.c)
>     --> hostif_data_request             (ks_hostif.c)
>       --> michael_mic                   (ks_hostif.c)
> 
> 'ks_wlan_start_xmit()' is a '.ndo_start_xmit()' function (see
> net_device_ops structure). Such calls are guarded by the __netif_tx_lock
> spinlock. So memory allocation must be atomic.
> 
> So, use GFP_ATOMIC instead of GFP_KERNEL 'in michael_mic()'
> 
> Fixes: ???
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This is completely speculative. I don't know if the call chain given above
> if possible in RL application.
> So review carefully :)
> 
> If the fix is correct, it is also more the starting point of a bigger
> change, because in 'michael_mic()' there is a call to
> 'crypto_alloc_shash()' and this function uses GFP_KERNEL internally (in
> 'crypto_create_tfm()')
> Should this need to be changed, I don't know how 'ks_hostif.c' should be
> fixed. Changing allocation in 'crypto/api.c' looks like an overkill.
> 
> In other word, I think that my patch is wrong, but don't know what else to
> propose :).

Your patch is correct but you're also right that it's incomplete.

If you look at drivers/staging/rtl8192e/rtllib_crypt_tkip.c then they
declare the shash on stack instead of using crypto_alloc_shash().
	SHASH_DESC_ON_STACK(desc, tfm_michael);

That's probably what we should do here as well.  Although I don't know
this code very well at all...  This is probably the sort of change where
it would be good to have someone test it.

regards,
dan carpenter
