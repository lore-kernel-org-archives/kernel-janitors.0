From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 14:15:29 +0000
Subject: Re: [Kernel-janitors] [PATCH] remove check_region from eepro.c
Message-Id: <20040814141529.GD1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65941201204648814=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============65941201204648814==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 12 Jul 2004, Kristen Carlson wrote:

> Description: remove check_region from eepro.c 
> (note that PnPWakeup must be defined to have this code compile)
> 
> Signed-off-by: Kristen Carlson Accardi <kristenc@cs.pdx.edu>

as matthew wilcox suggested rip out that unused "not-really PnP Wakeup"

a++ maks


--===============65941201204648814==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65941201204648814==--
