From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Feb 2010 14:04:35 +0000
Subject: Re: bug list: range checking issues
Message-Id: <20100215140435.GL14210@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100215124046.GB18821@bicker> <20100215134724.GA4107@x200>
In-Reply-To: <20100215134724.GA4107@x200>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 15, 2010 at 03:47:24PM +0200, Alexey Dobriyan wrote:
> On Mon, Feb 15, 2010 at 03:40:56PM +0300, Dan Carpenter wrote:
> > kernel/pid_namespace.c +96 create_pid_namespace(26) warn: buffer overflow 'ns->pidmap' 1 <= 1
> 
> What overflows exactly here?

It's a false positive:

smatch thinks the array ns->pidmap[] has ARRAY_SIZE() of 1 and i is 1.

kernel/pid_namespace.c
    95          for (i = 1; i < PIDMAP_ENTRIES; i++)
    96                  atomic_set(&ns->pidmap[i].nr_free, BITS_PER_PAGE);

On my .config PIDMAP_ENTRIES is 0 so that line is never reached.

regards,
dan carpenter
