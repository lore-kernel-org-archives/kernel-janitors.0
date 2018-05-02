From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 May 2018 08:39:36 +0000
Subject: Re: [PATCH] staging: wilc1000: fix infinite loop and out-of-bounds access
Message-Id: <20180502083935.uw4mxvcgnpayv3h3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180430125040.GA19050@embeddedor.com>
 <20180430195916.596a93eb@ajaysk-VirtualBox>
 <20180430152321.7pq4ol2ed7tzsrl4@mwanda>
 <20180502111735.5a2c6faa@ajaysk-VirtualBox>
In-Reply-To: <20180502111735.5a2c6faa@ajaysk-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajay Singh <ajay.kathat@microchip.com>
Cc: devel@driverdev.osuosl.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

We're mainly discussing readability, right?

To me when people use "int" that tells me as a reader that we don't need
to think about the type.  It's going to be a small number.

Say you have data which the user can control, then it's super important
to focus on the data types.  We don't focus on it enough.  There is some
kind of idea that good developers should just be super focused on
everything all the time, but I don't think humans can do it.  So to me
it's useful when the author tells me, "This an int type.  It's fine.
This is not critical."

If you make request->n_ssids a u8 or u16, that isn't going to save any
memory because the struct is padded.  You'd also need to audit a bunch
of code to make sure that we don't overflow the u16.  If you wanted to
overflow the int, you'd need to allocate several gigs of memory but
kmalloc() is capped at KMALLOC_MAX_SIZE (4MB) so that's not possible.
How many of these structs do we allocate?  Is it really worth optimizing
the heck out of it?

There are times where want to be very deliberate with our types because
we're dealing the large numbers, or user data or fast paths.  But there
are other times where int is fine...

regards,
dan carpenter

