From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Oct 2012 11:43:22 +0000
Subject: Re: [staging:staging-next 115/274] drivers/staging/ced1401/usb1401.c:1065 Handle1401Esc() error: dou
Message-Id: <20121022114322.GC7329@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHdPZaPfEFkPmH_46uFQMMU4aiN1RmxFftMk02M58S4Z_CWxMw@mail.gmail.com>
In-Reply-To: <CAHdPZaPfEFkPmH_46uFQMMU4aiN1RmxFftMk02M58S4Z_CWxMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 22, 2012 at 12:42:49PM +0200, Alois Schloegl wrote:
> Hi,
> 
> 
> Please include (Greg Smith <greg@ced.co.uk>) into any communication.
> Greg Smith from CED noticed that there is no kfree, causing a memory
> leak, and memset() has been removed, thus tx->used was not cleared.
> 
> The patch below should fix this.

This isn't the right way to submit patches.  Run checkpatch over the
patch.  (No signed off by etc).  Also it's totally corrupted.  Email
it to yourself, save the email, cat raw_email.txt | git am.  Look
over the changelog.  When that works, then resend.

Read Documentation/SubmittingPatches for more info.

regards,
dan carpenter
