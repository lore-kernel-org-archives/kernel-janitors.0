From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Tue, 01 Jun 2010 10:26:39 +0000
Subject: Re: [patch] cciss: call BUG() earlier
Message-Id: <AANLkTikEOUjD_ztZWVLPZwSTNTLyC9Y8UZLSPyQO4GH9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601070544.GC5483@bicker>
In-Reply-To: <20100601070544.GC5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jens

On Tue, Jun 1, 2010 at 8:17 PM, Jens Axboe <jaxboe@fusionio.com> wrote:

>
> How so? if stk->top = CMD_STACK_SIZE - 1 the current code will not
> trigger the BUG, but it will index beyond the size of ->elem. So the
> patch looks correct to me.


I guess I was looking at the wrong thing, it does look correct.
Sorry for the noise


Darren J.
