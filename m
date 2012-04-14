From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 14 Apr 2012 21:19:16 +0000
Subject: Re: [patch] isp1704_charger: use after free on probe error
Message-Id: <CAMP44s3orF_pcLZ4hmiV5PqjAEF1O=iYm1piOKupVL3y9utVZw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120327202212.GB9197@elgon.mountain>
In-Reply-To: <20120327202212.GB9197@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anton Vorontsov <anton.vorontsov@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@ti.com>, Marek Vasut <marek.vasut@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 27, 2012 at 11:22 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> We can't use "isp" after freeing it.

Oops!

Reviewed-by: Felipe Contreras <felipe.contreras@gmail.com>

-- 
Felipe Contreras
