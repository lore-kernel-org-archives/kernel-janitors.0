From: Daniel Smertnig <daniel.smertnig@gmail.com>
Date: Wed, 22 Jun 2005 19:53:03 +0000
Subject: Re: [KJ] [PATCH 2.6.12] /proc/tty/driver/* filtering for non
Message-Id: <20050622195303.GB6699@dansme-mobile.smertnig>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54838551092656207=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622190147.GA4848@dansme-mobile.smertnig>
In-Reply-To: <20050622190147.GA4848@dansme-mobile.smertnig>
To: kernel-janitors@vger.kernel.org

--===============54838551092656207==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the comments, I resubmitted a corrected patch

On Wed, Jun 22, 2005 at 12:23:57PM -0700, randy_dunlap wrote:
> Isn't there a desire to use something other than sprintf()
> to prevent buffer overflows?
> (if so, should be a separate patch, not mixed with this patch)

Hmm, I didn't see any of the drivers do this, but it would be definitely
more sane (there is usually some checking in read_proc but that won't
catch a single line overflowing the buffer). 
I don't however think it's critical in these cases, since the information
printed are mostly numbers (and a few path strings). I will look into
making a patch for that soon.

thanks,
daniel

--===============54838551092656207==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54838551092656207==--
