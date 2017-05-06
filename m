From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 06 May 2017 08:40:04 +0000
Subject: Re: [PATCH] firmware: Google VPD: Fix memory allocation error handling
Message-Id: <20170506084004.awyhl2w2b2qnbvt2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505190844.2945-1-christophe.jaillet@wanadoo.fr>
 <20170505195647.GB7351@kroah.com>
In-Reply-To: <20170505195647.GB7351@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, thierry.escande@collabora.com, wnhuang@google.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 05, 2017 at 12:56:47PM -0700, Greg KH wrote:
> On Fri, May 05, 2017 at 09:08:44PM +0200, Christophe JAILLET wrote:
> > This patch fixes several issues:
> >    - if the 1st 'kzalloc' fails, we dereference a NULL pointer
> >    - if the 2nd 'kzalloc' fails, there is a memory leak
> >    - if 'sysfs_create_bin_file' fails there is also a memory leak
> 
> Then it should be multiple patches, not fixing 3 things in one patch,
> right?
> 

I agree with Christophe that this is basically one thing.  Otherwise you
end up breaking it up how Elfring does it into tiny tiny snippets that I
can't read.  Doing it this way is easier to review for me.

regards,
dan carpenter

