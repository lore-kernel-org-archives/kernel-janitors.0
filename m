From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Apr 2017 09:42:48 +0000
Subject: Re: [PATCH] iwlwifi: pcie: off by one in iwl_trans_pcie_dyn_txq_alloc()
Message-Id: <20170422094248.4l2cf6bpgbnqtujd@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421194619.sjc33647odsfkcfl@mwanda>
 <1492804774.19290.5.camel@sipsolutions.net>
 <20170421201200.4y4tzlxmktacskr6@mwanda>
 <1492844542.31741.127.camel@intel.com>
In-Reply-To: <1492844542.31741.127.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Coelho, Luciano" <luciano.coelho@intel.com>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, linuxwifi <linuxwifi@intel.com>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Sharon, Sara" <sara.sharon@intel.com>, "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sat, Apr 22, 2017 at 07:02:23AM +0000, Coelho, Luciano wrote:
> On Fri, 2017-04-21 at 23:12 +0300, Dan Carpenter wrote:
> > Heh.  I raced this one through to see if I could beat you to the punch.
> 
> Yeah, this patch is in our internal tree.  But maybe we can take Dan's
> for upstream for his efforts? :)

No no.

regards,
dan carpenter

