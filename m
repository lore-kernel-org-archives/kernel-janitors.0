From: Greg KH <greg@kroah.com>
Date: Wed, 11 May 2011 21:08:37 +0000
Subject: Re: [PATCH 06/12] staging: usbip: stub_main.c: code cleanup
Message-Id: <20110511210837.GA4893@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
 <3a932c55376e57a96881a654a0f6c3e6837f400e.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <3a932c55376e57a96881a654a0f6c3e6837f400e.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 01:54:18AM -0700, matt mooney wrote:
> Reorder functions; remove match_find() and replace with
> get_busid_idx(); change other functions to use get_busid_idx(); and
> code cleanup in the other functions.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
> I apologize for this one. I realize that I should have split it into two with
> the reorder being separate.

Yes, please split it up.

> Also, it seems as if there is a synchronization problem carried over from the
> original code in get_busid_priv(). An address into the busid_table is returned
> and then the element is accessed and modified elsewhere. Right? Or am I missing
> something.

You might be correct, I don't really know.

thanks,

greg k-h
