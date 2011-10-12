From: Samuel Ortiz <samuel.ortiz@intel.com>
Date: Wed, 12 Oct 2011 08:26:58 +0000
Subject: Re: [patch] iwmc3200wifi: add a range check to iwm_cfg80211_get_key()
Message-Id: <20111012082656.GA13878@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111012081036.GA32384@elgon.mountain>
In-Reply-To: <20111012081036.GA32384@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Oct 12, 2011 at 11:10:37AM +0300, Dan Carpenter wrote:
> Smatch complains that "key_index" is capped at 5 in nl80211_get_key()
> but iwm->keys[] only has 4 elements.  I don't know if this is really
> needed, but the other ->get_key() implementations seemed to check
> for overflows so I've added a check here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Samuel Ortiz <sameo@linux.intel.com>

Cheers.
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, 
92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

