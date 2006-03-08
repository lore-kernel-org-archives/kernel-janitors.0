From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 08 Mar 2006 12:21:02 +0000
Subject: Re: [KJ] Re: [Patch] kzalloc() conversion in drivers/block
Message-Id: <20060308122102.GA26897@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============092910055672370095=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060227193309.GA9991@suse.de>
In-Reply-To: <20060227193309.GA9991@suse.de>
To: kernel-janitors@vger.kernel.org

--===============092910055672370095==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 08, 2006 at 11:22:44AM +0100, Jens Axboe wrote:
> On Sat, Mar 04 2006, Eric Sesterhenn wrote:
> > hi,
> > 
> > this patch converts drivers/block to kzalloc usage.
> > Compile tested with allyesconfig.
> 
> Yet you use kcalloc in some places? Please just use kzalloc.

kcalloc is the canonical form of zeroed array allocations, so there's not
reason to not use it here.  it should have been mentioned in the description,
though.


--===============092910055672370095==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============092910055672370095==--
