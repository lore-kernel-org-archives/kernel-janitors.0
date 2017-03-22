From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Mar 2017 09:34:26 +0000
Subject: Re: [PATCH] kprobes: Remove an unneeded condition
Message-Id: <20170322092652.GG32449@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170321204348.GD22118@mwanda>
In-Reply-To: <20170321204348.GD22118@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Mar 22, 2017 at 07:55:38AM +0900, Masami Hiramatsu wrote:
> On Tue, 21 Mar 2017 23:43:48 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > We know that "addr" is non-NULL here so there is no need to check if
> > "addr + offset" is NULL.
> 
> What about "UINT_MAX - addr + 1 = offset" case on 32bit arch ? :)
> 

I think if that's really possible then we are so screwed that a NULL
check won't help?

regards,
dan carpenter

