From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 07 May 2015 12:47:33 +0000
Subject: Re: [patch] iwlwifi: mvm: remove some dead code
Message-Id: <1431002853.11214.3.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150507095844.GA17996@mwanda>
	 <1431001635.11214.2.camel@sipsolutions.net> <20150507124224.GX16501@mwanda>
In-Reply-To: <20150507124224.GX16501@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eran Harary <eran.harary@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, Kalle Valo <kvalo@codeaurora.org>, Arik Nemtsov <arik@wizery.com>, Luciano Coelho <luciano.coelho@intel.com>, Liad Kaufman <liad.kaufman@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2015-05-07 at 15:42 +0300, Dan Carpenter wrote:

> > >  		_iwl_trans_stop_device(mvm->trans, false);
> > >  		_iwl_trans_start_hw(mvm->trans, false);
> > > -		if (ret)
> > > -			return ret;
> > 
> > It looks like "ret = _iwl_trans_start_hw(...)" was intended though?
> > 
> 
> Hm...  You may be right.  Should it also be "goto error;" instead of a
> direct return?  I'm not positive.

Yes, looks like.

> Eran can you fix this and give me a Reported-by tag?

I think Eran is on sabbatical, I'll get this on the way internally with
your reported-by.

johannes

