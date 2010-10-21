From: Dan Carpenter <error27@gmail.com>
Date: Thu, 21 Oct 2010 07:29:39 +0000
Subject: Re: [patch] gdth: integer overflow in ioctl
Message-Id: <20101021072939.GF5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101008070307.GF11681@bicker>
In-Reply-To: <20101008070307.GF11681@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Achim Leubner <achim_leubner@adaptec.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 08, 2010 at 09:03:07AM +0200, Dan Carpenter wrote:
> gdth_ioctl_alloc() takes the size variable as an int.
> copy_from_user() takes the size variable as an unsigned long.
> gen.data_len and gen.sense_len are unsigned longs.
> On x86_64 longs are 64 bit and ints are 32 bit.
> 
> We could pass in a very large number and the allocation would truncate
> the size to 32 bits and allocate a small buffer.  Then when we do the
> copy_from_user(), it would result in a memory corruption.
> 
> CC: stable@kernel.org
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

I never know if anyone gets my emails and so I has a small sad face on
the front of my head here: --------------->   :(

regards,
dan carpenter


