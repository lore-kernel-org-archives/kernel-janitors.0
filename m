From: Samuel Ortiz <samuel.ortiz@intel.com>
Date: Tue, 18 Oct 2011 08:39:25 +0000
Subject: Re: [patch] iwmc3200wifi: add some more range checks
Message-Id: <20111018083924.GA2275@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111012081036.GA32384@elgon.mountain>
 <20111012082656.GA13878@sortiz-mobl>
 <20111018065043.GB25814@longonot.mountain>
In-Reply-To: <20111018065043.GB25814@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Oct 18, 2011 at 09:50:43AM +0300, Dan Carpenter wrote:
> My previous patch added a check to get_key() but missed a couple
> other places which need range checks.
> 
> The problem here is that wifi drivers have different numbers of keys.
> The lower levels assume that they can have up to 4 default keys and
> 2 management keys but this driver only has the default keys so we
> could go past the end of the ->keys[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Samuel Ortiz <sameo@linux.intel.com>

Cheers,
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

