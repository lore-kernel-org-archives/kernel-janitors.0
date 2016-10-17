From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Oct 2016 10:59:37 +0000
Subject: Re: [bug report] wlcore/wl18xx: Add functionality to accept TX rate per link
Message-Id: <20161017104144.GA4469@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161011064722.GA7477@mwanda>
In-Reply-To: <20161011064722.GA7477@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 11, 2016 at 07:58:52AM +0000, Altshul, Maxim wrote:
> Hi, if I am not mistaken then the skb goes through the following process: 1. It is created by the driver and a hlid is assigned. 
> 2. It is passed to the FW for transmission. 
> 3. The hlid is checked by the FW before anything happens. 
> 4. It is released by the FW after transmission. 
> 5. The hlid is taken to get the rate from links array. 
> 

You're probably right, but it would be easier to follow along if there
were function names here.

regards,
dan carpenter


