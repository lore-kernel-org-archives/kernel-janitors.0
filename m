From: Steffen Klassert <klassert@mathematik.tu-chemnitz.de>
Date: Thu, 18 Nov 2004 13:19:57 +0000
Subject: Re: [KJ] [patch] net/3c59x: module_param conversions
Message-Id: <20041118131957.GB20050@gareth.mathematik.tu-chemnitz.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64154390432670483=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041116181044.GA8698@nd47.coderock.org>
In-Reply-To: <20041116181044.GA8698@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============64154390432670483==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 16, 2004 at 07:10:44PM +0100 or thereabouts, Domen Puncer wrote:
> Convert 3c59x.c to new module parameter api.
> Variables are moved before module_param*.

Just a remark,
the module_param conversion for the 3c59x driver is already in the -mm tree.
Many people route their patches through -mm, so it is in general a good 
idea to look whats in -mm before starting to work.

Steffen

--===============64154390432670483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64154390432670483==--
