From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2020 08:47:53 +0000
Subject: Re: [PATCH][next] ath11k: avoid null pointer dereference when pointer band is null
Message-Id: <20200113084753.GA9510@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d5d54e035e4d69ad4ffb4a835a495a@huawei.com>
 <64797126-0c77-4c2c-ad2b-29d7af452c13@wanadoo.fr>
 <17571eee-9d72-98cb-00f5-d714a28b853b@wanadoo.fr>
In-Reply-To: <17571eee-9d72-98cb-00f5-d714a28b853b@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Colin King <colin.king@canonical.com>, David Miller <davem@davemloft.net>, linux-wireless@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kernel Janitors <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jan 11, 2020 at 12:57:11PM +0100, Marion & Christophe JAILLET wrote:
> Le 11/01/2020 à 10:50, linmiaohe a écrit :
> > Colin Ian King<colin.king@canonical.com>  wrote：
> > > From: Colin Ian King<colin.king@canonical.com>
> > > 
> > > In the unlikely event that cap->supported_bands has neither WMI_HOST_WLAN_2G_CAP set or WMI_HOST_WLAN_5G_CAP set then pointer band is null and a null dereference occurs when assigning
> > > band->n_iftype_data.  Move the assignment to the if blocks to
> > > avoid this.  Cleans up static analysis warnings.
> > > 
> > > Addresses-Coverity: ("Explicit null dereference")
> > > Fixes: 9f056ed8ee01 ("ath11k: add HE support")
> > > Signed-off-by: Colin Ian King<colin.king@canonical.com>
> > > ---
> > > drivers/net/wireless/ath/ath11k/mac.c | 8 ++++----
> > > 1 file changed, 4 insertions(+), 4 deletions(-)
> > It looks fine for me. Thanks.
> > Reviewed-by: Miaohe Lin<linmiaohe@huawei.com>
> (sorry for incomplete mail and mailing list addresses, my newsreader ate
> them, and I cannot get the list from get_maintainer.pl because my (outdated)
> tree does not have ath11k/...
> I've only including the ones in memory of my mail writer.
> 
> Please forward if needed)
> 
> 
> Hi
> 
> Shouldn't there be a
> 
> |
> 
> - band->n_iftype_data  =  count; at the end of the patch if the assignment
> is *moved*? Without it, 'band' (as well as 'count') could be un-initialized,
> and lead to memory corruption. Just my 2c. CJ |

You must be looking at different code.  There is no uninitialized
variable.  The patched code looks like:

drivers/net/wireless/ath/ath11k/mac.c
  3520  static void ath11k_mac_setup_he_cap(struct ath11k *ar,
  3521                                      struct ath11k_pdev_cap *cap)
  3522  {
  3523          struct ieee80211_supported_band *band;
  3524          int count;
  3525  
  3526          if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
  3527                  count = ath11k_mac_copy_he_cap(ar, cap,
  3528                                                 ar->mac.iftype[NL80211_BAND_2GHZ],
  3529                                                 NL80211_BAND_2GHZ);
  3530                  band = &ar->mac.sbands[NL80211_BAND_2GHZ];
  3531                  band->iftype_data = ar->mac.iftype[NL80211_BAND_2GHZ];
  3532                  band->n_iftype_data = count;
  3533          }
  3534  
  3535          if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
  3536                  count = ath11k_mac_copy_he_cap(ar, cap,
  3537                                                 ar->mac.iftype[NL80211_BAND_5GHZ],
  3538                                                 NL80211_BAND_5GHZ);
  3539                  band = &ar->mac.sbands[NL80211_BAND_5GHZ];
  3540                  band->iftype_data = ar->mac.iftype[NL80211_BAND_5GHZ];
  3541                  band->n_iftype_data = count;
  3542          }
  3543  }

regards,
dan carpenter
