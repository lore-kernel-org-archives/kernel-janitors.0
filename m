From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2013 12:18:55 +0000
Subject: Re: [Patch] Staging: winbond: Made local functions static
Message-Id: <20130530121855.GI23932@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6E81C.2000303@gmail.com>
In-Reply-To: <51A6E81C.2000303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 30, 2013 at 11:20:34AM +0200, walter harms wrote:
> 
> 
> Am 30.05.2013 07:48, schrieb Harsh Kumar:
> > Few functions are used only in one file. They are not included in any 
> > other .h or .c files (I used grep to check). They seem to be local functions.
> > So, I have made them static.
> > I have also inlined one function as it is a one line function.
> > 
> I would leave that to the compiler (personal taste)
> 

Yes.  Modern compilers basically ignore inline statements anyway.

regards,
dan carpenter

