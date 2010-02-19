From: reinette chatre <reinette.chatre@intel.com>
Date: Fri, 19 Feb 2010 20:57:54 +0000
Subject: Re: [patch] iwlwifi: testing the wrong variable
Message-Id: <1266613074.2551.2807.camel@rchatre-DESK>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100218094529.GA1298@bicker>
	 <1266516282.2551.2604.camel@rchatre-DESK>
	 <20100219203039.GN4950@tuxdriver.com>
In-Reply-To: <20100219203039.GN4950@tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Dan Carpenter <error27@gmail.com>, "Zhu, Yi" <yi.zhu@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "Guy, Wey-Yi W" <wey-yi.w.guy@intel.com>, "Kolekar, Abhijeet" <abhijeet.kolekar@intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, 2010-02-19 at 12:30 -0800, John W. Linville wrote:
> So for the record, that patch is basically identical to Dan's patch
> but with some whitespace fixups in some nearby lines as well.
> 
> How important is this patch?  Is there an actual bug report?  Is it
> a regression?
> 
> It is very late in the 2.6.33 cycle and it isn't obvious to me that
> this is worth pushing for 2.6.33 at this point...?

This is exactly the reason why we did not post the patch to 2.6.33 or
stable when we submitted it upstream since there was no regression or
bug tied to it at that time. It surely is a problem that needs fixing,
which we did in the current release. I just highlighted that if there is
a request for this to be fixed in stable then we already have the patch
available. I'm ok with this one only going into 2.6.34.

Reinette


