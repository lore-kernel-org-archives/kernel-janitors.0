From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 05 May 2017 19:56:47 +0000
Subject: Re: [PATCH] firmware: Google VPD: Fix memory allocation error handling
Message-Id: <20170505195647.GB7351@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505190844.2945-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170505190844.2945-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: thierry.escande@collabora.com, wnhuang@google.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 05, 2017 at 09:08:44PM +0200, Christophe JAILLET wrote:
> This patch fixes several issues:
>    - if the 1st 'kzalloc' fails, we dereference a NULL pointer
>    - if the 2nd 'kzalloc' fails, there is a memory leak
>    - if 'sysfs_create_bin_file' fails there is also a memory leak

Then it should be multiple patches, not fixing 3 things in one patch,
right?

thanks,

greg k-h
