From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 25 Nov 2015 16:39:01 +0000
Subject: Re: [PATCH 3/3] staging: lustre: Less function calls in class_register_type() after error detection
Message-Id: <20151125163901.GA7368@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <563B473C.5090508@users.sourceforge.net>
 <563B4991.90005@users.sourceforge.net>
In-Reply-To: <563B4991.90005@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Nov 05, 2015 at 01:20:33PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 5 Nov 2015 12:48:58 +0100
> 
> The functions "kfree" and "kobject_put" were called in a few cases by the
> function "class_register_type" during error handling even if the passed
> variable contained a null pointer.
> 
> This implementation detail could be improved by the adjustment of
> jump targets.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/staging/lustre/lustre/obdclass/genops.c | 26 +++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)

Does not apply to my staging-next branch :(

