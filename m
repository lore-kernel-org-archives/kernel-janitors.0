From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 12 Aug 2013 08:11:35 +0000
Subject: Re: [patch] iwlwifi: pcie: returning positive instead of negative
Message-Id: <1376295095.11514.0.camel@jlt4.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130810230321.GA19051@elgon.mountain>
	 (sfid-20130811_010349_606599_4F723F94)
In-Reply-To: <20130810230321.GA19051@elgon.mountain> (sfid-20130811_010349_606599_4F723F94)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2013-08-11 at 02:03 +0300, Dan Carpenter wrote:
> There is a missing '-' character here so we return positive 'ENOMEM'
> instead of negative.  The caller doesn't care.  All non-zero returns
> are translated to '-ENOMEM' in iwl_pcie_nic_init().
> 
> This is just a cleanup.

Applied, thanks.

johannes

