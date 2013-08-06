From: Joe Perches <joe@perches.com>
Date: Tue, 06 Aug 2013 00:51:09 +0000
Subject: Re: [PATCH] trivial: adjust code alignment
Message-Id: <1375750269.1968.18.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375714059-29567-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1375714059-29567-5-git-send-email-Julia.Lawall@lip6.fr>
	 <20130805160645.GI5051@mwanda> <1375719427.3133.31.camel@joe-AO722>
	 <20130805163054.GN5102@mwanda>
In-Reply-To: <20130805163054.GN5102@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-08-05 at 19:30 +0300, Dan Carpenter wrote:
> On Mon, Aug 05, 2013 at 09:17:07AM -0700, Joe Perches wrote:
> > ov7670_read via i2c_transfer can return a positive # too.
> > Perhaps all of these should be individually tested for "< 0".
> You're misreading something.  ov7670_read_i2c() only returns zero
> and negative error codes.

Yup, right, thanks, I skimmed over the

	if (ret >= 0) {
		...
		ret = 0;
	}

bit in ov7670_read_i2c

though I think this function via the i2c_transfer
can return 0 messages transferred as "success".


