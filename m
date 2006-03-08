From: Jens Axboe <axboe@suse.de>
Date: Wed, 08 Mar 2006 10:22:44 +0000
Subject: [KJ] Re: [Patch] kzalloc() conversion in drivers/block
Message-Id: <20060308102243.GL4595@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83404497165533165=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060227193309.GA9991@suse.de>
In-Reply-To: <20060227193309.GA9991@suse.de>
To: kernel-janitors@vger.kernel.org

--===============83404497165533165==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 04 2006, Eric Sesterhenn wrote:
> hi,
> 
> this patch converts drivers/block to kzalloc usage.
> Compile tested with allyesconfig.

Yet you use kcalloc in some places? Please just use kzalloc.

-- 
Jens Axboe


--===============83404497165533165==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83404497165533165==--
