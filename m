From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 08:31:39 +0000
Subject: Re: [bug report] rxrpc: Add IPv6 support
Message-Id: <20161012083139.GF5630@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061118.GI12841@mwanda>
In-Reply-To: <20161012061118.GI12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 08:26:01AM +0100, David Howells wrote:
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> >    196                  if (IS_ERR(dst)) {
> >                             ^^^^^^^^^^^
> > Maybe you want to check dst->error?
> 
> Hmmm...  Why don't I see this when I run checker, I wonder?
> 

I haven't released this one because people do all kinds of nonsense
checks for IS_ERR() out of paranoia.

regards,
dan carpenter

