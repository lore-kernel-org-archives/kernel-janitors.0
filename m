From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 20 Sep 2004 16:59:28 +0000
Subject: Re: [Kernel-janitors] [PATCH] __FUNCTION__ string concatenation
Message-Id: <20040920165928.GB9976@v216-190.vps.tuwien.ac.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37861898518315673=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040705120057.GA22161@moley.homelinux.net>
In-Reply-To: <20040705120057.GA22161@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============37861898518315673==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 20 Sep 2004, Clemens Buchacher wrote:

> Description: __FUNCTION__ string concatenation is deprecated
> 
> Diff against linux-2.6 up to ChangeSet@1.1938 (04/09/18 20:30:01)
> 
>  arch/mips/au1000/common/usbdev.c |    4 ++--
>  drivers/net/gt96100eth.c         |   10 +++++-----
>  sound/oss/au1000.c               |    2 +-
>  sound/oss/ite8172.c              |    2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> Status: untested
> 
> Signed-off-by: Clemens Buchacher <drizzd@aon.at>
> 
would be cool to get those in 4 separeted mails and compile tested.

see also "the perfect patch" by akpm
-> http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt

thanks
a++ 

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============37861898518315673==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37861898518315673==--
