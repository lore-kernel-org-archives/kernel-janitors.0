From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Date: Tue, 14 Oct 2008 16:25:48 +0000
Subject: Re : [PATCH 1/2] drivers/pci/hotplug/cpqphp_ctrl.c: Convert && to ||
Message-Id: <c62985530810140925r147d99ddufa4236718d6d12d8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0810141759300.20451@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0810141759300.20451@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kristen.c.accardi@intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2008/10/14, Julia Lawall <julia@diku.dk>:
> From: Julia Lawall <julia@diku.dk>
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @disable and_comm@
> expression E;
> identifier fld;
> @@
>
> - !E && !E->fld
> + !E || !E->fld
> // </smpl>
>

What a great tool. :)
I guess you gathered a lot of precious patterns since the creation of
coccinelle!
