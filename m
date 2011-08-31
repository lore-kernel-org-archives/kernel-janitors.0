From: "Guy, Wey-Yi" <wey-yi.w.guy@intel.com>
Date: Wed, 31 Aug 2011 09:34:29 +0000
Subject: Re: [patch -next 1/2] iwlwifi: fix double assign in
Message-Id: <1314783269.26890.3.camel@wwguy-huron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110831063742.GC3705@shale.localdomain>
	 (sfid-20110831_084010_132544_82772E48)  <1314772887.4161.17.camel@jlt3.sipsolutions.net>
In-Reply-To: <1314772887.4161.17.camel@jlt3.sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Dan Carpenter <error27@gmail.com>, "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, "open list:INTEL WIRELESS WI..." <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 2011-08-30 at 23:41 -0700, Johannes Berg wrote:
> On Wed, 2011-08-31 at 09:37 +0300, Dan Carpenter wrote:
> > "vif" is assigned twice.  We can remove the first one.
> > 
> > This silences a Smatch warning that "ctx" could be one step past the
> > end of the priv->contexts[] array.
> 
> Good catch.
> 
> Reviewed-by: Johannes Berg <johannes@sipsolutions.net>
> 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Wey-Yi Guy <wey-yi.w.guy@intel.com>
> > 

Thanks
Wey

