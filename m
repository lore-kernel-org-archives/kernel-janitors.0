From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Sun, 06 May 2012 03:03:34 +0000
Subject: Re: [patch] isp1704_charger: use after free on probe error
Message-Id: <20120506030334.GD29576@lizard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120327202212.GB9197@elgon.mountain>
 <CAMP44s3orF_pcLZ4hmiV5PqjAEF1O=iYm1piOKupVL3y9utVZw@mail.gmail.com>
In-Reply-To: <CAMP44s3orF_pcLZ4hmiV5PqjAEF1O=iYm1piOKupVL3y9utVZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Contreras <felipe.contreras@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@ti.com>, Marek Vasut <marek.vasut@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Apr 15, 2012 at 12:19:16AM +0300, Felipe Contreras wrote:
> On Tue, Mar 27, 2012 at 11:22 PM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> > We can't use "isp" after freeing it.
> 
> Oops!
> 
> Reviewed-by: Felipe Contreras <felipe.contreras@gmail.com>

Applied, thanks!

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
