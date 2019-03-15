From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 15 Mar 2019 14:19:27 +0000
Subject: Re: [PATCH serial v3] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
Message-Id: <20190315141927.GB29902@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190311093959.86344-1-maowenan@huawei.com>
 <20190311121918.GD2412@kadam>
 <566a03ba-aae9-3169-5db3-3417d5eb60f9@huawei.com>
In-Reply-To: <566a03ba-aae9-3169-5db3-3417d5eb60f9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan <maowenan@huawei.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, jslaby@suse.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, vz@mleia.com

On Fri, Mar 15, 2019 at 09:56:07PM +0800, maowenan wrote:
> ping...

For what?  It's the middle of the merge window at the moment, you should
have gotten an email from my scripts saying what happens at this point
in time, right?

greg k-h
