From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Jul 2015 07:50:36 +0000
Subject: Re: [patch] ACPI / LPSS: set an error code
Message-Id: <20150707075036.GB4341@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150703085653.GC11901@mwanda>
 <1480350.L34Aud6LIR@vostro.rjw.lan>
In-Reply-To: <1480350.L34Aud6LIR@vostro.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 07, 2015 at 12:56:21AM +0200, Rafael J. Wysocki wrote:
> This looks insufficient to my eyes, as we leak memory here too.
> 
> What about the following instead?

Yeah.  You are, of course, correct.

regards,
dan carpenter


