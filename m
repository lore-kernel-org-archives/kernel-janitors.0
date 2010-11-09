From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Tue, 09 Nov 2010 13:46:17 +0000
Subject: Re: [patch] serial/mrst_max3110: make buffer larger
Message-Id: <20101109134617.7786f984@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101025052802.GY5985@bicker>
In-Reply-To: <20101025052802.GY5985@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Feng Tang <feng.tang@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 25 Oct 2010 07:28:03 +0200
Dan Carpenter <error27@gmail.com> wrote:

> This is used to store the spi_device ->modalias so they have to be the same
> size.  SPI_NAME_SIZE is 32.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Ack, added to my tree

Thanks
Alan
