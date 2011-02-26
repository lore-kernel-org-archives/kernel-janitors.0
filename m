From: "Guy, Wey-Yi" <wey-yi.w.guy@intel.com>
Date: Sat, 26 Feb 2011 05:01:01 +0000
Subject: Re: [patch] iwlwifi: remove duplicate initialization
Message-Id: <1298696461.6478.1.camel@wwguy-huron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110226015653.GC18043@bicker>
In-Reply-To: <20110226015653.GC18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "Venkataraman, Meenakshi" <meenakshi.venkataraman@intel.com>, "Berg, Johannes" <johannes.berg@intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, 2011-02-25 at 17:56 -0800, Dan Carpenter wrote:
> rate_mask is initialized again later so this can be removed.  Btw, if 
> rate_control_send_low(sta, priv_sta, txrc) returns false, that means
> that "sta" is non-NULL.  That's why the second initialization of
> rate_mask is a little simpler than the first.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Wey-Yi Guy <wey-yi.w.guy@intel.com>

make sense

Wey


