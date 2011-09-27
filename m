From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 27 Sep 2011 08:03:25 +0000
Subject: Re: [patch] ALSA: usb-audio - NULL dereference on probe error
Message-Id: <s5hd3eme7jm.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110927074407.GA9346@elgon.mountain>
In-Reply-To: <20110927074407.GA9346@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Oliver Neukum <oneukum@suse.de>, kernel-janitors@vger.kernel.org, Thomas Pfaff <tpfaff@gmx.net>, Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org, Daniel Mack <zonque@gmail.com>

At Tue, 27 Sep 2011 10:44:07 +0300,
Dan Carpenter wrote:
> 
> There was a potential NULL dereference introduced in 362e4e49abe
> "ALSA: usb-audio - clear chip->probing on error exit"
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks.  It's already fixed in the commit
61a6a108d15213f5ee06332e1e7766d3860e4453.


Takashi
