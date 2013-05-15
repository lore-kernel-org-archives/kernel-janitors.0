From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Wed, 15 May 2013 14:23:22 +0000
Subject: Re: [patch -resend] xen/privcmd: fix condition in privcmd_close()
Message-Id: <20130515142322.GK15529@phenom.dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121105064217.GA26179@elgon.mountain>
	<20130515065624.GA20381@elgon.mountain>
In-Reply-To: <20130515065624.GA20381@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

On Wed, May 15, 2013 at 09:56:24AM +0300, Dan Carpenter wrote:
> The parenthesis are in the wrong place so the original code is
> equivalent to:
> 
> 	if (!xen_feature(0x1)) { ...
> Or:
>         if (!xen_feature(XENFEAT_writable_descriptor_tables)) { ...
> 
> Which obviously was not intended.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I sent this last November but it was never merged.

Ah, it was, but in a different branch (stable/pvh.v8). Let me stick it on branch for Linus.
