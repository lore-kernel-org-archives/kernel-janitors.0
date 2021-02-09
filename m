From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Feb 2021 08:10:32 +0000
Subject: Re: [PATCH v2] ath11k: fix a locking bug in ath11k_mac_op_start()
Message-Id: <20210209081032.GP20820@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBk4GoeE+yc0wlJH@mwanda>
 <87ft25vg1t.fsf@codeaurora.org>
In-Reply-To: <87ft25vg1t.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, Peter Oh <peter.oh@eero.com>, ath11k@lists.infradead.org

On Tue, Feb 09, 2021 at 09:47:10AM +0200, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>=20
> > This error path leads to a Smatch warning:
> >
> > 	drivers/net/wireless/ath/ath11k/mac.c:4269 ath11k_mac_op_start()
> > 	error: double unlocked '&ar->conf_mutex' (orig line 4251)
> >
> > We're not holding the lock when we do the "goto err;" so it leads to a
> > double unlock.  The fix is to hold the lock for a little longer.
> >
> > Fixes: c83c500b55b6 ("ath11k: enable idle power save mode")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: reviewers were concern that v1 was racy
> >
> >  drivers/net/wireless/ath/ath11k/mac.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wirele=
ss/ath/ath11k/mac.c
> > index c1608f64ea95..464d3425488b 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -4248,8 +4248,6 @@ static int ath11k_mac_op_start(struct ieee80211_h=
w *hw)
> >  	/* Configure the hash seed for hash based reo dest ring selection */
> >  	ath11k_wmi_pdev_lro_cfg(ar, ar->pdev->pdev_id);
> > =20
> > -	mutex_unlock(&ar->conf_mutex);
> > -
> >  	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
> >  			   &ab->pdevs[ar->pdev_idx]);
> > =20
> > @@ -4262,6 +4260,9 @@ static int ath11k_mac_op_start(struct ieee80211_h=
w *hw)
> >  			goto err;
> >  		}
> >  	}
> > +
> > +	mutex_unlock(&ar->conf_mutex);
> > +
> >  	return 0;
> > =20
> >  err:
> > --=20
> > 2.30.0
>=20
> But now rcu_assign_pointer() is called while conf_mutex is held,
> previously it was not. I didn't check if this creates problems, but just
> to be on the safe side I modified your patch to keep the original
> functionality. Please check my changes in the pending branch:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=
=3Dpending&id=8Eff3667c211072a2107271139b81cbf8c7fd10a=20
>=20

I don't think the assignment is a problem, but I'm also fine with the
way you modified the patch.  Thanks!

regards,
dan carpenter
