From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 12:48:42 +0000
Subject: Re: [PATCH v2] trivial: acpi: replace some bitshifts with BIT macro
Message-Id: <20200727124842.GC1913@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2007241806070.2834@hadrien>
 <20200724161111.17531-1-garritfranke@gmail.com>
In-Reply-To: <20200724161111.17531-1-garritfranke@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: garritfra <garritfranke@gmail.com>
Cc: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org, trivial@kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, kernel-janitors@vger.kernel.org

This is buggy.  See my comments to v1.

regards,
dan carpenter
