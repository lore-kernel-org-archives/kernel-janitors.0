From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 18 Oct 2011 18:23:00 +0000
Subject: RE: [patch 3/4] mwifiex: prevent corruption instead of just warning
Message-Id: <1318962180.3958.30.camel@jlt3.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018061514.GI27732@elgon.mountain>
	 <477F20668A386D41ADCC57781B1F70430817F59764@SC-VEXCH1.marvell.com>
	 (sfid-20111018_202134_304312_48DE1FDF)
In-Reply-To: <477F20668A386D41ADCC57781B1F70430817F59764@SC-VEXCH1.marvell.com> (sfid-20111018_202134_304312_48DE1FDF)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 2011-10-18 at 11:19 -0700, Bing Zhao wrote:

> > @@ -1228,9 +1228,11 @@ static int mwifiex_pcie_event_complete(struct mwifiex_adapter *adapter,
> >  	if (!skb)
> >  		return 0;
> > 
> > -	if (rdptr >= MWIFIEX_MAX_EVT_BD)
> > +	if (rdptr >= MWIFIEX_MAX_EVT_BD) {
> >  		dev_err(adapter->dev, "event_complete: Invalid rdptr 0x%x\n",
> >  					rdptr);
> > +		return -EINVAL;
> 
> Instead of returning directly, we should set the error code and go through the error handling:
> 		ret = -EINVAL;
> 		goto done;

Are you sure? You don't go to error handling a few lines earlier.

johannes

