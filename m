From: Borislav Petkov <bp@suse.de>
Date: Wed, 02 Dec 2020 19:51:31 +0000
Subject: Re: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Message-Id: <20201202195131.GD25881@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8eoN/jMAJb3H3iv@mwanda>
In-Reply-To: <X8eoN/jMAJb3H3iv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Justin Ernst <justin.ernst@hpe.com>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>, Steve Wahl <steve.wahl@hpe.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 02, 2020 at 05:44:07PM +0300, Dan Carpenter wrote:
> Return -ENOMEM on allocation failure instead of returning success.

s/success/random stack memory contents/

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
