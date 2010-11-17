From: Greg KH <gregkh@suse.de>
Date: Wed, 17 Nov 2010 19:51:38 +0000
Subject: Re: [patch] Staging: speakup: free after input_unregister_device()
Message-Id: <20101117195138.GA13892@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101112050835.GE3533@bicker>
In-Reply-To: <20101112050835.GE3533@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 17, 2010 at 01:42:22PM -0600, William Hubbs wrote:
> Hi Greg,
> 
> what is the status of this patch?  I have looked at it and should
> definitely go in.  Should it go to your staging-next tree or Linus's
> tree though since it is a bug fix?

It's already included in my "staging-linus" git tree that will get sent
to Linus on Friday to be included in the .37 final release.

thanks,

greg k-h
