From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sun, 27 Nov 2005 21:23:10 +0000
Subject: Re: [KJ] use kzalloc instead of kcalloc(1,
Message-Id: <20051127212310.GD9695@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13767646551273494=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <007001c5f392$4c61cda0$3ec0c756@bureau>
In-Reply-To: <007001c5f392$4c61cda0$3ec0c756@bureau>
To: kernel-janitors@vger.kernel.org

--===============13767646551273494==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27.11.2005 [21:36:51 +0100], Marion Jaillet wrote:
> Patch against linux-2.6.14.2

Please patch against current mainline (e.g. 2.6.15-rc2)

> Signed-off-by : Christophe Jaillet

Signed-off-by lines have a standard form (from SubmittingPatches).

"Signed-off-by: Random J Developer <random@developer.example.org>"

> Desc : use kzalloc instead of kcalloc(1,...)

Patch should be inlined if possible. Also, it's not a .c file (it's a
patch, not code).

Finally, patch needs to be -p1 applicable. diff -urpN from the parent
directory of the source should be sufficient.

Thanks,
Nish

--===============13767646551273494==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13767646551273494==--
