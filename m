From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 May 2019 13:23:47 +0000
Subject: Re: [PATCH] mspro_block: Fix an error code in mspro_block_issue_req()
Message-Id: <20190510132347.GH16030@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190510112440.GA22858@mwanda>
In-Reply-To: <20190510112440.GA22858@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 10, 2019 at 03:11:45PM +0200, walter harms wrote:
> If i see this correcly everybody leaving the loop making the function return something.
> I do not know how would do that but IMHO is better to be defensive and end the function
> with a propper return code (perhaps 0).
> 

It's a forever loop.  If we add another break statement without adding
at return then GCC will complain.

I feel like maybe you're saying that you don't like forever loops?  That
becomes a pretty complicated position to take...

regards,
dan carpenter
