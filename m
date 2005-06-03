From: maximilian attems <janitor@sternwelten.at>
Date: Fri, 03 Jun 2005 17:07:34 +0000
Subject: Re: [KJ] Historic Code from TODO
Message-Id: <20050603170734.GW2386@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90999556537415593=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <92a8b44ee5f03d044b7711aa9178457d@gmail.com>
In-Reply-To: <92a8b44ee5f03d044b7711aa9178457d@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============90999556537415593==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 01 Jun 2005, Jonathan Roes wrote:

> I'm new.  I was hoping to tackle some really easy stuff on the TODO, 
> and I came across something that sounded simple, but didn't have a lot 
> of description.
> 
> In what cases can code that depends on LINUX_VERSION_CODE and 
> KERNEL_VERSION < 2.4 be deleted?  Or is this just a really old entry in 
> the TODO that has already been taken care of?

drivers/scsi had lots of it due to bsd compat layer.
there still seem to be some occurences around.
 
> Thanks!
> Jonathan Roes <jonathan.roes@gmail.com>
> 

have fun. :)

--
maks


--===============90999556537415593==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90999556537415593==--
