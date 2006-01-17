From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Tue, 17 Jan 2006 23:19:05 +0000
Subject: [KJ] Re: [Patch] change if() BUG();
Message-Id: <43CD7B69.4040506@s5r6.in-berlin.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============508500760337806=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============508500760337806==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Eric Sesterhenn / snakebyte wrote:
> this patch changes the if() BUG(); construct in
> drivers/ieee1394/cmp.c to a BUG_ON; so defining
> BUG to a no-op is safe.

"if(x) ;" should work too. But BUG_ON is better. However,

> +++ linux-2.6.15-git11/drivers/ieee1394/cmp.c	2006-01-17 22:11:29.000000000 +0100

cmp.c has been deleted recently. It was an obsolete driver which was 
scheduled for removal.
-- 
Stefan Richter
-=====-=-==- ---= =--=-
http://arcgraph.de/sr/

--===============508500760337806==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============508500760337806==--
