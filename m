From: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 28 Mar 2010 12:20:51 +0000
Subject: Re: [patch] batman: cleanup: change test for end of array
Message-Id: <20100328122051.GA14546@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328114738.GR5069@bicker>
In-Reply-To: <20100328114738.GR5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 28, 2010 at 02:47:39PM +0300, Dan Carpenter wrote:
> The code here is testing to see if "i" is passed the end of the array.
> The original code works probably, but it's not the cleanest way.

Even better would be to use ARRAY_SIZE and remove all the hardcoded
256's.

	Andrew
