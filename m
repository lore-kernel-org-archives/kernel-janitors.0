From: "Dave Gilbert (Home)" <gilbertd@treblig.org>
Date: Fri, 21 Jan 2005 12:05:53 +0000
Subject: [KJ] Re: [PATCH 0/2][RESEND] acorn: clean up printk()'s in
Message-Id: <41F0F021.4050600@treblig.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============04305093216132172=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============04305093216132172==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

James Nelson wrote:
> This series of patches makes the printk()'s in drivers/acorn behave a bit better.
> 
> Re-sending them after noticing I used KERN_WARN instead of KERN_WARNING.
> 
> Diffstat output:
>  fd1772.c |  142 +++++++++++++++++++++++++++++++--------------------------------
>  mfmhd.c  |  138 ++++++++++++++++++++++++++++---------------------------------
>  2 files changed, 136 insertions(+), 144 deletions(-)

Those files are ancient - I haven't done anything on them in yonks; the 
right person to ask about this is Ian Molton - current maintainer of the 
ARM26/Archimedes world cc'd).

Dave

--===============04305093216132172==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============04305093216132172==--
