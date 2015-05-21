From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 May 2015 15:04:59 +0000
Subject: Re: [patch] udf: fix udf_load_pvoldesc()
Message-Id: <20150521150459.GH4150@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150520081315.GA21948@mwanda>
 <20150521132156.GG27863@quack.suse.cz>
In-Reply-To: <20150521132156.GG27863@quack.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 21, 2015 at 03:21:56PM +0200, Jan Kara wrote:
> On Wed 20-05-15 11:13:15, Dan Carpenter wrote:
> > There are some missing braces here which means this function never
> > succeeds.
> > 
> > Fixes: e9d4cf411f75 ('udf: improve error management in udf_CS0toUTF8()')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>   Thanks for the patch. Added to my tree. Actually, the missing parenthesis
> don't cause any real issues since almost all volumes have volIdent and thus
> ret gets set to 0 in the previous if. But it's certainly good to fix.

Ah...  I didn't read carefully.  Thanks.

regards,
dan carpenter

