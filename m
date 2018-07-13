From: Jan Harkes <jaharkes@cs.cmu.edu>
Date: Fri, 13 Jul 2018 19:08:13 +0000
Subject: Re: [PATCH v2] fs/coda: potential buffer overflow in coda_psdev_write()
Message-Id: <20180713190812.e4rhbaquh2iiktvj@cs.cmu.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712123255.rkcszmwdmrloxaki@kili.mountain>
 <20180713151017.lxbv4eljvd6olziq@kili.mountain>
 <20180713161630.olrwa2n2tnpqbmlt@cs.cmu.edu>
 <20180713190503.eei3axzltm7pt4aa@mwanda>
In-Reply-To: <20180713190503.eei3axzltm7pt4aa@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Fri, Jul 13, 2018 at 10:05:03PM +0300, Dan Carpenter wrote:
> > The proper fix should be to check that we received at least enough data
> > to fully read the received downcall message based on the opcode in the
> > received message header and log/return an error if it doesn't match.
> 
> I just wanted to solve the memory corruption without breaking user
> space.  What you're proposing sounds more complicated and probably
> someone should test it.  Can you fix it and give me a Reported-by tag?

Should not be too hard and I am in the best position to test it, so yes
I will do that.

Jan
