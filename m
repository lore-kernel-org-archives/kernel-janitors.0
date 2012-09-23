From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 23 Sep 2012 16:15:43 +0000
Subject: Re: Did I create this patch correctly (for checkpatch fixes)?
Message-Id: <20120923161543.GI4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFfwLZjWcBf+r_TTrsNTTdmhAHFPSkvmQ3F7nHOr+SV3Mj=_Lw@mail.gmail.com>
In-Reply-To: <CAFfwLZjWcBf+r_TTrsNTTdmhAHFPSkvmQ3F7nHOr+SV3Mj=_Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Sep 23, 2012 at 09:13:05PM +0530, Harsh Kumar wrote:
> Hi,
> 
> I have created a patch for the first time. It is a small change (only
> 3 line change). I ran checkpatch.pl on my patch file and there were no
> problems. But can somebody please tell me:
> 
> 1.) Are the fixes for checkpatch.pl issues correct?
> 2.) Is the patch file correctly made?

I'm not sure what the problem was you were fixing.  Only the third
line is correct.

The patch should be included in the email.  It needs a proper
subject, a patch description and a Signed-off-by line.

Email the patch to yourself.  Save the raw email including headers
and everything.  `cat raw_email.txt | git am`.  `git log -p`.  Look
through the patch and verify that the patch description and
everything looks good.

regards,
dan carpenter

