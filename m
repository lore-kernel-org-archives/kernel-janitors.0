From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 01 Jul 2015 08:14:42 +0000
Subject: Re: [PATCH] Staging: unisys: virtpci: fixed a brace coding style issue
Message-Id: <20150701080242.GD2411@sudip-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55930BB1.10502@zoho.com>
 <20150701065749.GA2411@sudip-PC>
 <55939890.6090903@zoho.com>
In-Reply-To: <55939890.6090903@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: benjamin.romer@unisys.com, david.kershner@unisys.com, bryan.thompson@unisys.com, erik.arfvidson@unisys.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, sparmaintainer@unisys.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 01, 2015 at 01:06:48PM +0530, Sohny Thomas wrote:
<snip>
> >No, now this will introduce a new checkpatch warning that "else is not
> >required after return". why did you introduce this "else"?
> I did this so that the code is more readable and understandable, I
> checked and checkpatch didn't call this out , so its clean.
> 
> Otherwise the above code looks like this
> 
> if(i)
>    return 1;
> return 0;
you should update your tree. virtpci folder has been deleted from
unisys driver.
As you are using an old tree, maybe that explains why checkpatch is not
giving the error.

regards
sudip
