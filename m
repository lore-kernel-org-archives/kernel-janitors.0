From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 May 2015 12:42:25 +0000
Subject: Re: [patch] iwlwifi: mvm: remove some dead code
Message-Id: <20150507124224.GX16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150507095844.GA17996@mwanda>
 <1431001635.11214.2.camel@sipsolutions.net>
In-Reply-To: <1431001635.11214.2.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Eran Harary <eran.harary@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, Kalle Valo <kvalo@codeaurora.org>, Arik Nemtsov <arik@wizery.com>, Luciano Coelho <luciano.coelho@intel.com>, Liad Kaufman <liad.kaufman@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 07, 2015 at 02:27:15PM +0200, Johannes Berg wrote:
> On Thu, 2015-05-07 at 12:58 +0300, Dan Carpenter wrote:
> > "ret" is zero here so we can remove this stray check.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/net/wireless/iwlwifi/mvm/fw.c b/drivers/net/wireless/iwlwifi/mvm/fw.c
> > index df86963..41f4763 100644
> > --- a/drivers/net/wireless/iwlwifi/mvm/fw.c
> > +++ b/drivers/net/wireless/iwlwifi/mvm/fw.c
> > @@ -663,8 +663,6 @@ int iwl_mvm_up(struct iwl_mvm *mvm)
> >  		 */
> >  		_iwl_trans_stop_device(mvm->trans, false);
> >  		_iwl_trans_start_hw(mvm->trans, false);
> > -		if (ret)
> > -			return ret;
> 
> It looks like "ret = _iwl_trans_start_hw(...)" was intended though?
> 

Hm...  You may be right.  Should it also be "goto error;" instead of a
direct return?  I'm not positive.  Eran can you fix this and give me a
Reported-by tag?

regards,
dan carpenter

