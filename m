From: Maximilian Attems <maks@sternwelten.at>
Date: Sun, 18 Dec 2005 23:29:38 +0000
Subject: Re: [KJ] [Patch 1/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <20051218232938.GA18842@baikonur.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15626888454706367=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134946371.7394.5.camel@alice>
In-Reply-To: <1134946371.7394.5.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============15626888454706367==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2005 at 12:22:14AM +0100, Adrian Bunk wrote:
<snipp patch>
> 
> Two comments:
> - please Cc subsystem maintainers and driver authors of the code you 
>   touch; e.g. sometimes this kind of patches is rejected because the
>   driver maintainer does actually support both kernel 2.4 and 2.6 in
>   one file

well it has alway been mandatory for new janitors.
please keep the entry bar low.
the kj maintainer takes care of feeding the MAINTAINERS.

sure it often helps for quicker patch flow.

-- 
maks

--===============15626888454706367==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15626888454706367==--
