From: Anton Vorontsov <anton@enomsg.org>
Date: Wed, 28 Aug 2013 01:13:42 +0000
Subject: Re: [patch] ab8500-charger: we print an unintended error message
Message-Id: <20130828011342.GB10506@lizard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130827011942.GD17061@elgon.mountain>
In-Reply-To: <20130827011942.GD17061@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2013 at 04:19:42AM +0300, Dan Carpenter wrote:
> There is a missing break statement here, so we print an error message
> that the USB type is invalid.  The original code still works fine
> though except for the error message.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks a lot!

Anton
