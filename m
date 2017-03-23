From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Thu, 23 Mar 2017 00:15:16 +0000
Subject: Re: [PATCH] kprobes: Remove an unneeded condition
Message-Id: <20170323091516.1a41f01703629a0c756d0f94@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170321204348.GD22118@mwanda>
In-Reply-To: <20170321204348.GD22118@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 22 Mar 2017 12:34:26 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Wed, Mar 22, 2017 at 07:55:38AM +0900, Masami Hiramatsu wrote:
> > On Tue, 21 Mar 2017 23:43:48 +0300
> > Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > > We know that "addr" is non-NULL here so there is no need to check if
> > > "addr + offset" is NULL.
> > 
> > What about "UINT_MAX - addr + 1 = offset" case on 32bit arch ? :)
> > 
> 
> I think if that's really possible then we are so screwed that a NULL
> check won't help?

Fair enough. Even if the addr is not NULL, that could be out of text area.
Could you add that to patch description, and also clean up the whole
function? It seems "invalid" label is no more needed.

Thank you,


-- 
Masami Hiramatsu <mhiramat@kernel.org>
