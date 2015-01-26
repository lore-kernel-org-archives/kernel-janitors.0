From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 26 Jan 2015 16:06:46 +0000
Subject: Re: [PATCH] staging: rtl8188eu: core: rtw_wlan_util.c: Fix for NULL dereference
Message-Id: <alpine.DEB.2.10.1501261706170.2693@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1422286754-3039-1-git-send-email-gmate.amit@gmail.com> <alpine.DEB.2.10.1501261657590.2693@hadrien>
In-Reply-To: <alpine.DEB.2.10.1501261657590.2693@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Kumar Amit Mehta <gmate.amit@gmail.com>, gregkh@linuxfoundation.org, navin.patidar@gmail.com, Larry.Finger@lwfinger.net, dan.carpenter@oracle.com, tapaswenipathak@gmail.com, abelmoyo.ab@gmail.com, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 26 Jan 2015, Julia Lawall wrote:

> On Mon, 26 Jan 2015, Kumar Amit Mehta wrote:
>
> > In rtw_check_bcn_info(), check the return value of kzalloc() before
> > dereferencing it, to avoid NULL pointer dereference.
> >
> > Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
> > ---
> >  drivers/staging/rtl8188eu/core/rtw_wlan_util.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
> > index 3e9b6e9..a3ffc69 100644
> > --- a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
> > +++ b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
> > @@ -931,6 +931,8 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
> >  	}
> >
> >  	bssid = kzalloc(sizeof(struct wlan_bssid_ex), GFP_ATOMIC);
> > +	if (!bssid)
> > +		return _FAIL;
>
> I haven't looked at this issue in a while, but shouldn't this be
> OBD_ALLOC?

Sorry for the noise.  I assumed that both patches were for lustre, but
this one is not.

julia
