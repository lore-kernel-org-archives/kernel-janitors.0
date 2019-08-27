From: Nathan Lynch <nathanl@linux.ibm.com>
Date: Tue, 27 Aug 2019 14:26:19 +0000
Subject: Re: [PATCH 1/2] powerpc/pseries: Delete an unnecessary kfree() call in dlpar_store()
Message-Id: <878sresn04.fsf@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
 <b46cc4ff-a14c-0c10-0c0c-95573a960178@web.de>
In-Reply-To: <b46cc4ff-a14c-0c10-0c0c-95573a960178@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Allison Randal <allison@lohutok.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Frank Rowand <frank.rowand@sony.com>, Gen Zhang <blackgod016574@gmail.com>

Markus Elfring <Markus.Elfring@web.de> writes:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 27 Aug 2019 13:34:02 +0200
>
> A null pointer would be passed to a call of the function “kfree”
> immediately after a call of the function “kstrdup” failed at one place.
> Remove this superfluous function call.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
