From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Nov 2019 11:03:52 +0000
Subject: Re: [PATCH v2] staging: wfx: Fix a memory leak in 'wfx_upload_beacon'
Message-Id: <20191104110352.GD10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191102155945.20205-1-christophe.jaillet@wanadoo.fr>
 <4126113.6ZGdBP45BV@pc-42>
In-Reply-To: <4126113.6ZGdBP45BV@pc-42>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 04, 2019 at 10:42:43AM +0000, Jerome Pouiller wrote:
> On Saturday 2 November 2019 16:59:45 CET Christophe JAILLET wrote:
> > The current code is a no-op, because all it can do is 'dev_kfree_skb(NULL)'
> > Remove the test before 'dev_kfree_skb()'
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > V2: remove the 'if(...)', 'dev_kfree_skb()' can handle NULL.
> > ---
> >  drivers/staging/wfx/sta.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
> > index 688586e823c0..93f3739b5f3a 100644
> > --- a/drivers/staging/wfx/sta.c
> > +++ b/drivers/staging/wfx/sta.c
> > @@ -906,8 +906,7 @@ static int wfx_upload_beacon(struct wfx_vif *wvif)
> >         wfx_fwd_probe_req(wvif, false);
> > 
> >  done:
> > -       if (!skb)
> > -               dev_kfree_skb(skb);
> > +       dev_kfree_skb(skb);
> >         return ret;
> >  }
> > 
> > --
> > 2.20.1
> > 
> 
> In add, value of skb is tested earlier in function. So, it is guaranteed to be 
> never NULL.

See the start of the function:

   868  static int wfx_upload_beacon(struct wfx_vif *wvif)
   869  {
   870          int ret = 0;
   871          struct sk_buff *skb = NULL;
   872          struct ieee80211_mgmt *mgmt;
   873          struct hif_mib_template_frame *p;
   874  
   875          if (wvif->vif->type = NL80211_IFTYPE_STATION ||
   876              wvif->vif->type = NL80211_IFTYPE_MONITOR ||
   877              wvif->vif->type = NL80211_IFTYPE_UNSPECIFIED)
   878                  goto done;
                        ^^^^^^^^^
This why I argue that goto done is monkey poop.  You see this and you
wonder "what on earth does goto done do?"  We haven't allocated anything
so what are we going to free?  The name doesn't give any hints at all.
So you have to scroll down.  Now you have lost your place and cleared
out your short term memory about the code that you were reading.  But
then you get to goto done and you see it is a complicated no op, and it
return ret.  So you have to scroll back up to the very start of the
function to see what ret is.

And the you wonder, is this really a success path?  It could be
deliberate or it could be accidental.  Who knows!  The "goto done;" is
ambiguous and take a long time to understand but "return 0;" is
instantly clear.

   879  
   880          skb = ieee80211_beacon_get(wvif->wdev->hw, wvif->vif);
   881  
   882          if (!skb)
   883                  return -ENOMEM;
   884  
   885          p = (struct hif_mib_template_frame *) skb_push(skb, 4);

regards,
dan carpenter
