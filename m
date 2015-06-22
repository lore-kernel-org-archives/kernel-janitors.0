From: "Greg Kroah-Hartman (gregkh@linuxfoundation.org)"  <gregkh@linuxfoundation.org>
Date: Mon, 22 Jun 2015 18:03:06 +0000
Subject: Re: [HPDD-discuss] [PATCH 01/12] staging: lustre: fid: Use !x to check for kzalloc failure
Message-Id: <20150622180306.GA20087@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <556d2f2088404e09aac1f0a57767cea5@EXCHCS32.ornl.gov>
In-Reply-To: <556d2f2088404e09aac1f0a57767cea5@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Simmons, James A." <simmonsja@ornl.gov>
Cc: "Julia Lawall (Julia.Lawall@lip6.fr)" <Julia.Lawall@lip6.fr>, "oleg.drokin@intel.com" <oleg.drokin@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hpdd-discuss@lists.01.org" <hpdd-discuss@ml01.01.org>, "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>

On Mon, Jun 22, 2015 at 05:27:03PM +0000, Simmons, James A. wrote:
> 
> Is this change a hard requirement? Currently the lustre code standard in our development tree is the opposite policy.

Please follow the kernel coding style rules.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
