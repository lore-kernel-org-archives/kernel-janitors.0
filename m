From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 05 Mar 2005 00:09:20 +0000
Subject: [KJ] Re: [RFC][PATCH 2/5] char/tpqic02: use poll_event*() interface
Message-Id: <20050305000920.GB4552@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52399267144531381=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52399267144531381==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 10:25:41AM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Description: Use new poll_event*() interface to encapsulate sleep-loops.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.11-kj-v/drivers/char/tpqic02.c	2005-03-01 23:38:09.000000000 -0800
> +++ 2.6.11-kj/drivers/char/tpqic02.c	2005-03-03 10:23:59.000000000 -0800

Ignore this patch for now, as I think it might just be easier to
refactor all of this code into milliseconds. I'm working on a patch to
do this (still uses poll_select*(), but is obviously more complicated)
and will send it on to KJ soon, I hope.

Thanks,
Nish

--===============52399267144531381==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52399267144531381==--
