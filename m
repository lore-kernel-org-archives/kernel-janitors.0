From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Feb 2017 06:10:16 +0000
Subject: Re: [bug report] net: phy: Fix lack of reference count on PHY driver
Message-Id: <20170208061016.GO11103@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207105000.GA30406@mwanda>
In-Reply-To: <20170207105000.GA30406@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Feb 08, 2017 at 01:28:34AM +0000, maowenan wrote:
> Thank you very much , there should be pointer checked before dereference.
> 

Can you send the patch for this?

regards,
dan carpenter

