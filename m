From: "Luck, Tony" <tony.luck@intel.com>
Date: Fri, 23 Jun 2017 20:48:00 +0000
Subject: Re: [PATCH] EDAC, pnd2_edac: make function sbi_send static
Message-Id: <20170623204759.2op7zhjtfgyqd7db@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623084855.9197-1-colin.king@canonical.com>
In-Reply-To: <20170623084855.9197-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Colin King <colin.king@canonical.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 23, 2017 at 10:58:24AM +0200, Borislav Petkov wrote:
> On Fri, Jun 23, 2017 at 09:48:55AM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > -int sbi_send(int port, int off, int op, u32 *data)
> > +static int sbi_send(int port, int off, int op, u32 *data)
> 
> Tony, were those supposed to be used somewhere outside of the driver,
> i.e., that CONFIG_X86_INTEL_SBI_APL thing?

No.  This function is internal and can be static.

The CONFIG_X86_INTEL_SBI_APL thing is about sbi_apl_commit()
while is still waiting for a sideband driver that defines it
to be pushed upstream.

-Tony
