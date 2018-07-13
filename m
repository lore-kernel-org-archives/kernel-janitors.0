From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2018 19:05:03 +0000
Subject: Re: [PATCH v2] fs/coda: potential buffer overflow in coda_psdev_write()
Message-Id: <20180713190503.eei3axzltm7pt4aa@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712123255.rkcszmwdmrloxaki@kili.mountain>
 <20180713151017.lxbv4eljvd6olziq@kili.mountain>
 <20180713161630.olrwa2n2tnpqbmlt@cs.cmu.edu>
In-Reply-To: <20180713161630.olrwa2n2tnpqbmlt@cs.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Harkes <jaharkes@cs.cmu.edu>
Cc: kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

I added the linux-fsdevel list back to the CC.

On Fri, Jul 13, 2018 at 12:16:30PM -0400, Jan Harkes wrote:
> On Fri, Jul 13, 2018 at 06:10:17PM +0300, Dan Carpenter wrote:
> > "dcbuf" is a union that is "size" bytes large.  We ensure that "nbytes"
> > is large enough to hold the smallest member of the union, but the
> > problem is that we might try to use a larger member.  If "nbytes" is
> > set to sizeof(struct coda_out_hdr) that would cause a problem in
> > coda_downcall() when we try to access &out->coda_zapdir.CodaFid;
> > 
> > The union is quite small so we can allocate enough space so everything
> > fits.  The CODA_ALLOC() macro calls kzalloc() which means the extra
> > memory is just zeroed and it's fine.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: I forgot to update CODA_FREE() in my first patch.
> 
> You also seem to have missed my comments on your first patch. The
> smallest size test is only to make sure we at least get a complete
> message header.
> 
> If your concern is that a userspace client might send a CODA_ZAPDIR
> downcall but doesn't actually include enough data for the message to
> contain the file identifier to be zapped. I don't think this shouldn't
> be papered over by just passing along some extra zero bytes.
> How would we know these extra zero bytes are fine? How does the
> developer implementing this broken Coda client find out that he is not
> actually sending a properly formatted message and the intended cache
> flush never happens?
> 
> The proper fix should be to check that we received at least enough data
> to fully read the received downcall message based on the opcode in the
> received message header and log/return an error if it doesn't match.
> 

I just wanted to solve the memory corruption without breaking user
space.  What you're proposing sounds more complicated and probably
someone should test it.  Can you fix it and give me a Reported-by tag?

regards,
dan carpenter

